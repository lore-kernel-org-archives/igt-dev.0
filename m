Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222AAC61CE7
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 10:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1BA10E608;
	Wed, 11 Jun 2025 10:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TCDcPT7+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E4810E029
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 10:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749638333; x=1781174333;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vVF1/OKEdlYzxhxePolJgXj+RmWYotdhOVY9VAvAgAo=;
 b=TCDcPT7+1rwFWBf0jy4IhJFKVFuspXnriuojt7Ji1V3i0/6JUIzRKCX+
 C409Oz/+lZpujIbyy8enFp7eMJNSE2BrbJuhzrJGx4O+bGjU1VOIkiKab
 5k4UYLGZ0OS/y0YEcl80EsD+Ovj/31wJZ0O18lDBMBo5R62VVvK5QfZNQ
 aryTz7oo6oPsLtx/3gYygHpYTvdbh5UOvjokkLrpQslMctEd+xwQE8x5J
 JBViUDGJ6frMkGMPlMJcjiuMjyKhmEQ98ggp50Ua2e5NelHyy+usb9u9i
 5ZrU7Rs/2uUzN+U+5tYtN0YvOhX/pF7JV8s6NHgJeR5j9cdX/0L95CPrW g==;
X-CSE-ConnectionGUID: VIgaAIOfT3CpXNqEaPA8KQ==
X-CSE-MsgGUID: rG6iTi91RLaFm1MHw4U9HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51877364"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="51877364"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:38:52 -0700
X-CSE-ConnectionGUID: W2u+LNGLQ22xUHAudv4hOA==
X-CSE-MsgGUID: z1N5+axtQwWfQWPNeWIfJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="148073422"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:38:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 03:38:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 03:38:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 03:38:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9JnY0I5BYtn2BcemXwprbqkRneA1TC7Hdv6Z7Z1RVh3gAsxTGLmmYWfnhIvuGXlDYuxLwASu1R2wSl6xFe5EVyju/KGzI+B0Ds0XyktDSCOM1pmaNWnPUCMotM+3068c5F7B4KmLmYiMZrM5lXbxctf4NKRcNlvK0auIodvCrYJajhhZ2BwQEm0qDbJUrFCY+KYKWwx6Xu+/Eg1GeDUn29quvI9I5WAplXIpRSmcclaXnNe1K57X7IsJfTMkQEhfsnl+4MB2NgGrgSHR1KvZV5TB+Ylkbvb6k+tbd5v79F6RjQkylFyzOe6cbqX1SJ7n/eb425DXS+MONjAdINUjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdbOHuwAVRX1A0T7Zmi1BZ8rHVEJJEcG2dUSCApEgD4=;
 b=SiZKuWjbEAbs4Fq4V2ivg9veqKCuawumq+hFBjVh3ieYZjZiFGzcl2fX3ZchRidvlQOd7c8yIT0qainAM9GokgJ0hgnPHNy+QEOQSvhn4P+p5MR1c5GxXi3FQuLKiaVQRTDhDsS9Fm33+vtRoQvWda/vIJWKs1tDRgPz7lb4X5K7B8id0o55GptZCU8n4C7laxSDUcGzdfhRrukVVOQcZROOvJO8bmKq984CAqHsYcV1El6KVqzUz6eWea2VLFPVHA1rbvewxHwyF+TVWXswilwPkXSW9xxM9jJNLKflKLnVFuDsIo654BbIroWr0TnlcbT2+1Q1t7NfK9akuncHig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA3PR11MB8048.namprd11.prod.outlook.com
 (2603:10b6:806:2fd::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 10:38:48 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%4]) with mapi id 15.20.8813.020; Wed, 11 Jun 2025
 10:38:48 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_content_protection: Skip empty vendor
 names in blocklist
Thread-Topic: [PATCH i-g-t] tests/kms_content_protection: Skip empty vendor
 names in blocklist
