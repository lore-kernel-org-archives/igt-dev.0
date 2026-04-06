Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48133EF4ED4
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 12:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D866110E1A7;
	Mon,  6 Apr 2026 12:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFNgESdd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BA710E1A7
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 12:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775478531; x=1807014531;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1hLvIM42lnSFZTfowahqR0SUVTKcyJ60j6x51VMm/eg=;
 b=iFNgESddJ04sAdHl/JqOTZpdAyI3WZ9G9YRc/I9Nntl0p2t6J98gEuKb
 9P3M2UaCLmpoxyxxlBdqVdGuc5dQhGCa8LM1fSyugRtbCASuImZsHOEjX
 022WDNclMWRA8aZ5ywPWLzNOFRkCOihzIjHVgLSZxOij5/+ZQDLm98NKQ
 IeZYOS3+C+PxUR95O+u77C8W0yEOjfXPZbE70yIhJ4bN84o4CzO8qJ6n+
 VjpOshvYUgaUYjplB4KCNrQjQcZrYt86+WSGPr7wIIYewACInESPcGfAE
 Nu2BimQyvPhsy16vyjkjXoT2hlDod9clCNdHbFZtPBzT9Ydd+lFxrPL5S A==;
X-CSE-ConnectionGUID: mLGr2hGPQb6O2a0f1MqcLg==
X-CSE-MsgGUID: 4bkO+xsTTU+9XDzLQhbZTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="75597407"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="75597407"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 05:28:50 -0700
X-CSE-ConnectionGUID: OE/OwLgXQY6beXtKLoRvpg==
X-CSE-MsgGUID: 9ojk1s02Ri+hUsQ866wxqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="231918126"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 05:28:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 05:28:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 05:28:50 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 05:28:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ms7Tc4XLIv3UVI9JEGJQn0G54L5/u0Z0YeX3CXJfcfqNTfnmWYc5rcUeVLPMAob/1KlzuOKCC2BbIR+5f0m45AXYYn+R2VVbEljlzJKfCzpO42sYW01yYnL7JUliQOwqnDp2lPa5XQMLxuaCLjTnIb5QRnQx/Lw+5EEzHRlqehrTnNVWJsegTriTQp2d6IhXEeY6biIZP3rCZeo9vFTdC8q/UoX7XMIrFSO4C4TATfaQktivl0nq41bYt+4ESmQLF72RChKG+jc62qEEtNMdLG7Uzsx05Di6ANRdqk3D+vU72NIvEtKB1ZJkeke/+zaKZnWmEnzmPRMB9yZr0wTicQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LImplIG6Yon6KsadtH/WOGxNz8TPDZgYY34afufFJf4=;
 b=OB6YXsbn3e2KWwNgyGttZl+ascIoVI3A4SEbiDfyhXFKM93I2nxsqVmPWbiLR706AydSpHt9IsSeXWaUsDG6aE3bB86JvptLU8W3nF+itiZXO9ZoLw3TM7UsQSB+tAV0dH0SUF890MzSElCAc1Hr3Gm3pkEl9u8BYobYOQV6yz5bEoHeeIW6RLZxrYrVU3E/vdOmvNPLq07jOEjlzB7BaImjSEtSPjIQvS4IFutQBGpujWjFsloRL48mjDM7K21OhDvY8Pb4Yl8NYHPaq4SD/7D2vT6ciEyi9MV5sn1W+VGQQBO3Pd4Fcdc3xZdfD+XMUQtVQuGTZ9dWiWKjgkATYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ5PPF77ABF615C.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::836) by MW3PR11MB4570.namprd11.prod.outlook.com
 (2603:10b6:303:5f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 12:28:45 +0000
Received: from SJ5PPF77ABF615C.namprd11.prod.outlook.com
 ([fe80::8aed:6b0c:a87a:9a6a]) by SJ5PPF77ABF615C.namprd11.prod.outlook.com
 ([fe80::8aed:6b0c:a87a:9a6a%5]) with mapi id 15.20.9745.019; Mon, 6 Apr 2026
 12:28:45 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel: Adjust IGT documentation to fix
 testlist warnings
Thread-Topic: [PATCH i-g-t] tests/intel: Adjust IGT documentation to fix
 testlist warnings
Thread-Index: AQHcxb9eO48MO7zDwE2rwQddMzwXdLXR9jTw
Date: Mon, 6 Apr 2026 12:28:45 +0000
Message-ID: <SJ5PPF77ABF615C60F81073519A052D68D1855DA@SJ5PPF77ABF615C.namprd11.prod.outlook.com>
References: <20260406121728.22611-1-himanshu.girotra@intel.com>
In-Reply-To: <20260406121728.22611-1-himanshu.girotra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ5PPF77ABF615C:EE_|MW3PR11MB4570:EE_
x-ms-office365-filtering-correlation-id: babb40ed-044b-4e8a-00ea-08de93d80c05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: xcfieDVMUjLsSA2OLAPaXLJ5Q6JysajGSJp9Xj/KePoK27KqH8SZC0/Yht+H4MA9e2LpRJLlwr8P1bmI0EGz8tb5cb5/MnKamNPgo+pC0htuQ0kCBEjTmJ6t4sLwZ0mNdo8e+Oz799QOYMzZYXcnKYF9njeFfXPuUz2VbuqmIwqaKAFcKEoDz8TuPSPy6uN865RzkuMCukkTjVJVZwl1oVvbBz25xc5w/Nxsc5+z/e5KX3L7kAB3NENQkSPshREntIfEATDyADnz42W2pIxFVSSPRZaKjck4FgQqC4WS9GhdmtZPEORMEqSMqhgVHZnMUam2g4ys9snwAZcpiUHlp7uIo1WRZeuSbgDSKsvhSS6lXYZvIE+yVTSXK2JEGEvPiS9b2dXEtmF+SF56mbEC9DbN/1UzgVMbvuyVf/qzeNNaGtu96oikZHJPJvUi9T1CUPm/rDg3CuUVpMK4NGpMQdMT75A2Yn5xwo0TQIHHD5sSeWQL2Og9LcEhaACjQFi6+zZ1GEy2e1yq5grxeHF+nWPt1TBnHw2xXJU0mbhgXWS5WA8nyHRCcBSInJ4rTtW4jSAnFmGOmKs6yd4z61KFRk+rn4JEyA9xye2UIFrUeZOh3Vw/RDCS1AMFElw55FNquiHsfe78acUusuHLteU2t04FfMK8uFnaobo83PsgYh732Dei1I6gktpLJ7Aaa1pc6TKtR1FHjaWKAWL8/goarhpXwV2wGl/vvUr3+9TswizyqkUsgMtRtsxw/QXa4rGTwYjtIr1VH+Bg77icqdzMFgUGhzofCs3jQ5Xl8PhzVaQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF77ABF615C.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gCsbEUL+k6pDOZkxO26jHLtVszkwiN9u+D0An+WshahwuUI/+a7p6aX41XOq?=
 =?us-ascii?Q?4pR878MNPfM7XTRyx4T64hm48BtbNC70kO/S8b4ns3PWLl4isi0SQSZKJchk?=
 =?us-ascii?Q?/c4BRS09RHvMxtXMrP4MCD5rwF5ySlYKuh4qEy6Cy36a2zn0qiC738a9YiNi?=
 =?us-ascii?Q?9StUPgFWrd19/da33f1QeBy7JnFBL2+Te0r4n2u6OfmHL9ymaGyu6SpFjCY1?=
 =?us-ascii?Q?HhRhMerlUf6Q4yuUui3l556Q3MmzP1SugaUemyXLzepKmwq/0+BHa8/lJbgr?=
 =?us-ascii?Q?3+D6deOYcWed+izm1ZEXnCZ+2yDLWs3Jay5NQGbCjPXZYc4d0vl0TwEA9gsS?=
 =?us-ascii?Q?MMjRX8b7J2YL6ZhNAO7FSOyuq0Ssi/hKAN3xJjo54g2rTt6ZP6O/zL0ORvJv?=
 =?us-ascii?Q?BupZQ4+Og64IA/Ltb2RYvoFbZuWaM/DcNU3DFmWEdkGZMGnW4njQWSHnLT4c?=
 =?us-ascii?Q?TPOO/xY7pqothvrgXKQB9qTgf++SWrfRkYvp6OtmEcykWrEQudqGxqsjbghH?=
 =?us-ascii?Q?dLjl5BxhO3YQO3mLp4VTb2yadGBT81D/JfoUX3YD/H5TChXBKdwcsBgK8VrZ?=
 =?us-ascii?Q?EnBxmtu+2N+1PhTDfbfqaI7eC5Uh5WGL9Waw9vaJPoQ75lPXRSNICMpm++Uf?=
 =?us-ascii?Q?2LI05RSP3SshkTi5pfH70DXBAO5XNYjv9F6+26tqurL6huAfOwTpAIUfX0c3?=
 =?us-ascii?Q?AhQq/RcWq+UMpd/szwfStm29nsX+gDrP8Wr3B37B0ZFZtyc9dt5SrVHtq9HK?=
 =?us-ascii?Q?04E42ZfsYWpa1ETPNgvZHrdt/BhwB+Mg3CiOVu5P1PaL7PNnhTEtdC8dwJ1K?=
 =?us-ascii?Q?K2JdFw7hQ6ljOoPYYCJTxDLoSd9gntYgP9G+CEDAD3wp4nn6toJU0F0mfifb?=
 =?us-ascii?Q?cfjnBswzyRedjOYCFDF65w1SU/beEbebYSEyfhAZLO8UTU77SVVF0FEfAvHL?=
 =?us-ascii?Q?kSt0xbbiKY+l5ZFIf8KQZJvIiVHYZY8v/YG5M7ixKtJu/RZsktvK1XuCOpd/?=
 =?us-ascii?Q?UKhkJ3kxbeRs/zAx4r8To2+JX2sBKRHqcUnSpBSQ8NZnv2AO2Hp0LpoDz0Qg?=
 =?us-ascii?Q?xz2iAwXdb/twkgc10q/NQNvpf8ZutnjtflvWeqew3P0jdE/bb63YktFgdYCT?=
 =?us-ascii?Q?qpOP56X1MF3k246FLgJIBElWzJIKqpllF9nDlHehHKh9OjEbZTLaD9uJfq2m?=
 =?us-ascii?Q?bLW6P8FM0Qutqupd18TU26+HL+rpE/24vWrtyQHxbzr9dj5kz5O8XyWMn+RI?=
 =?us-ascii?Q?rHxkLCGNV/s0Vc1PhGTPgozRVGZVlEKqzAoSDf7BXm5ckB5uMROPVpSpZpF5?=
 =?us-ascii?Q?PnLzqf3lvKMhKnHHtZxaloRTcPBcFPRnab/NdkGSi//zZgpQx7wJE25Ipazs?=
 =?us-ascii?Q?8vmc1FXGG2Tr2gjCkXkRxUeCdrGShsv2A6ZGgjdB/aK97LciVDAC2mZMfbMt?=
 =?us-ascii?Q?UYkgpEhuwdsrbTHi/5ohRdHZ1DOvi9sI9QI81W8QFB/wPkT74Fpj1U44HAIN?=
 =?us-ascii?Q?t+boFPt/vJxSS/wPIWg1RamEpnMOUkgdxJ9Bc3quyqBApRn+QLU0ice0IQb8?=
 =?us-ascii?Q?IQWI5cZKuxdIUcnM6ypeNZ4s3P2Ctqkrg7pmFfOsZoCvufSksAjAUE6Fzw5I?=
 =?us-ascii?Q?2sEzZ7+zRsy5CxlfjYn5dqm95xRZ+qZwxZuzzGorfKC/T7Lwh/K7B/4UxC81?=
 =?us-ascii?Q?IWW1AIKYHPMripW4v3tDIFbc8xkWRF1w6kTf7Cpf0KHbsN4V2fo0nlImfpkl?=
 =?us-ascii?Q?oPjr6AJ9mw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PjLPv4641iVKjdyfnSizeQg2IblZmiyXUFugKbZmtUuqjDUKhpfSpxl9BQ6cUKcsNm2GJwp1dblPHneOkKMqYcsywaPT9nIy9LxQwGRcZCgbYW4yHH4cnB8Camv4RlwTijPLmqu8PaORp+kup0PaeEjLbk1QrxK5NJpA9sKJjvgSKYKWlkNSqC9BEiHbLj62ypn85btNLq4eQdYX2ZKLCNJWpG1en77b84FJqmPAdYjFhfk+7bVJ1Pn00YSGAG9/fKPO/1vrB6/xXiejH0tNU51TIBXtLBlYnrDRMFNs6YZ4MlLcDIONgiRJbab3Wp9abRY5fcvKSyAduM5jbkh1sQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF77ABF615C.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: babb40ed-044b-4e8a-00ea-08de93d80c05
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2026 12:28:45.6964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TYWKwb3rctUBVS+SlYvSV4N9Zv161XObuWhJ9CTjHRMHjcVQWuD0OMDFFWCvoNXeGpDhYCdqHmN7acjizw2J13gzp5QKn5C/1KU48v5y6+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4570
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

Reviewed-by: Gandi Ramadevi <ramadevi.gandi@intel.com>

> -----Original Message-----
> From: Girotra, Himanshu <himanshu.girotra@intel.com>
> Sent: Monday, April 6, 2026 5:47 PM
> To: Gandi, Ramadevi <ramadevi.gandi@intel.com>; igt-
> dev@lists.freedesktop.org
> Subject: [PATCH i-g-t] tests/intel: Adjust IGT documentation to fix testl=
ist
> warnings
>=20
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> Fix multiple-parent warnings in test list generation by correcting Catego=
ry
> and Mega feature metadata fields across test files
>=20
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel/xe_multigpu_svm.c             | 2 +-
>  tests/intel/xe_sysfs_preempt_timeout.c    | 2 +-
>  tests/intel/xe_sysfs_timeslice_duration.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.=
c
> index 2ae0b950f..e04e9692e 100644
> --- a/tests/intel/xe_multigpu_svm.c
> +++ b/tests/intel/xe_multigpu_svm.c
> @@ -27,7 +27,7 @@
>   * Description: Validate multi-GPU Shared Virtual Memory (SVM) features,
>   *		including cross-GPU access, atomic operations, coherency
>   *
> - * Category: Multi-GPU
> + * Category: Core
>   * Mega feature: MultiGPU
>   * Sub-category: SVM, memory management, performance
>   * Functionality: Multi-GPU SVM, migration, coherency, atomic ops diff -=
-git
> a/tests/intel/xe_sysfs_preempt_timeout.c
> b/tests/intel/xe_sysfs_preempt_timeout.c
> index 725707bf6..9ddedf98f 100644
> --- a/tests/intel/xe_sysfs_preempt_timeout.c
> +++ b/tests/intel/xe_sysfs_preempt_timeout.c
> @@ -6,7 +6,7 @@
>  /**
>   * TEST: sysfs preempt timeout
>   * Category: Core
> - * Mega feature: SysMan
> + * Mega feature: General Core features
>   * Sub-category: SysMan tests
>   * Functionality: sysfs preempt timeout
>   * Feature: SMI, context
> diff --git a/tests/intel/xe_sysfs_timeslice_duration.c
> b/tests/intel/xe_sysfs_timeslice_duration.c
> index 93b97f805..6aad2902b 100644
> --- a/tests/intel/xe_sysfs_timeslice_duration.c
> +++ b/tests/intel/xe_sysfs_timeslice_duration.c
> @@ -9,7 +9,7 @@
>  /**
>   * TEST: sysfs timeslice duration
>   * Category: Core
> - * Mega feature: SysMan
> + * Mega feature: General Core features
>   * Sub-category: SysMan tests
>   * Functionality: sysfs timslice duration
>   * Feature: SMI, context
> --
> 2.50.1

