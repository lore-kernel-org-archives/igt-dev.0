Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBA3C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  8 Aug 2024 19:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCB710E7F0;
	Thu,  8 Aug 2024 19:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EY0tsm8A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5984E10E7F0
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Aug 2024 19:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723146347; x=1754682347;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8xAMP1+UnaDyD0fj2qE2hnzZdU9wBxLYw6NoERrTENM=;
 b=EY0tsm8AAStw1ISjFv5ruCCBOHpQd7HSi+kzw7/8qi2V5zMOHIGzRAV2
 h/4hO4zQprsVYQemy6K3B62qakpHc6u6AtsFKAvTHx2PT8ZPma6CjhqQb
 r++lwb4XP+F2Pwy0fDrv/IeBfqeuHQoZvrVCeHXgR8YswidB+jGvTeAzP
 baiIifdHbGkdAqdvVvhNm84rlZyN1KP0oo3EJOKyv6hk96cOoCN4+FNZK
 +4ARhahfVC+Nm7Fv5JJaEII3+BexzOXVaLdS0RdnvcCjLObxIMEgvsiQh
 tiqeajHJ3UiJepGzsLFz0ea6zlJRAbailSIh3+krfQ81p+U4J4tiJBOmT Q==;
X-CSE-ConnectionGUID: ySRCvx/wScyptS4oQqKnUA==
X-CSE-MsgGUID: Hxdiovz0RxqGc5OInFLDWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21452634"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="21452634"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 12:45:46 -0700
X-CSE-ConnectionGUID: TZi459cqRgSpw9sVIShxsA==
X-CSE-MsgGUID: KE7WxNEyTeSZyxepEQhdUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="57885035"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 12:45:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 12:45:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 12:45:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 12:45:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 12:45:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQI82hWJzh+GqIhRx43rNvjLH1sq5i/CRKDFiEqBHkMhMdhgwvSWrXvizWOiqZAQQGJiqAKBgBXtlJU7fZ8f5Lx9OQNMQ3sL5vppRbfZVrEoS+Ilr/fLcjYVK+rnIIihSHkPinbfXchwa3Y79bclaVf6weusXdj4MpB0geTAR3fRP6OPJYzRA4fmgAxcVXIps78SQHoNZltFCtUwd+H5xZCB5jXM2Zk4uN1gnfH01zk+q/mcnbckm8I3YcxWH+Pt5FyKBo286O6A3M1XsSAjL9EFjbh033ja1HjRcqew4VKMPxir88aznnhId1FX6Bo82iW4cOM8/ORA3d/Cy1Vjew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcBSaBV6og6ByMMopp0uSr6QZEg/KJzSEQdFwcFaW0Q=;
 b=O0yPjL9/yvWGo1viaK3owwiyziTQZROVdb8gF2OCbe5k7I9k1Ugw5W4+KKiglnGQ1Z/fRAe6GLEip7zgCZFHSJgwFjT/i1ftheobB729EudNxj9JQZKldYnvNsFtYcHL/iHyjEzIp8h2HTSVu0s+2LsDjkzmw4hyxIgbiLLmPPikYK7sKSFwrNH05sZd143Y7x0WxBvfKVQDNtVJj2ijKvmrbSVTa70I1WxjHdkuKOrNoY1GT6O8OdnlSDIKqemNL+QMpg0bLteazxxCR3hbN6ruFZHzQKN8P/bZuBdgjlcf4PGuwCc8rp5X8WVYR73dnEA4tJIWlXNW3wKp/3BBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW3PR11MB4715.namprd11.prod.outlook.com (2603:10b6:303:57::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 8 Aug
 2024 19:45:40 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 19:45:40 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_oa: Add syncs-signal test for OA
 syncs
Thread-Topic: [PATCH i-g-t] tests/intel/xe_oa: Add syncs-signal test for OA
 syncs
Thread-Index: AQHa6bmlEg+WvBGGNU+Ki8fz0wdXCrIdrqLg
Date: Thu, 8 Aug 2024 19:45:40 +0000
Message-ID: <CH0PR11MB5444FD2431AD19E5140CF7ABE5B92@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240808173632.4027344-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240808173632.4027344-1-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW3PR11MB4715:EE_
x-ms-office365-filtering-correlation-id: f7210907-7e5b-49b5-a90e-08dcb7e2aee5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?JiZAxeCPnAwa4hAxHNN9rXMzCPyUkTgIEuKv+Yp6STlV+kaXAHazojhRjj/a?=
 =?us-ascii?Q?cc/XJzqPaDInBcCU1wW0VM7SRBH4I713z9/g/NwZStjNREhHJ0gP0nk+10yy?=
 =?us-ascii?Q?jCboyeTqG1Pea/GJTm7aEMBfUid/oYsJ/MNzfcOwhh1WzhvIAtVLtFloFcYn?=
 =?us-ascii?Q?faQgAtBRtFLAq0+1LeG+bH1B2Z5t4Q80GGqL2b31ghcQ/VJHuLbs4upUlqWe?=
 =?us-ascii?Q?XbYNVlyciIgTbUs8inaZtqphUMP1xxapFhLFdUFrdPJHs686PhehkChEU2vq?=
 =?us-ascii?Q?edDdXk3cXvPuPp3AI67tWQejHOV6xFUudfNQ/ZmsdaqaKgj5+Fdfn/Ou5tmg?=
 =?us-ascii?Q?KZp4jZGlaztXitLttLtMGT2Kyj9/cbTjpuRXkm49TEJCBW6ZKOwx19s8bGvQ?=
 =?us-ascii?Q?Zy+0iCsq3zaupa60b9/zCalLrxdt2tUoA7OVAiNoKVNwdtB6gjOPDMIljmkJ?=
 =?us-ascii?Q?uQvPGbeDjRBwB6dm2xe+z6TLF8+OhCRhhNbvw2mJOzqvRYP0TgBZBODC8TzN?=
 =?us-ascii?Q?VcXM78Qyckn6uT0LtS83MD3nEMlLIcXEBq934OeorynCCBPLb3QW8BWQXK5P?=
 =?us-ascii?Q?H47/ZVYgJCWUuQQmyYzy06a1zELlJE8QyUEVl1dmHK8R0LP0UNk0unKdt/5U?=
 =?us-ascii?Q?LeoVBcyhtd36h3i/cKCtVAC5mRYAhVWtCPU/XcAWJODvsCjCX0SWKj6Wtm5n?=
 =?us-ascii?Q?hcYt9ibEj8JiMoRXV+Ff0qozYCwnBdzpFI41TNskXcCHLANeACeKNMaoOqz7?=
 =?us-ascii?Q?Uvcpo8pm4OW1SciY9ge5rKUFiX+zXCOWmc1eTvEK8BWXlE5cPV/xhSqL05iQ?=
 =?us-ascii?Q?ncjOmBQa3ofdffZdB/IgwE3SC9IS+N3Swu0o/0eS/RL1RhQK0DDt9zSJpVYK?=
 =?us-ascii?Q?Ifhb0bu4jOLPL2njhJRDT+/wpO20SToATJby/oI/ULQW7yHEt9djZ8roWIkE?=
 =?us-ascii?Q?O6EjxNMKSpnJBQGRNUfDVpMgk9C15bU9hpx3a8ZdX9HfdYE3OgARYMNocAOv?=
 =?us-ascii?Q?CyPc85LorOj0zePwo8/mZSeejS9iXS624b0umJ9H+FifjoCsGnKmIuKLgmSN?=
 =?us-ascii?Q?SqTaZHhCu41Nb3exPmMO/CLOyYko1WcvpMxxCFfY4iZUsG29NbL8PYFztYFc?=
 =?us-ascii?Q?ZxEXMTp+QZpO56FTXynWsZu2Op7llCddGRu/Bo9bePvqXbEkCqAhwxJ4bsV5?=
 =?us-ascii?Q?lSD0caE5WkQjnDpvljLs9X2grCVblKRCIhnTvBLB1dRhi9fxDxwuXtMTehh4?=
 =?us-ascii?Q?lczznfdXAscNbWHtGT56upLrzke6sctVz8wsuJi/AsoJTLgIahVLdmSy99or?=
 =?us-ascii?Q?LEj1tL5yj0okmu0I9qREk7eT/Lg4MOS3IqP1Wl88PI83OMVhcL8n+A8RtDZl?=
 =?us-ascii?Q?x0kZwzDzehaGpBM/9arecxr9ASIzGP4Vxgdh9lCvDIjSDEu1Xg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NI+lNCyeGbXn34TxGB85SB8721j/+sDdlkFFI2LPAtziBqJiFBmDU7vol6rH?=
 =?us-ascii?Q?6tvKq3ucWH3ubT7CMlywBammIMWyUD9N12fbMwXAteLsmNNqHa4S1DK4H0em?=
 =?us-ascii?Q?0v15BqT9HRF0tjxJT4cmQU26iO2nUZAB6uJMfrNq/d8P1RtJghN7FFV7youo?=
 =?us-ascii?Q?s2BVW5XSDpHGvRo02KEWX4ExI7XcAJHd5yrP53omZdY2c04p1+pQaszYOHvS?=
 =?us-ascii?Q?c4AnQimpPjFfBQoqecAQklEdc2j2JkqkgHGI0ZiVWAhAlXUPcSjubGElbaCm?=
 =?us-ascii?Q?bAcHBq0+wcLULjZ3TjrmpvkKxi2IvPpypjka4PLeFUKJoBjTr6kRRD5oECPT?=
 =?us-ascii?Q?fS5HWqhp0S8T/Zaam3O+bV9xypjBrpoT8DoatlJi+Q4ehGU+7Z7lweTyBb5o?=
 =?us-ascii?Q?VM9qOFm6ojnIMbcIciziw31r1p6k1qP9BPHYTG94ootg2cBNbpATWPLfmvFW?=
 =?us-ascii?Q?v2OYdhvsjVAk6s15VSzX4c0VrIL8tiv43OtvbzHgpfX32wvOOb32X/i9znf3?=
 =?us-ascii?Q?fh4AX3/rOKuRC/zk1xoCUMwqmavQ3b/DdBu1hgc/yFLTxQLCSPa8Vh9ytTXo?=
 =?us-ascii?Q?I0TYpdIk24majsW0EBg4YMCJ8cXGmSguZSC0nrPUTfW4VrSq0cvR/wqyGGdd?=
 =?us-ascii?Q?xZj8aZRIKUl4ynqa1eMoUbWebUNcqxnFpGhp8A8AvJS/FabnNaQqgzZnkaCJ?=
 =?us-ascii?Q?VnVfPGiIYAZibuU5tzk1IY3R+OxvmGaInFdSZhMvWohHx3pvis8R+fPhP/0D?=
 =?us-ascii?Q?uoJU+uQ8M2ieBzgS5cDjFSFhwwUZkyhOwuscC//QatNd3NfqvbaOfqEYvbn8?=
 =?us-ascii?Q?9k/jOQjp9GqFSqqu6a3LifCFQmTm+26C+H34Vh5wbs4ujSH7RfIa52guzZ5h?=
 =?us-ascii?Q?faM0U0edwYG48yOrZS6lt5fE3S9bJsXrCNch0AMjPbJp3CgFd1XG6y+mu6uj?=
 =?us-ascii?Q?ZLfoihRTj1CjHZAsRKyt/5UeGyYcu8wozegUhR4a6QHLrivMHSsgRarffpRj?=
 =?us-ascii?Q?XIAYlEGoFyaHKylxsDw23oeX8rRb6K07GpZrBBPQPGBsIy+4lLljhjowT6G6?=
 =?us-ascii?Q?da4Cj3SYfzB8F/fKB2kZoogvQMompIwq9B7jRpq5LCgwkU6wIK0RDOCPaoQG?=
 =?us-ascii?Q?tigZolj+zA9+iTx9ZMlJRho/hvo4UE558/dzfYRjhvWvP4FPmeaz5DBe9kqy?=
 =?us-ascii?Q?BsNttnSZhWfaJJNCGaBFI1uqkJ6AcqUZZEwpOTDPjveGqa46Ci/fgYCdxWti?=
 =?us-ascii?Q?6MsmYF+oKXU679Rq7JCCx2n+hOBTUSRYApcX7+me2zTMne/I0+ZoAt4wdftj?=
 =?us-ascii?Q?+VKZ4Uqg+k0ERAIfOeitagOwNVW7K7TX1m8VF6QgX5GIg0jXRMGo7wnFHc85?=
 =?us-ascii?Q?ruyiYAinp5rWbh7ne5uAjiGvokWjZTJrm/29sr3WvO/bDjyJUQK/F4j/dZdV?=
 =?us-ascii?Q?emZIxSeiAy4nKI1kShOwYbBwXs/+W0zrrV4QCNom4y5meklRKA3MdouAO1G+?=
 =?us-ascii?Q?AVk+Vfs6u8gQK2X6e6EepvTBWb+A65URa3UobtgfvI40kWKzgUrGBfCHO9qD?=
 =?us-ascii?Q?gXfQYpBHiivDIxam3S3s5397hjwNtO+T8ajdVXeU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7210907-7e5b-49b5-a90e-08dcb7e2aee5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 19:45:40.4334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SuUHMWdSjFrsrWbx5DcTlOoIRRQhR7lUmJqqtm+9n7aJsA81FNS8Mox7ef1p6HZV7ZtezCsNSTU3yZ7PlrEbNoUeuQDgCsZLouJB2sRSKMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4715
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Ashutosh=
 Dixit
Sent: Thursday, August 8, 2024 10:37 AM
To: igt-dev@lists.freedesktop.org
Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Souza, Jose <=
jose.souza@intel.com>; Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_oa: Add syncs-signal test for OA sync=
s
>=20
> Verify OA syncs signal correctly in open and change config code paths.
>=20
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

I have a non-blocking suggestion detailed below that there may be merit to
separating the "open" and "change" code path sync tests into two different
tests.  Although, I may be misinterpreting how the test works such that doi=
ng
so breaks the test due to the sync on open being necessary in all cases, so=
 feel
free to disregard.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 12 +++++
>  lib/xe/xe_oa.c            |  6 +--
>  lib/xe/xe_oa.h            |  2 +
>  tests/intel/xe_oa.c       | 97 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 114 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 29425d7fdc..f9f0d706cf 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -1632,6 +1632,18 @@ enum drm_xe_oa_property_id {
>  	 * to be disabled for the stream exec queue.
>  	 */
>  	DRM_XE_OA_PROPERTY_NO_PREEMPT,
> +
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_NUM_SYNCS: Number of syncs in the sync array
> +	 * specified in @DRM_XE_OA_PROPERTY_SYNCS
> +	 */
> +	DRM_XE_OA_PROPERTY_NUM_SYNCS,
> +
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_SYNCS: Pointer to struct @drm_xe_sync array
> +	 * with array size specified via @DRM_XE_OA_PROPERTY_NUM_SYNCS
> +	 */
> +	DRM_XE_OA_PROPERTY_SYNCS,
>  };
> =20
>  /**
> diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
> index 4764ed1fcf..b1a9ff7fa4 100644
> --- a/lib/xe/xe_oa.c
> +++ b/lib/xe/xe_oa.c
> @@ -1027,8 +1027,8 @@ const char *intel_xe_perf_read_report_reason(const =
struct intel_xe_perf *perf,
>  	return "unknown";
>  }
> =20
> -static void xe_oa_prop_to_ext(struct intel_xe_oa_open_prop *properties,
> -			      struct drm_xe_ext_set_property *extn)
> +void intel_xe_oa_prop_to_ext(struct intel_xe_oa_open_prop *properties,
> +			     struct drm_xe_ext_set_property *extn)
>  {
>  	__u64 *prop =3D from_user_pointer(properties->properties_ptr);
>  	struct drm_xe_ext_set_property *ext =3D extn;
> @@ -1065,7 +1065,7 @@ int intel_xe_perf_ioctl(int fd, enum drm_xe_observa=
tion_op op, void *arg)
>  		struct intel_xe_oa_open_prop *oprop =3D (struct intel_xe_oa_open_prop =
*)arg;
> =20
>  		igt_assert_lte(oprop->num_properties, XE_OA_MAX_SET_PROPERTIES);
> -		xe_oa_prop_to_ext(oprop, ext);
> +		intel_xe_oa_prop_to_ext(oprop, ext);
>  	}
> =20
>  	return igt_ioctl(fd, DRM_IOCTL_XE_OBSERVATION, &p);
> diff --git a/lib/xe/xe_oa.h b/lib/xe/xe_oa.h
> index 962f9dddcc..7d3d074560 100644
> --- a/lib/xe/xe_oa.h
> +++ b/lib/xe/xe_oa.h
> @@ -398,6 +398,8 @@ uint64_t intel_xe_perf_read_record_timestamp_raw(cons=
t struct intel_xe_perf *per
>  const char *intel_xe_perf_read_report_reason(const struct intel_xe_perf =
*perf,
>  					     const struct intel_xe_perf_record_header *record);
> =20
> +void intel_xe_oa_prop_to_ext(struct intel_xe_oa_open_prop *properties,
> +			     struct drm_xe_ext_set_property *extn);
>  int intel_xe_perf_ioctl(int fd, enum drm_xe_observation_op op, void *arg=
);
>  void intel_xe_perf_ioctl_err(int fd, enum drm_xe_observation_op op, void=
 *arg, int err);
> =20
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index f2c6d53007..0b9c3349cb 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -22,6 +22,7 @@
>  #include "drm.h"
>  #include "igt.h"
>  #include "igt_device.h"
> +#include "igt_syncobj.h"
>  #include "igt_sysfs.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> @@ -4454,6 +4455,98 @@ static void test_mapped_oa_buffer(map_oa_buffer_te=
st_t test_with_fd_open,
>  	__perf_close(stream_fd);
>  }
> =20
> +static bool find_alt_oa_config(u32 config_id, u32 *alt_config_id)
> +{
> +	struct dirent *entry;
> +	int metrics_fd, dir_fd;
> +	DIR *metrics_dir;
> +	bool ret;
> +
> +	metrics_fd =3D openat(sysfs, "metrics", O_DIRECTORY);
> +	igt_assert_lte(0, metrics_fd);
> +
> +	metrics_dir =3D fdopendir(metrics_fd);
> +	igt_assert(metrics_dir);
> +
> +	while ((entry =3D readdir(metrics_dir))) {
> +		if (entry->d_type !=3D DT_DIR)
> +			continue;
> +
> +		dir_fd =3D openat(metrics_fd, entry->d_name, O_RDONLY);
> +		ret =3D __igt_sysfs_get_u32(dir_fd, "id", alt_config_id);
> +		close(dir_fd);
> +		if (!ret)
> +			continue;
> +
> +		if (config_id !=3D *alt_config_id) {
> +			closedir(metrics_dir);
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +/**
> + * SUBTEST: syncs-signal

Here, we could have two sync-signal tests.  Say:
syncs-signal-open
syncs-signal-change

> + * Description: Test OA syncs signal correctly
> + */
> +static void
> +test_syncs_signal(const struct drm_xe_engine_class_instance *hwe)

Add a flag here, such as:
test_syncs_signal(const struct drm_xe_engine_class_instance *hwe, bool open=
_sync)
In this case, syncs-signal-open would use open_sync =3D true, and syncs-sig=
nal-change
would use open_sync =3D false.

> +{
> +	struct drm_xe_ext_set_property extn[XE_OA_MAX_SET_PROPERTIES] =3D {};
> +	struct intel_xe_perf_metric_set *test_set =3D metric_set(hwe);
> +	struct drm_xe_sync sync =3D {
> +	    .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ,
> +	    .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +	};
> +	uint64_t open_properties[] =3D {
> +		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
> +		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
> +		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
> +		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
> +		DRM_XE_OA_PROPERTY_NUM_SYNCS, 1,
> +		DRM_XE_OA_PROPERTY_SYNCS, to_user_pointer(&sync),
> +	};
> +	struct intel_xe_oa_open_prop open_param =3D {
> +		.num_properties =3D ARRAY_SIZE(open_properties) / 2,
> +		.properties_ptr =3D to_user_pointer(open_properties),
> +	};
> +	uint64_t config_properties[] =3D {
> +		DRM_XE_OA_PROPERTY_OA_METRIC_SET, 0, /* Filled later */
> +		DRM_XE_OA_PROPERTY_NUM_SYNCS, 1,
> +		DRM_XE_OA_PROPERTY_SYNCS, to_user_pointer(&sync),
> +	};
> +	struct intel_xe_oa_open_prop config_param =3D {
> +		.num_properties =3D ARRAY_SIZE(config_properties) / 2,
> +		.properties_ptr =3D to_user_pointer(config_properties),
> +	};
> +	uint32_t syncobj =3D syncobj_create(drm_fd, 0);
> +	uint32_t alt_config_id;
> +	int ret;
> +
> +	sync.handle =3D syncobj;
> +	stream_fd =3D __perf_open(drm_fd, &open_param, false);
> +
> +	igt_assert(syncobj_wait(drm_fd, &syncobj, 1, INT64_MAX, 0, NULL));

Then, we'd want to separate the two using a conditional:
if (open_sync) {
    igt_assert(syncobj_wait(drm_fd, &syncobj, 1, INT64_MAX, 0, NULL));
    goto out;
}

-Jonathan Cavitt

> +
> +	/* Change stream configuration */
> +	syncobj_reset(drm_fd, &syncobj, 1);
> +	if (!find_alt_oa_config(test_set->perf_oa_metrics_set, &alt_config_id))
> +		goto out;
> +
> +	config_properties[1] =3D alt_config_id;
> +	intel_xe_oa_prop_to_ext(&config_param, extn);
> +
> +	ret =3D igt_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_CONFIG, extn);
> +	igt_assert_eq(ret, test_set->perf_oa_metrics_set);
> +
> +	igt_assert(syncobj_wait(drm_fd, &syncobj, 1, INT64_MAX, 0, NULL));
> +out:
> +	__perf_close(stream_fd);
> +	syncobj_destroy(drm_fd, syncobj);
> +}
> +
>  static const char *xe_engine_class_name(uint32_t engine_class)
>  {
>  	switch (engine_class) {
> @@ -4702,6 +4795,10 @@ igt_main
>  		}
>  	}
> =20
> +	igt_subtest_with_dynamic("syncs-signal")
> +		__for_one_render_engine(hwe)
> +			test_syncs_signal(hwe);
> +
>  	igt_fixture {
>  		/* leave sysctl options in their default state... */
>  		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
> --=20
> 2.41.0
>=20
>=20