Thread-Index: AQHb2QxKI5+NTcW+e0+quCf/xj/Ng7P9x6pg
Date: Wed, 11 Jun 2025 10:38:48 +0000
Message-ID: <DM3PPF208195D8DB956D81746D44BC5B372E375A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250609065936.415814-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250609065936.415814-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA3PR11MB8048:EE_
x-ms-office365-filtering-correlation-id: 7750f69f-c2b7-4c4d-e3a6-08dda8d4265e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?QL1u/1FZg7Sij6ZoWsq/KSV1M/ogpd91Qd7TM8/S2PnBOGpBlu2rfdUkua2H?=
 =?us-ascii?Q?QLBybyEryNqoIms9BVqerzzpp1fKpL5D5fG7Vy6Wf+MFlPW4TGzi3u34rXXi?=
 =?us-ascii?Q?1TPsOaqfuAuBZVLvaUVENJDfW+u/LZ3fjMqKRDD6hbnNvr0mvn7Vr+ceS0Jq?=
 =?us-ascii?Q?2Z+o/muSs1LkAv5Fg0Q3ChXjoCSHfFIOZ87BQO1MlzwX4CxwntyLIw8d61Nm?=
 =?us-ascii?Q?cwlpSFPKwsU7AKd/YPaAidFyDjX9TPGMZqAOpcG94JoVs3jF2qrfu8juhO3s?=
 =?us-ascii?Q?I+lj1dqM9F52ynawkGJXwAaEPAoBPy+SC4/Q541+mjqUuxZShF/CIRpSYpBF?=
 =?us-ascii?Q?bz+KBS/KwtGoof7bK9GqPq1XJ9rdChaCKDDL/N9WyTeUFMSL+tgAsxvIgDJF?=
 =?us-ascii?Q?IkjCqYCCH4PHCGHgMZbPh7xs0NnxmT8BNKiW+CsBhxwa/5UmXGqOWvyS/Ne5?=
 =?us-ascii?Q?zCqzizPG39/2vpLu6MEYp2kibABWgiRMgVcBWGN+vLk6yg7i18CmT4Alh8Is?=
 =?us-ascii?Q?0ItXF12Cxju84c+WZvr7X3GvUjMJeBrqp6xaVZ/Ss5KzY1ZUTzwjO2S3x/tO?=
 =?us-ascii?Q?kQWqezSwBXotjANXdSeoZ0ulp2ehLrqyrpMVAkQscYv/P5Vx35bbQqlq7g/Q?=
 =?us-ascii?Q?cUYlbAL2VldKzsMx5b45TYVIRv81oq1OkOW917NVHTLaXEIuWaItBbk6a4Ty?=
 =?us-ascii?Q?UJmVnL1qd2qc/8wnyx4+4M+x/cr99r67aFCd4/YKe/tkC3f1hRpSg5yC8fUu?=
 =?us-ascii?Q?RQMdClVybz57a0XWmPADCoNb4J9eZU3vYJiP4B3Onhpil6wrh/Z+qGXnBKXa?=
 =?us-ascii?Q?c6SYb2voebUy9ALCSZGjIGWMn5tCYKQZRSHy7NTeo7xgS3K9kxGeQkYoWray?=
 =?us-ascii?Q?nPOIPLMFsOgbT3at9lfcSAMRvDqtBXtTq/JSQ/sQJbnqMf92Izm4QdU5ME/+?=
 =?us-ascii?Q?Ue9Cg4IfavpViJp229GQ5conZUhD/eK9eIonP6dFS51F/EKfZ1lr6DXCB5sp?=
 =?us-ascii?Q?hIUxmnNpL6XGpCGy/Mtn09Y1exIi4USaN4VzA7FxuOQf8suipCuQGoCa5Pq+?=
 =?us-ascii?Q?qenSJwoJO7vQIX0wqYfh2GNSi8XGijiBzw04zCAiU1kJxEXL9MYinQBwT7I/?=
 =?us-ascii?Q?uCpxvOyuNa9+Y+oL80PhnqkqnhC+9igN+uyi5DPX2vmYrFL60O3KuvxdIMXj?=
 =?us-ascii?Q?ibLZ1qq/kk1lOgKDDldXPmeCD3+zBVxcS5DelR0wGQge8KJzJ+8RniRPHCxZ?=
 =?us-ascii?Q?JJXVsbpdJD78YulnNvtcHcwPrNXRL9l5HkWWb+fpgmKVjhEdkSX8EJh9jUzr?=
 =?us-ascii?Q?hidVGIsNczWsnqKL77pbvWwk4QWyJalZ/7m/6b9lM5xZghKNj+l0y6NvduVj?=
 =?us-ascii?Q?xt/dan0Vi8DLvqjDwL5vZqlD1S++47Xtvfqz1g8A6WzHedlAqR+/hA754jiF?=
 =?us-ascii?Q?9JUF+xr0vJF4wmZcg4pno1lOTEGJIEGLskgyShiUdiOolg3rhmJ7dw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HvaEZilKV4q44Mw3Fn1TEG/wrJ9aoOQrR59XbC8aCcLxXOPKEKId7QmZJamv?=
 =?us-ascii?Q?bVuA5DW1mPGqvjOvEe563rD4iPGzQv07hKDA0OlimYRqCmHW5fz1V1dh+xQn?=
 =?us-ascii?Q?NSw0uYEEBvuSdCQWgXoyYJYVFPo2dddI8ZD/telo2hbJQNIlAsTKBJKiN4mL?=
 =?us-ascii?Q?GVinhD2YAv+XYkzwt1Cl6iDnN+r/iIlgM9PdYZYroZ5jO+wizSpD/hiGnIPQ?=
 =?us-ascii?Q?SMb7XHlzcEcyghvYGAXQ583bldmGGm7JfQhhEQbkeSBrwMM1FS615HhTfgrI?=
 =?us-ascii?Q?XtRKjKWNEn/Dv9wj77wssmn6HlUD5VfNMc55+sk+3QMokZXwsWtjc1yADGye?=
 =?us-ascii?Q?GAMutwBzcoL+Y07HAnuD97u6H7D+TC1tq1G8FtoDMGjfOHWeU6e8H58Dytn7?=
 =?us-ascii?Q?LMFAY3/hTT3+jOEPiWUDQHK05sPujEpEgiPktXd+LJ/1Ni7OHnK0LvLLny6X?=
 =?us-ascii?Q?Qyufsi6CsUMccz4NSbiVWY68oOLom0WpdqRbpXbdG63CNuHedd9kqDI2sSaE?=
 =?us-ascii?Q?YbF4UGu1fESdhIfTzMpSQBdXp8EbSFdaVmJxHIWbcf9QpWXI5UhefmoyiY8H?=
 =?us-ascii?Q?H9g5zeaWyTIAX+CoEwzbU6IdWuTbOB/t06nzCVgwF+Wf3mDhrG2VPMnBCIhY?=
 =?us-ascii?Q?7wcVTJ5quAwVLUIXB9qDYSyEUe2qjL6OfHXYQYKn+E6CZx78VBO3dZQqw58/?=
 =?us-ascii?Q?tcbpmKAxVoei0F6IDqV7I3BCCbvZ/dK95L7wl3SDU+Tb4ZixdiLlLFhPHV8j?=
 =?us-ascii?Q?yg/pfRw89k28OOQBq9eaokq1V+U08CWgt7eMkxejj3lQt01F+7I3dRRyeNAE?=
 =?us-ascii?Q?H/aWVKRRSFEZpbUxSp28oMx/twnqEehxk5F2kM7QdXY8jKf8C4YN8IU6jA9Y?=
 =?us-ascii?Q?o6tOAXtSSjjeYirHj5E+fmSKauWyv5V5Qhmz9qHnkqU9nGi2LeHSz1P4izSJ?=
 =?us-ascii?Q?MIQ4rbirmyZefFSt+ZqWC7R95ZTFvjQLSLqqOJ3QjJEpbB9/1xrwG5wTIM0X?=
 =?us-ascii?Q?lr/P2u5/bXq3tly/bgs3SZGho8FHkD7+bydTzymBSPurzZSYzBbsoPhqHHAX?=
 =?us-ascii?Q?UE/yqKS4ILbx0JVexfGwY0kJvQHeHQdvAkVyuj5KPmLxKQpUx5+E4Yk95VcX?=
 =?us-ascii?Q?4G3cGI6JfhkJyY9PO35eZtNafUlFVVKygMD2+Hw0TbHi0CEpGHW1lh35x+Li?=
 =?us-ascii?Q?71i214HHk6W+1IdX33L98l43RB76T01GdJk2Y61j5FsC9YKzs2JNCGFm8tdZ?=
 =?us-ascii?Q?A9H5h5cSqJxPg0VMVS1YOvRzcra16H7dBh6Daa+PSMr42m5mRmgTXIu02v3Y?=
 =?us-ascii?Q?oj5MxqtM08SjhGbjlvqVm4y/daanbbNhwHZ8VwFS1aw5X7xAGfUUQ/1IVX7G?=
 =?us-ascii?Q?D3aiAYFnJi9qpRNZ57zIm50+MNIKv0oigXXUkAE7bYiYyT6Rb0Wd3VSxzpUf?=
 =?us-ascii?Q?Xdy0vWEhlGLJn2q1Ojg7jHVF/5tGECXHlKIWNfSeTKSI9OuDlTJhsC218usf?=
 =?us-ascii?Q?yqDjpd2mA4F6FOipLA821RbFN15OuMTYMvznWLb7PTG4AllSecuWSU0LrOGC?=
 =?us-ascii?Q?JGgL+mN/dRjgokDblsVbVjIiMFSsZUR0mj8Vs+yq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7750f69f-c2b7-4c4d-e3a6-08dda8d4265e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 10:38:48.6441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LkLPZowiqijrWNs/EJFe3KhPSeyhqcERhwYtQsvME5Xv8hPtbT8lpItyCBZEaqfjBVwm5KItLUuoZe8XFU7dVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8048
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Monday, June 9, 2025 12:30 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Thasleem, Mohammed
> <mohammed.thasleem@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com>;
> Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t] tests/kms_content_protection: Skip empty vendor
> names in blocklist
>=20
> Avoids false positives by returning false early when the vendor name is N=
ULL,
> empty, or a single whitespace character.
>=20
> log message in kms_content_protection by printing skipped outputs instead
> of asserting.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  lib/igt_panel.c                | 8 ++++++--
>  tests/kms_content_protection.c | 9 ++++++---
>  2 files changed, 12 insertions(+), 5 deletions(-)
>=20
> diff --git a/lib/igt_panel.c b/lib/igt_panel.c index c89bf9123..c51fd7d54
> 100644
> --- a/lib/igt_panel.c
> +++ b/lib/igt_panel.c
> @@ -20,11 +20,15 @@
>   * true if the vendor name is found in the blocklist, false otherwise.
>   */
>  bool igt_is_panel_blocked(const char *vendor_name,
> -			    const char *const blocklist[],
> -			    size_t blocklist_size)
> +				const char *const blocklist[],
> +				size_t blocklist_size)
>  {
>  	int i;
>=20
> +	if (!vendor_name || vendor_name[0] =3D=3D '\0' ||
> +		(vendor_name[0] =3D=3D ' ' && vendor_name[1] =3D=3D '\0'))
> +			return false;
> +
>  	for (i =3D 0; i < blocklist_size; i++) {
>  		if (strstr(blocklist[i], vendor_name) !=3D NULL)
>  			return true;
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index b0d0b0234..51fc1d3be 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -637,9 +637,6 @@ test_content_protection(enum igt_commit_style
> commit_style, int content_type)
>  	}
>=20
>  	for_each_connected_output(display, output) {
> -		igt_require_f(!is_output_hdcp_test_exempt(output),
> -			      "Skipped as the panel is blacklisted");
> -
>  		for_each_pipe(display, pipe) {
>  			igt_display_reset(display);
>=20
> @@ -652,6 +649,12 @@ test_content_protection(enum igt_commit_style
> commit_style, int content_type)
>  			if (!output_hdcp_capable(output, content_type))
>  				continue;
>=20
> +			if (is_output_hdcp_test_exempt(output)) {
> +				igt_info("Skipping HDCP test on %s, as the
> panel is blocklisted\n",
> +					  output->name);
> +				continue;
> +			}
> +
>  			igt_dynamic_f("pipe-%s-%s",
> kmstest_pipe_name(pipe), output->name)
>  				test_content_protection_on_output(output,
> pipe, commit_style, content_type);
>=20
> --
> 2.34.1

