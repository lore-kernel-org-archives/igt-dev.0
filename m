Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0452ECED63B
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 13:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC45F10E4A6;
	Tue, 18 Nov 2025 13:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OptQ2jh9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1C410E4A7
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763472320; x=1795008320;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9ntV/NDsvtGQ8kEOkTgCoDEOA0VrSZPwK93mSwEXhNA=;
 b=OptQ2jh9yQoF6yB5fpheTt0L3a5DoHOB/Fj0qDKmioMuBM3v7yuZQhQa
 72o/kLU017JHfI5eCoiK+U8xB/ANu9E2BPo/MtjQ0LOWW7A0D9qLC33Tg
 F4IOsKX7IkjOlbKJpcRbUNo+Cy6QB9rEtKTQLa3vnG9AzIw1v/GFzCoyB
 eUnZdHd90wM0DkYYJ1Ft5dnumSXJv9mAipmYgi+SU8kpS0hv/qAtUTYZb
 EWFZ0N2L4CJrV9XH1cQKTPdihrRshKAGHrjrVjw8ZLlx0NzzwzpgUCmZn
 lnEoX06yPU2Wr0vPN27pFBNl/mZAjbKbJJDdGmHx7hU1BAqs7h1Hr5BRH A==;
X-CSE-ConnectionGUID: KYs8ELf6QfS3RIR0cVd+/g==
X-CSE-MsgGUID: Gf0QMmbfSJ2/KmdAKkMhDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65392405"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65392405"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 05:25:19 -0800
X-CSE-ConnectionGUID: waEv4TVJS4+Ra1m4TRE4pw==
X-CSE-MsgGUID: 9wYrxLtwTrKAZfmpR7s0zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="214150789"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 05:25:19 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 05:25:18 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 05:25:18 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 05:25:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THRTRR90y5ugmS5jCsPWg13JAcQoQUj4UVshNeRu805lMpZa8i+VtDOesQXyulmiHLxqZQkup0ht9fb/JDOZpaYDHyqk9YDokrHSE2sqD+fP4N1V0xKIAUYeOrH4tCNqzf0sc2Pulm6NCVOGmC2GqWshz4uHTf7zaIelNeoha5Zvm6zX9qGAWeeevWHB6G1TXzp1psls11vqB2NS2BkCv7DZwou5qhphgj0lcErvej/lU4bbhS+kbjIGk966rOzJ6U7gG2cxNYOv80Zh/H1HdoDs8c8F1Gum/pKMq/Lo0FV9cytMxcEmO9g31AlnjNiLOw61D55GT36ubiQWcGIg+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GAXMmj+dT1qSeeBO9u6+sJynH/VqJC5FyFmrPJkKAQ=;
 b=RD9xzG6AGyQNXetOmRy3dnyXlrhU0HYNvY8cw9nr8gHEAvBeda3vc4D6s1D84gmfnsGrv1NZhdhEFiaPml7AkiPqzxJo1n8/YNhdcpdt+TrCZVZ9whZjS2VC97k9QTBeNktAbYbYDtcx9ucn+uVYaX9IPZ9cdnCJR98DWljgRDkYp4iI0c7yML1RI8XuEdAbbX8abY1pPuOfOnQFIw+ntr4hD6EmbC7eXDY0Nwy/FBHVW6BqWNqABrycaKxD35oXN4NZ9mtKqw/di1QxYxEP6cIF8jO5poGtvnNsibhlPHntPcW+o/k9IZ7cpLxCTmEJOX43JEACOmxB68UfGGctQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by MW3PR11MB4745.namprd11.prod.outlook.com (2603:10b6:303:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 13:25:16 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 13:25:16 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma,
 Nishit" <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v7 02/10] tests/intel/xe_exec_system_allocator: Add
 parameter in madvise call
Thread-Topic: [PATCH i-g-t v7 02/10] tests/intel/xe_exec_system_allocator: Add
 parameter in madvise call
Thread-Index: AQHcVMIQZ1cDcpovYk2tEwBJGKgdkLT4c9GQ
Date: Tue, 18 Nov 2025 13:25:16 +0000
Message-ID: <BL1PR11MB5525AEF32ACBA19CC45E530384D6A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20251113170456.635343-1-nishit.sharma@intel.com>
 <20251113170456.635343-3-nishit.sharma@intel.com>
In-Reply-To: <20251113170456.635343-3-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|MW3PR11MB4745:EE_
x-ms-office365-filtering-correlation-id: 873de75c-a380-49e2-a645-08de26a5e99f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?49ZLtp76GtcCXItyN5v8aV5p5J0zZqHdz8Fk+RSE7LNO5Czn2cyRsmddHY0c?=
 =?us-ascii?Q?X7wmjFve+PawOwVaYHH5ikScvp2b9tt5RovaL+AM1gTnk65bEQd4lXV07XGX?=
 =?us-ascii?Q?Q1WcqqNnWBHsGsbfFpvP2g4HHJhu6poQ3gWwX7VfP+Fr6gzpDrYbJyQZ7gkE?=
 =?us-ascii?Q?YjAWJE6RmvVPvmMLCuWAq/JeR2yLkT9AJJzlKO3jQ/ovYdquzTkDHLv0vKY2?=
 =?us-ascii?Q?DKk8TcG/zmgmvfHCsVcoGsMB+ZxRckRwxwI9SZvni1oC1lpucYOcjnu9lh8A?=
 =?us-ascii?Q?wc/TNd6MFGgJd7tUqULv6RFARRGQ9qkLMPOZoX6wWUWJDcFmlx54RbZWs51i?=
 =?us-ascii?Q?NyC24oCQXu5g0eryKiywPGB4m4iJSmlKcJzujOzB1o3GChat6U/7yoEq5DaA?=
 =?us-ascii?Q?ibwkfDtz3RIomM5vU4n/q5MAYIBvCH+SDSDY5PFmOPgAS8Cztp7Eq4ybKsJm?=
 =?us-ascii?Q?EOJUSRLlNYxhUNF3cUYVN0UVxfjUeU9hslvipfLfyPLlP5zRirT89T7I+S2o?=
 =?us-ascii?Q?IoN6cnjL+bWt3enEtQlmumPnyKlj0jf9UlOomcfVB3FqBkOiwiyTdaoDJsi0?=
 =?us-ascii?Q?qDIFSv6h+9nI/IXDp31FpWMmIwoaetVW+t30qFLf9RZ0mIhzHyGgGjzXjaqC?=
 =?us-ascii?Q?c449IGcovmbckJb3T7QJeGqWKCf2g6H4BPp2nrrwneCwbbCrdJz3fKYcl9Xy?=
 =?us-ascii?Q?bdFpZ/29wNC9EfY3gUPU3rMZYUe0FHqs++SJMk5KSDhdzRIZ/LGn7Lsyn7AR?=
 =?us-ascii?Q?9ZHH9l9HiWnaOz+s+xd9G7A/WJZ6KYTC6LYQd9D4y3P76sRRkM6mpUKVraXT?=
 =?us-ascii?Q?eNKLwe/WN7rUssGfDRPhHgNkThK78ZvoO0q6gTT86yvoHlalWKva/xo14i5Q?=
 =?us-ascii?Q?vhELEGY5+DzSI+ZKJgCHr18NfSQ21ei5Ob2mHFIxt9yPTL2uGtIGT9vys93I?=
 =?us-ascii?Q?wXoBix4/asSb4HWL4Cfv1LtKmakSxbs2jRjpeAcpQMlWq2Dl2aX1j5i7Hm95?=
 =?us-ascii?Q?u02e34ncsiNPd9yZFHBgHfHr6lhdkj0Kwn3/W1/rda9JmqDtP992XMWcq74M?=
 =?us-ascii?Q?2w9pPdUuNOhZTTGs6g6XSm+G4XuESsQbjCyt4pNAm0d3+rdshFWaJ5ekLYpw?=
 =?us-ascii?Q?1GnXpYWLP9blITs4o0W3XNqJjdkniE30+TjUFRZ8zKDAlR0m5VHGPxH/q7fr?=
 =?us-ascii?Q?LAhz7WU1XrfHh5ZYeqtrmzDSaeTBOfMwuBB2+IRqFh7un8gB2sRFeCMLpeKA?=
 =?us-ascii?Q?SC+6A+IN5J8Gm9lZKp/DOPfPnZPRs9VE2zm/7+cG8NEoZAmvvuVkEOCwPWxA?=
 =?us-ascii?Q?49Nk/REoeLkHE6iYQ+76q7q+ctjkPnLUElA6jzyaZ7qXAWE8qDf0SM2O0HN/?=
 =?us-ascii?Q?aNcsxoF2ja2Ls8tfM3ScJ69xS6V8Zej3UYQleh9lJgeT7T/hQAbxfKxa/QtF?=
 =?us-ascii?Q?tr/SU4Kf5IGrx81kZ6DlTreY3FNpBbGve5DwQbR++GQFMPyl7PKtIPoMvGih?=
 =?us-ascii?Q?GU2TfakVuhnpp7C7Mc8U4N+v9V1bIA1BA7K4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0xJg+qiKLW6THmab7gTE2jmgyoJ+hlpcjJ1bEmIRE3zzgKSXGSMHOA3MyAKI?=
 =?us-ascii?Q?S1KkrIDO5hg8kOnSfeuQE5Rgx5/3Fmjt4eDabG//lSw4ctdNMa0V1ruforPs?=
 =?us-ascii?Q?FTX376qaRxkqOk1UCif9Ugdl/y32Iz7OuEjYzJl6ZFNrkHmtMyVI1JBshmqI?=
 =?us-ascii?Q?n0JJ9AMaKkd23ytU+J2Obj/DNlr2Tp1+5u/aUC194fz8MwpSZ9nJC+Agv5t8?=
 =?us-ascii?Q?kcqN+Qcdeua3diGe7dbkjWvBFM2wtFXQDDOxn7lxi/KC7FtiM0h68J3B3oy+?=
 =?us-ascii?Q?WpDP1No3xb8YJoQZar2gySXgCgdfdPYshibrJCqSZqIi0KaCvQobzC8gyEYJ?=
 =?us-ascii?Q?kWcX+0nnC2KfzZ6Ix+S5DB81vSI/UiPispKAcN6+m/6sPmoX+XHfIlZ9w/jb?=
 =?us-ascii?Q?JLlzXMDK0iwD0PVXO/PTdoHnkKYSKLEkhU4ld5VVzICLwGaaU8XIiV8dX1Sv?=
 =?us-ascii?Q?2Dhz5BUrjuH+wZw61appGTaHx7mtBsLZewFdkt+CThtsfkv9wGPGzJdMYsUV?=
 =?us-ascii?Q?TeCntk+ZLtFzJPMcNzF2XVqghyQXtw8QPbz10Wfz/boZYC+mXOplD8tu9WD+?=
 =?us-ascii?Q?KM2m24VF3Zmk1/h1MY+B/YHSrSUnXvW0G7KqCl8PtnbJ+p5PBrLO28m7mx5V?=
 =?us-ascii?Q?O+4pD1iq5RM/wSVhJKSfgh5s5pc8Wzr6T70Psep54CAkD3EwiE3x0BtYUKA2?=
 =?us-ascii?Q?CzJpRus/Mmh6T86t9soT89Whuj7TvYgBBKD2UYYDIbLrYDLS7bZQ4IyK4PCr?=
 =?us-ascii?Q?fwzMATqGgduFD4B5Q1XQtgdG7FeP8tIu0L2a01CLjswGu+Tk8GZmg52LsQdz?=
 =?us-ascii?Q?WBH/WoXmdEEP7BSGbhM3Ra4ilm7WumvOHpcJlWBRvUkxfrygiobNMKBI0XXA?=
 =?us-ascii?Q?kREYAbnkb0FvBdTr2BcDlsLhGMz2wYagYHoHN4mai35kQ5jWBorCX7TybA3+?=
 =?us-ascii?Q?7GgBA4F+muIxuxARDp9e653oP5oqmDIx5encUmzCdFb16sUksL9A6Va89/Rg?=
 =?us-ascii?Q?pc0E7fjo1k18zjOlgIB5ezn1NfqdUo+OgZbxBFqA0cSW+L/zmkaKtarP5a5p?=
 =?us-ascii?Q?DG7bXgd9OPnKF4S6aYz1tI8Z31ng8jthoznFF47+gOwQjlKni0fBusRESVUS?=
 =?us-ascii?Q?Ds3ITKwbMESb58ZRqsfqEMlNEPoWxS328FBpZvfiZf5nu8GA78/fl5Civ07n?=
 =?us-ascii?Q?LMZOkbHcMZcYSQDC2egxwOo5iSxouF6xduxB7UNRbt6f3UYIwQ1IBmLH3/WY?=
 =?us-ascii?Q?ojXssibPnEbvE8YA7auiqql/SBw77fitcosrJ6Zao6qmoVP8RyHwnk7y15Zo?=
 =?us-ascii?Q?idxmXiwrDQE9c+/Zjaog2h9XJJ39Xb51n/5nNDs1v9Z1SXC6bLw0suRbcsDy?=
 =?us-ascii?Q?coLdv/CIyLzA4N25XNx98UG3xRxrsMppVJsxuK1BRxIB3SkOkHlzFZrmskRl?=
 =?us-ascii?Q?kYamTXx4ZmAJgdnYg59qVtpBhAWIjmZMYjrTzT5Uq1qrtv9MaoIxbZE5t+OY?=
 =?us-ascii?Q?WEHPd/x5pej+Iq6vHRkjpdLIuRZ8TkqD22zMLwM15R2CElcP92oWinz2DDfS?=
 =?us-ascii?Q?FLF7Swhoz9iMtehl9BGJTVNNEoiDmiQb/ad8etps?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873de75c-a380-49e2-a645-08de26a5e99f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 13:25:16.3769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JR1AaXQ7H+947/nRbh5247DyWXerh1Autn8J/5mWaSK8/p2WBscMaMMvO09WMNMTY8JXeGvFyMPobG9FhyTTiQNiwLmWPwfzfzJym8rp7Oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4745
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> nishit.sharma@intel.com
> Sent: Thursday, November 13, 2025 10:35 PM
> To: igt-dev@lists.freedesktop.org; Sharma, Nishit
> <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t v7 02/10] tests/intel/xe_exec_system_allocator: Add
> parameter in madvise call
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> Parameter instance added in xe_vm_madvise() call. This parameter addition
> cause compilation issue in system_allocator test. As a fix
> 0 as instance parameter passed in xe_vm_madvise() calls.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_system_allocator.c
> b/tests/intel/xe_exec_system_allocator.c
> index b88967e58..1e7175061 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1164,7 +1164,7 @@ madvise_swizzle_op_exec(int fd, uint32_t vm,
> struct test_exec_data *data,
>  	xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
>  		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
>  		      preferred_loc,
> -		      0);
> +		      0, 0);
>  }
>=20
>  static void
> @@ -1172,7 +1172,7 @@ xe_vm_madvixe_pat_attr(int fd, uint32_t vm,
> uint64_t addr, uint64_t range,
>  		       int pat_index)
>  {
>  	xe_vm_madvise(fd, vm, addr, range, 0,
> -		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0);
> +		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
>  }
>=20
>  static void
> @@ -1181,7 +1181,7 @@ xe_vm_madvise_atomic_attr(int fd, uint32_t vm,
> uint64_t addr, uint64_t range,  {
>  	xe_vm_madvise(fd, vm, addr, range, 0,
>  		      DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> -		      mem_attr, 0);
> +		      mem_attr, 0, 0);
>  }
>=20
>  static void
> @@ -1190,7 +1190,7 @@ xe_vm_madvise_migrate_pages(int fd, uint32_t
> vm, uint64_t addr, uint64_t range)
>  	xe_vm_madvise(fd, vm, addr, range, 0,
>  		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
>  		      DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM,
> -		      DRM_XE_MIGRATE_ALL_PAGES);
> +		      DRM_XE_MIGRATE_ALL_PAGES, 0);
>  }
please include this with previous patch=20
lib change and all callers should be in one patch
--Pravalika
>=20
>  static void
> --
> 2.48.1

