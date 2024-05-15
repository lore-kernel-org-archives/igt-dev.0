Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C01C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 19:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF70610E0A9;
	Wed, 15 May 2024 19:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lvza3jmT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFCF10E0A9
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 19:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715800080; x=1747336080;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=neI51dTSJzgXiAuI8ThRWygxxoSx97kklVZs1MQ9uSY=;
 b=Lvza3jmTm1Yuher8ZBmRCOxj0dj7uHSt3VxdbdCRqKE++JzCBAKCupYZ
 MXDgYCgRpEEvlj2ekTqiVLnWjG3iAtytCmoPvove4B7OkyG8JIXB4/4jb
 dTExqBxtlt0z0qEeG5jmfSK/YPjrwv5FpqFJzIRjRCY1qSHYDdLazTWW+
 P55AmxT0UgL69QX2Tlo/zjaOsM3r8Cyh+XQHcVpyWs8AvmV96RFM/RIgJ
 7dvQavz69PUL7jSJlMpAS0uMUzvjHaeHsldaKzM6x/M784UDUGXHxxykL
 wfwFT86Nzz7jDLaOGjVSjMZDtRijEK4Tr+ntYp1g+CyCKTxr5Ak5Lq1fV g==;
X-CSE-ConnectionGUID: V6dXeWNARcaJgR4iolxfdw==
X-CSE-MsgGUID: janeKTYoQgCevqdWZipvRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11707067"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="11707067"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 12:07:59 -0700
X-CSE-ConnectionGUID: jAZBYkK+QhiO6R0zjWVBbw==
X-CSE-MsgGUID: qHCxOnl8Qm2UQ94HeFHyPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="31087559"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 12:07:58 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 12:07:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 15 May 2024 12:07:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 12:07:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iR16GbqgTXiK4mliHKKexrfEu7JHXIbCn7bI+dSS0dQDgix9OsNkIDP3lylqFuAKd79AfVl/dP7pB72qHjfQf31s5AyoanrarNML6flXJU62Vz/6PZ/QgnpOdRaBLK1j4FpcMybC/ofUQhP3aWx2DYE5fShddZ6BQ/2Bz0ouW4faZcVaYSTMH3J758+JY0Rd4P7181FCtPQooHHZXNe41cXxZWJMdr9Hov36/f+09OMTT1ZrAoMFTYqQyGSL/R4Wh9lN6QLrKj6zalgnoCuCGAo0TRXhntbDa6m0kEN6s2rR0H9+RaMDGXZgtkA9pYMJ4lOKRGdqhm6J6DASbL0/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0Vdsdl4uLP81lJEaA+hwv+ZzqBJ9YfieoUjCOXnrw8=;
 b=Uvgzbsn8ttru7CIVle9maPivTPMwFP7fZc7AIl9YrgOK4l3G30/QvgolFg8U4nwgVTBlkn62K2I9P1u+hvP1367gUOzLdHBr9gWVcldqo1it7CcpuP+vWWq8nynZzW92ZapdmlEaoLP/iqnf9PeXop1flh/yZjzSzSF3gCuudCPtONhBoSpDdS/1SqBZCRbCHxuhhlX6tOlpcM8J9aY2mn7rAALRXocaMFGuFG6D3pNZWP6cNzY4obg3npXiDpIwr4+n66O7aFdiq/K4ZU3bw1Ql2SWFKev9Ww3cHNqYvbpfY9oEABVnm/DkVi9RW35mgj/cGbpRR8cbw1bSjmfQ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB8027.namprd11.prod.outlook.com (2603:10b6:806:2de::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 15 May
 2024 19:07:56 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7587.025; Wed, 15 May 2024
 19:07:56 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_wedged: Force a rebind before exit
Thread-Topic: [PATCH i-g-t] tests/intel/xe_wedged: Force a rebind before exit
Thread-Index: AQHaptruwMN4lJbnq0K5E0rbjvl9QLGYpJPw
Date: Wed, 15 May 2024 19:07:56 +0000
Message-ID: <CH0PR11MB544480EDA81225D9EE94C822E5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240515151555.70885-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240515151555.70885-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB8027:EE_
x-ms-office365-filtering-correlation-id: f4576fe5-f0d3-4a3c-3381-08dc7512542d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?xDY1TWRJxWvVcfhdsQeipH2NBG6rty/hzcTp6fyiLd57204notNdRvo4WalG?=
 =?us-ascii?Q?eKhze4WIXnCn/XmvdnHH9/eFz/HOaSdAP0+eUaHDn0HnUO1ECKz2RjKOBLon?=
 =?us-ascii?Q?be6hZLYLXv+XUJYvRBfnvpXC2d7bBhqxt3quzT3+xbthG06abZQSXU04bjjz?=
 =?us-ascii?Q?2COfyPK79+AQLZV9ecKA7U8bSD9Tus9lQkctRAHzvc8pgni63OrlPGRlpZ2A?=
 =?us-ascii?Q?lpmbuQtg8Prbxxl5ig7nByrrhQrALE45aK2xrUHFPOnBckLASq7GhONttJ4M?=
 =?us-ascii?Q?ZZjJXA8T74XVgAOwvos2yHD7x7kORuF9rPI0oBLSPtH4q8TXJDkbH908sC7X?=
 =?us-ascii?Q?vFoW/x92UPhskrZhQi94XGCfvheRGCAv26vvE2IH83STY0CaMS6VtBqZL99m?=
 =?us-ascii?Q?hZrWEC+BiEjFbcfSdQjX1gcRBbJUZ7Bi6+dj4IwshGQtGwKmlPcOLpyTmwUm?=
 =?us-ascii?Q?KxT62eXY5huXd8RSdRvojIu5RrPALJAZbX6u7EUvY2J89ibvQJ+CobVSHMgF?=
 =?us-ascii?Q?ugaq/plLe5jawzIfJUfRvJtcx/12tOpvPV84Lx/TNzUXYHvjbrwJw+KCBBz6?=
 =?us-ascii?Q?3zKuZ4ENxoMSoI//0fdMqlgKK7Bl8PAs11KYfpW7MXz1MddWRS/cwQUKAGWA?=
 =?us-ascii?Q?lRqy5aIn+G81CY19hjdmuHCy/ifQL9fkLwSV5Zk/i+nPtngLccuWBdJvFpg+?=
 =?us-ascii?Q?74dqVnplgNT8dP4vkbc+JESnmsVO8P8MQUqdUx6Jb93mA0zrrwdYzzRYuRg1?=
 =?us-ascii?Q?Kxxnx9s0r2On9KrIya9OQ01FBjuyXgCdoU6bNUmJbZetCVfvzsbXo6tRiYEk?=
 =?us-ascii?Q?v4ll/K8kOggtHEwzM39JxSb9OETV9wE15KKhBIg91vfoDjHNGDbooOosK/oJ?=
 =?us-ascii?Q?/kHiC9RFzQUEQBs9cN1tNzif9fsdzMUmfWjRrCJ4ByrKOKlnYL65uOyf2IPC?=
 =?us-ascii?Q?azwYazKxymoyqjUobl0HX038UimFR7UfzxLpyiMq8TEOgGHczI1aKyI+YLqX?=
 =?us-ascii?Q?5911F8uM761FmZAI6PGgtXSxTcMtdn63TYUQ0yUE5qppl5M9JXgDp8c2IuPr?=
 =?us-ascii?Q?t5IVLq3DqoUJFaIog6VgbbFkNvk3eTgiqGgeIK1mNiyxtpOEIfWHDLgYHjf3?=
 =?us-ascii?Q?EaJ6a8HrlQaIGVEjqwiily/8a1/dVm2t/lXDfJp48R3AgxtslFdaHXVgfuc7?=
 =?us-ascii?Q?XmrQLg5ScCvImu/bkGbR9dQbSswTShHyix5sAvNJoYsXkX6l3A3ev94Oli6a?=
 =?us-ascii?Q?77s/Cj5ulrdFkxJJ4cbDuGlcImbWb98oL5pYPMndJz7HBmR/iqkSqmLLExzc?=
 =?us-ascii?Q?cNT7AEBRaNg9ZWIs+yi/FH7YHpcxlzvkNJYf5wTF6p64TA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MDws+cUYE9t8TLBFeOYZFl5+U2ClvuudOY35T30FYkX30LFNNkEX52HhQI8L?=
 =?us-ascii?Q?a9WXfDiPkJK3HPLG++X0QB5nLYyG8fr101JV9nyhc7V2g1WvXIixz1haYoDV?=
 =?us-ascii?Q?rsJjN3PFzH5S8llE9rzLNHqu4e4Wux6x+UU3e0EQYTsnYaadakU0M0aG0IOm?=
 =?us-ascii?Q?00SyW9wpAALUIRVQHzFVmbgH7xqA7C0MMPfOaf4XyDc4YNbufh4HHadzpGJn?=
 =?us-ascii?Q?kOUofKFX7gx50eVqyxaWSkZemg1Z9gOuC5m6m3i3aXZQ7+2Br96Nq4oC/yuz?=
 =?us-ascii?Q?L+u5Dnxo7CoC/q/xAp/I/foHJ/ej00qSajP45Saoa+KUjl9AQCYJ+BvMI+mM?=
 =?us-ascii?Q?Q8H0o3IjSvUdN+RWxA8n9TyNO1If10JQgX1Gs2bgP7qTmv/60CmpQZVzo/DT?=
 =?us-ascii?Q?yUflfHpP2qmCU/WwA0w7jXB7pjMLfQbxBZLsHEcKm7sla0s86cNWPVgYd+2P?=
 =?us-ascii?Q?M+Jui0XL5zVdiStHnbAwoUu8moz8z4Ibx4FZFWeu0val6O6F/BHmJnSzaoaX?=
 =?us-ascii?Q?Eiu+6B9TFrmEWuErlXP+LFqWK7e0tY0LFrPy0WvD/RBF8S+LJBufeViplrx5?=
 =?us-ascii?Q?tOOmOaEnuPhkch/WMQ5ZBPPD9l/XZzZv5z+TxKDxoRES6VxtMw6X4Z4iWy+/?=
 =?us-ascii?Q?x8Vb1OOt5B8cX1raUSTBJSg9t93R9s0JO4GUXNHBWDIlcCPdEmxgEhQ4zL5B?=
 =?us-ascii?Q?9A9vaFQri0CVsmmMf5m7GoYhOsSMXSbNctZ9AC+CObYtPNu/CKcVf5l+k/rS?=
 =?us-ascii?Q?H4qi9B/AFQDjjulEinEWX6xKem9NJ5EKzq/Vxin3aCMR4U0LBOJFE9t1IARv?=
 =?us-ascii?Q?SYQNEBT174CegaWfBl+lfZ9Ns0kC0bHm2KvrsD7DL5229KtZBtbgbp9ui0zU?=
 =?us-ascii?Q?p0NfP2hk33fHwfefpXh8QU5RWX6LXhyDwS/COftEK9oeXrVH/12MwProxc6k?=
 =?us-ascii?Q?0hEPntbmqTA/GcnSvtAKVbouLTOlrIRsRGaaxMVsHvFVC7qVKigKIxQH7RbN?=
 =?us-ascii?Q?+Os0SSW9ZEGu4XG9XNaqIxlC3nYz8dv8CtHozx7j7rYpJ0rzFUndjOBw4vYy?=
 =?us-ascii?Q?bkiLa8FtLI/WumgcSNdn661H0FvBSiaQRfXLBm2trLf7pTS2lRR+tgXtktEa?=
 =?us-ascii?Q?gR9qUFD73XrM//pR0UVucJrcRmMj9WOeYWqF+nNNcZYeZ+0uYpV55eN5R0AE?=
 =?us-ascii?Q?ApinNlNGAwmw1EptXOu+nE8PlC2ENCFNitxQFa8ccC83aqxjaa4vIBxIaJ9u?=
 =?us-ascii?Q?EzwC29RfxlqVnCYxLrqOoEXiUfpDavqc03adq9/wxgarVgmtTC0FNDbNKFYK?=
 =?us-ascii?Q?KKtD8/LBx9ZOcPDlA6q/UlCrZcZ/Lj5pX3KuBJs3pLBXLDyInZM20P1OY8Zc?=
 =?us-ascii?Q?XTh6kzgKEzVw8DeP19WGScz7vm+gcputFMS6bSJAApN9OEiFwz8Hv7xrsZ83?=
 =?us-ascii?Q?HMjjkDtgcQ3Tql1zus5f4rw72sGlcMgNHaBMiRXzUUCkYEHr5/E6259tgk+Y?=
 =?us-ascii?Q?m2qJm1ejx9qY1x/UQJlbgywWzj1yPeuiblxp4QRj3QFalqlucI1Kxh3fw9SD?=
 =?us-ascii?Q?s/022bURWWaue7u4PvSH4gs76cBNEjzvx9Jx7YmY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4576fe5-f0d3-4a3c-3381-08dc7512542d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 19:07:56.1291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L4iZ0iIsTUnFE1HKWGSD5Ry23gbNI7pyIK7bNm/84k/BN2ySTIX4158HWRQ/TSHigCWm29XmSeFge+fvX2UC/2fkZEhuyUYjNICRgVzGaaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8027
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Rodrigo =
Vivi
Sent: Wednesday, May 15, 2024 8:16 AM
To: igt-dev@lists.freedesktop.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; De Marchi, Lucas <lucas.demarch=
i@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_wedged: Force a rebind before exit
>=20
> If the tests failed before the rebind, the device will be
> left in the wedged mode state, blocking subsequent tests.
>=20
> Do an extra rebind before exiting to ensure everything is clean.
>=20
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  tests/intel/xe_wedged.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index b9bd49fad..cff91077c 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -276,6 +276,10 @@ igt_main
>  			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
>  			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
>  		}
> +
> +		/* Tests might have failed, force a rebind before exiting */
> +		fd =3D rebind_xe(fd);

It might be better to only perform the rebind if the test fails,
but on a cursory inspection, it seems doing so would require
a rather serious change to how we monitor the assertions for
the tests.

There's no harm in forcing a rebind on test end either way,
so this change is fine as-is IMO:
Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +
>  		drm_close_driver(fd);
>  	}
>  }
> --=20
> 2.44.0
>=20
>=20
