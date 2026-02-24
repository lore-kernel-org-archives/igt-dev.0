Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CD8EFB7EF
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 04:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A660410E4AC;
	Tue, 24 Feb 2026 04:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PncUWKl3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E0910E4AC
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 04:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771907188; x=1803443188;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RfsP4XkIIEgj5tOeGH9x907c/7Nre1670fxyzoXWO8U=;
 b=PncUWKl3YRN3tdmJ5edoUl+gE7xpdLNwA96xp9Ppg5PWTlFfSFooLSNy
 dOKjr7oQO9snH7ByWkKNqZtBjjMUavlb7sHbPs5k3tNbpt3/ZfmVXO4Dw
 SBFPBGXIJCroX9gADVsIa7DEq/bMWIr1Jm1jHHp1/CCauxl2p1G0LdWWX
 4dRC9LYVj/2lXXUUyL/1n1+Tfbi+eyrds+3mPcNuF+Yz2i0yeRZzwYNNi
 MGU08RjqjL0x2U0Z0ohq0zxZViGaJn0ykCBgIN7pJM/N3pzh8sfpOiytg
 ArybLDMvwhanbRNmTcUpPoHILpI7ioixXbV1lw3lMxd5ufIFg+wV1xSAp w==;
X-CSE-ConnectionGUID: G4XxgWTWQ3SfB+QLplFBnQ==
X-CSE-MsgGUID: i1SqCPxYTtWwxAZCl8L4iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72127674"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72127674"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 20:26:28 -0800
X-CSE-ConnectionGUID: XtIUGflGSRCDM6siVvAxsg==
X-CSE-MsgGUID: 5dx5DZVCSjqPyqvkfMkU6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214056198"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 20:26:27 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 20:26:27 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 20:26:27 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 20:26:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iY/YWrviAwA1jgMbC77xE2e/fLzsay2LP+xy/LKo9rNbETeJzWA7C8B89B6qvfAIN8Ke6jNH8Za+MyEW9Lx2heoCcwsOUBjf6uVyzWR6mxZtVwzseRwHHpdXU3dwdoeaRc0ZYDQbNiDl4J8jKSZgcNCM3kPssN38W+aVrQFfARsIsTGTbytZ08g49ozfrGBs0G64VzXjS/enQ69fIoiwiVvqvspLa1qKpG/245rahdKGRUY/TUv626nxJ4+bX0Wlo8tRwK+T10qPiPEGY1kYxPdwR38GTNVyG6iJR8DDRK1g53jqPv8OAw36XPPxw6g8URsy4NlHTPTzACazeNFcqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5egBwBk3RBiR9gRl4uCLka9MqxC3ePojqgPeZvGIGM=;
 b=weyLHqS0PSCauyEl5Wkk4xlNpvy+cj/MqbJtGLBP2YzU84giqpxHK4l3ch8UVpMOdfs7zMZWRwz5J3VzOzlFS2M5QpaeBewekFpFTfKFQ2j76UBhM7+1d2NJD0SbgnIe0PJulG9d+ghw2VatJPGT/8wiU5xdxqIZhqjEe9IlHHszcpzeeUYSKxDbwp/mnwVfPJqsKNv9EGRMOrow5JmDyzkrYv7+4Qirdotaj6KqE+2pamYfl7BU1V34MVsw1Fz+YMfY4pBg/dH36DwmYHcAq7H8rpzMenAXVJHN+6LOesAew2VpWHp1EJjQ2bIxmpcdGcdFL7nOK9PUTNpIiSZ8bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by PH7PR11MB6835.namprd11.prod.outlook.com (2603:10b6:510:1ee::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Tue, 24 Feb
 2026 04:26:24 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 04:26:24 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 3/3] tests/intel/xe_exec_store: Extending test scope
 for PCIE6 relax ordering
Thread-Topic: [PATCH i-g-t 3/3] tests/intel/xe_exec_store: Extending test
 scope for PCIE6 relax ordering
Thread-Index: AQHcokuh6JodQvFrR02jpr28U3WtA7WRRooA
Date: Tue, 24 Feb 2026 04:26:23 +0000
Message-ID: <CH3PR11MB8434D03ADDC6C25FB1F6475F8D74A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260220093041.1911492-1-nishit.sharma@intel.com>
 <20260220093041.1911492-4-nishit.sharma@intel.com>
In-Reply-To: <20260220093041.1911492-4-nishit.sharma@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|PH7PR11MB6835:EE_
x-ms-office365-filtering-correlation-id: 81159c87-02e0-4ec8-3ddb-08de735cde70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?kfkHGjUdmdL64ijRu4fxUAVAV3bQE6N2dlVPxGteEpSuzDhY8m9Hvp3Xd7xu?=
 =?us-ascii?Q?ezogpN/+hZ18arNPQ5wBf2JYJAbJgdAUrl8F9BkshNfaMVkBLFGZ6P8Dr4S9?=
 =?us-ascii?Q?R5k3SKFWbyrXG6IoJcE1dCkTG9BJveOgK202aUcFDRUHJxErcahEzIT5wvMF?=
 =?us-ascii?Q?jNhiMnKLUjTE+AdSJhcCvqkAlK4nku+zRMj5mW499WN0oWEBsdY4HYecIuTd?=
 =?us-ascii?Q?GV2eFo08enXJCIQK3aRD8ga4l6xpYTVqZVdpL1icQ8POP7z8zjR/Zz9FiudC?=
 =?us-ascii?Q?aZdIjjjxzUkZOzth8hE0NtnYmEvgIhuKfB8sYPSUxo5F9ft7oOVdEtjMvctg?=
 =?us-ascii?Q?KoOpJ5GxUP1rGu7WhKE7+cTxUJNqRDuBX4Uq8Zd3kkLt7plIfFxecp5VPchF?=
 =?us-ascii?Q?UN9W23lqYifHGcFyOtbcbSFNbv+VXw8vHtmDe2lDhFMLZEMxWV+nhk6WR97V?=
 =?us-ascii?Q?j8ozbc7qGUvJhZ5jaMdz0Gf6V24ImsgmiAk2wnh4dGYXnKyBRaNCHQB02E6g?=
 =?us-ascii?Q?AH6i7367TZ96CWTMw4q7X7ASGPoZyTcPmmokLFelH9+Oa0zQz0D+tSSkt+T+?=
 =?us-ascii?Q?UEo1XdHUvfUGZA3oDIS2S87m6FhTlLDHAhRlcwvSj5OZDcF4dog1BPapN8sn?=
 =?us-ascii?Q?n7vwWItIg+ta+AI5Lyho8MBXUEG6Hx1Due6cRoU/tQrCOVj6ytT8N2s5UteF?=
 =?us-ascii?Q?HRDWDq9FoT9M0TBeJ0aH/OHMiMt+5QH+hratC1UwGJAB1XOozWiiEzDQgEpq?=
 =?us-ascii?Q?YK98wck5AgbkJC0bg95uWu/tF9idEjFISlw9WTXiXzuTEMtVLQv4dY8QaGU/?=
 =?us-ascii?Q?/c//2bBnRRZFWYR2ivIsfEdqUtFhsZ2Nk9nQxy0SHQxU93jF+MGrG0jyGL7X?=
 =?us-ascii?Q?31eHZSwm76UulIxSD9LokTs/eqaUQCudCzX9EmaSqJMQ39gClyn/PN0nKbAZ?=
 =?us-ascii?Q?BXGcjh4lLdsUCRM1JbShWfn7iY+c8AFCARhhwtfLzm5r2td0Z9GMx2TN/Sjw?=
 =?us-ascii?Q?Bt0zb6nyVf3xnKU/FkO8yjs1kqF+tBrkDziUsx3CziSboF2TYqAiMJnMqx8K?=
 =?us-ascii?Q?+Rm95OFHfDZ8FrGJNLMv4gj2s5tz1rD4FJEjR1AJZwVshaeDtjPoSfMJ5O5F?=
 =?us-ascii?Q?GZJQYqAvksQfAAST+XFVL4rrLF3qAFF9bViIQ+mJsSomVDq247FqLdTEVZny?=
 =?us-ascii?Q?donvZCzJVfo+O1flCKBM9sRkLE9U7IpGyIeh3QuQl571mTMPgW1SXDZa4H9T?=
 =?us-ascii?Q?kobE05YpBGkB7Z80FeDL+s1n8cUSfBs+l1f5dTXsV6fVeTTMy/3M00C9qQZk?=
 =?us-ascii?Q?ZYRKOwiMcqUwFdVNF3Hq0/m//kqfXKGm1UkKwjIQWM/CoSE2LC0KkeJ56z3I?=
 =?us-ascii?Q?MQ7LBf5o9NCBgB0zOpSRkQMACnBNgzWxDsBgXrr3QldoyA5FcixPbCeyKrvm?=
 =?us-ascii?Q?DfHB1Lk8tsjrjWiTRvFPG6y2aTa1TKckSLY4qAU0FwGGvX8ovgBaEyl+j7Q5?=
 =?us-ascii?Q?HSqXMgTQ+HeH2TUNEYr3bMPmu4hDZf454vJg+ccnaEHyMwxzeGYbhk/GuHnh?=
 =?us-ascii?Q?Zc5mRdBo9Pt6xJRs1A2fs0J27Ziu6aCRr91TuoFB/0UEZq4i90HNvwoHDtC2?=
 =?us-ascii?Q?OiN/N4k30m2+VdholxAmsPk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uPAdv/BY/wEX4qLQhtl2TNgtgBEIfli+xcXuYP2+xOnUlnQWqoHsVFi1Olm2?=
 =?us-ascii?Q?dWAiZ4MfG71pPiw/VsSqaIoUm/tT9mjZ6flRiw24qsh6UvAnCfcCxWluk1bw?=
 =?us-ascii?Q?xJEpbIECEfcItyl4Dv2bcL1k+prpux0yM+S/zwd7PwIPnRirQyBUEr0xi/Qk?=
 =?us-ascii?Q?EeKLVTD6yxBdMVA5cQdtf6yNEiGU27GIicPPwNjI7rUnccKTD/w3AU3ErIsT?=
 =?us-ascii?Q?6C6nTalSccOeVpWcqRcTsdJXDfYCUSQt0FGQrBGaVV4I+stfu5w9qK9M51VO?=
 =?us-ascii?Q?iEKFSw7ZYmUcTrJm8WoUHVf1ttKz8cF2laGX3FxpfC1Rp7ykYgalotXh/nQ5?=
 =?us-ascii?Q?ADzfqdr3vhUT4uwWELktQ3ptTcbIejCKpvlwpmqny8ow8zsiVfliCvJ2SAa3?=
 =?us-ascii?Q?aIe+Lt00MzONzuuu0mOX+Ye77frSGNiHVgl7FpcWcOOOh6XlJ6jC41gTCr8h?=
 =?us-ascii?Q?crZQ+ySC2jbM5cwCOBFT7ob3pbeSoB2C8ZDLOVTOf8cqcT0+HTgsNF8DAbZc?=
 =?us-ascii?Q?zcolvb1ZL6t9XM2LOygJiHvRjqD/QLKDhtJl5LtRv2qUBbGtMQFij3fjm1UY?=
 =?us-ascii?Q?cNxgBsE9hdQ6wFmeYH0OTph1hvLb+9B6Tggf4fDN1lzRHd98FhwTQj/ua20s?=
 =?us-ascii?Q?b39aRRJt83xlpatbe7Xgm/wr8HuBbZJXYeThf77Mv3/ky/3NgIZ2+6z5Uzdo?=
 =?us-ascii?Q?bQ7IhE4AogEjcuQ7tdQrIHkM+64/7U0qQQU0jH3+WuVOKCu2qFf3VWyHg5w7?=
 =?us-ascii?Q?sTh1gCbRe5d7cuKD17SXGy0vDPg2T9w87cyfXak4Lxw6pIBWy4pU8+0ma4LR?=
 =?us-ascii?Q?cYj02oN97f4BVLQ/huzxEabtWFPaZLzGjTFqc+t6ynHec6XkHjiGU5Ed5WGs?=
 =?us-ascii?Q?klQ+xIjKJu9FbwivcGtpDIEhmWuwhrrbglMb7folaDlHFXAy7mwrRGMJZZ4d?=
 =?us-ascii?Q?/+ksw6A7sxZi+TlThMa0aSbv4PAyoADene2sX5zRh20kk5t0V1tlH3xT3cTD?=
 =?us-ascii?Q?GOtSY6Jy0nqXa8DOcCF7DwebjVuzih0XhmDSmAypSTlvQQ8b4dEhWaZKQP+D?=
 =?us-ascii?Q?4aHU1aZLeHYflFMcnW1YRu3PjCtmuZrRJ+f74kFnk7YBvY/5mLGUlzZ7ylTY?=
 =?us-ascii?Q?OtTfXvCurH4Y10tOLmM8ATURHX/mKr9e+5PAJ25ywg/oxgEe58lJXXD7Y1Yr?=
 =?us-ascii?Q?EGT1Etds+elmsr6tT2CCzkGULV6ArFo5u3O0XZfJ8sYl14Chzv1p7Dr8b+Ta?=
 =?us-ascii?Q?1JcSm7xBp4oOa1V7MFPPbLdiS3IpQP8jgBql9LZ40kuWLca/4UOcTJkj3NYt?=
 =?us-ascii?Q?matn9iUE8+rz5TSlyON2tJvH4tEiiH07gT2GKRTSmQ+Jvk2D24KmO1IZSjuF?=
 =?us-ascii?Q?mMsi8O8uIqk+88a5JJYRJpM17u12dfT54u9pGuBb9cREz9f4tw4tC9AZnpO0?=
 =?us-ascii?Q?XppaWuuUru4SdB9Bf2SlsRpEMEWMZ7oE5T3kavl2+FTiPNeIFfnmxGUplf5I?=
 =?us-ascii?Q?7gkXrrbp+KHbEPAqY5EosOVAev+4cD2wLTNJyDYcx/brAk2gW+rYx5r8u3zE?=
 =?us-ascii?Q?VDDclE4S+3t0iRuESh5HFYvtn36H1DS6pvB7IcT0jr4QCoSWrRRayowCsK8V?=
 =?us-ascii?Q?WQfAMClqj9wNC7tBuIXsOuqeVq0++XKgTJWAnxTbHNE+u0CwITAQKZVqmEuA?=
 =?us-ascii?Q?1l0pG7sOknED51S/sfCQJSGNf4n/EXk/Pe0KM79CiSYy08KuA8GdymHFQWiv?=
 =?us-ascii?Q?sFkNPRM1A4tVH/ysA7EyEuEavcWx55tx4uhSpAfw4aIRF8ZhW0XXCWuIf9DU?=
x-ms-exchange-antispam-messagedata-1: Sl3TJZlRkrmgKUtW6yVPkOZf26l8NkreYsE=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81159c87-02e0-4ec8-3ddb-08de735cde70
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 04:26:23.8617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WKMgMZT0Sg/dgssxek04voCgXXYHFhzKKTD7gvLeMbRrbyyyepl+V/IPPmL8Ddg1/eV1SUTLcKh206T1SoDt9hpt06sjvbtwxmjwzM5clis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6835
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
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: 20 February 2026 03:01 PM
> To: igt-dev@lists.freedesktop.org; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t 3/3] tests/intel/xe_exec_store: Extending test scop=
e for
> PCIE6 relax ordering
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> This is extension of validating PCIe relax ordering to run on all possibl=
e
> memory region available in a device. Currently VRAM region is utilized fo=
r
> memory operations for discrete platforms. This extension utilizes both
> System and VRAM region of discrete GPU for performing memory operations.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Update the commit description as the change is not only for pci relax order=
ing test, it should be generic.
Rest all seems fine.
> ---
>  tests/intel/xe_exec_store.c | 107 ++++++++++++++++++++++--------------
>  1 file changed, 66 insertions(+), 41 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c in=
dex
> 5930f16e5..f65c22779 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -114,7 +114,7 @@ static void persistance_batch(struct data *data,
> uint64_t addr)
>   * Description: Test to verify store dword on all available engines.
>   */
>  static void basic_inst(int fd, int inst_type, struct
> drm_xe_engine_class_instance *eci,
> -		       uint16_t dev_id)
> +		       uint16_t dev_id, uint32_t region)
>  {
>  	struct drm_xe_sync sync[2] =3D {
>  		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, }, @@ -143,8 +143,7 @@ static void
> basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>  	bo_size =3D sizeof(*data);
>  	bo_size =3D xe_bb_size(fd, bo_size);
>=20
> -	bo =3D xe_bo_create(fd, vm, bo_size,
> -			  vram_if_possible(fd, eci->gt_id),
> +	bo =3D xe_bo_create(fd, vm, bo_size, region,
>=20
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>=20
>  	exec_queue =3D xe_exec_queue_create(fd, vm, eci, 0); @@ -193,7
> +192,7 @@ static void basic_inst(int fd, int inst_type, struct
> drm_xe_engine_class_instanc
>   * @page-sized: page-sized
>   */
>  static void store_cachelines(int fd, struct drm_xe_engine_class_instance=
 *eci,
> -			     unsigned int flags)
> +			     unsigned int flags, uint32_t region)
>  {
>  	struct drm_xe_sync sync[2] =3D {
>  		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, }, @@ -225,8 +224,7 @@ static void
> store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
>  	sync[0].handle =3D syncobj_create(fd, 0);
>=20
>  	for (i =3D 0; i < count; i++) {
> -		bo[i] =3D xe_bo_create(fd, vm, bo_size,
> -				     vram_if_possible(fd, eci->gt_id),
> +		bo[i] =3D xe_bo_create(fd, vm, bo_size, region,
>=20
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  		bo_map[i] =3D xe_bo_map(fd, bo[i], bo_size);
>  		dst_offset[i] =3D intel_allocator_alloc_with_strategy(ahnd,
> bo[i], @@ -282,7 +280,7 @@ static void store_cachelines(int fd, struct
> drm_xe_engine_class_instance *eci,
>   * SUBTEST: persistent
>   * Description: Validate MI_PRT_BATCH_BUFFER_START functionality
>   */
> -static void persistent(int fd)
> +static void persistent(int fd, uint32_t region)
>  {
>  	struct drm_xe_sync sync =3D {
>  		.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ,
> @@ -309,12 +307,10 @@ static void persistent(int fd)
>  	batch_size =3D xe_bb_size(fd, batch_size);
>=20
>  	engine =3D xe_engine(fd, 1);
> -	sd_batch =3D xe_bo_create(fd, vm, batch_size,
> -			      vram_if_possible(fd, engine->instance.gt_id),
> -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -	prt_batch =3D xe_bo_create(fd, vm, batch_size,
> -			      vram_if_possible(fd, engine->instance.gt_id),
> -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	sd_batch =3D xe_bo_create(fd, vm, batch_size, region,
> +
> 	DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	prt_batch =3D xe_bo_create(fd, vm, batch_size, region,
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>=20
>  	xe_vm_bind_sync(fd, vm, sd_batch, 0, addr, batch_size);
>  	sd_data =3D xe_bo_map(fd, sd_batch, batch_size); @@ -419,7 +415,7
> @@ static void long_shader(int fd, struct drm_xe_engine_class_instance
> *hwe,
>   * Test category: functionality test
>   *
>   */
> -static void mem_transection_ordering(int fd, size_t bo_size, bool fence)
> +static void mem_transaction_ordering(int fd, size_t bo_size, bool
> +fence, uint32_t region)
>  {
>  	struct drm_xe_engine_class_instance inst =3D {
>  		.engine_class =3D DRM_XE_ENGINE_CLASS_COPY, @@ -456,8
> +452,7 @@ static void mem_transection_ordering(int fd, size_t bo_size, bo=
ol
> fence)
>  	sync[0].handle =3D syncobj_create(fd, 0);
>=20
>  	for (i =3D 0; i < count; i++) {
> -		bo[i] =3D xe_bo_create_caching(fd, vm, bo_size,
> system_memory(fd), 0,
> -
> DRM_XE_GEM_CPU_CACHING_WC);
> +		bo[i] =3D xe_bo_create_caching(fd, vm, bo_size, region, 0,
> +DRM_XE_GEM_CPU_CACHING_WC);
>  		bo_map[i] =3D xe_bo_map(fd, bo[i], bo_size);
>  		offset[i] =3D intel_allocator_alloc_with_strategy(ahnd, bo[i],
>  								bo_size, 0,
> @@ -493,7 +488,6 @@ static void mem_transection_ordering(int fd, size_t
> bo_size, bool fence)
>  	}
>  	if (fence)
>  		batch_map[b++] =3D MI_MEM_FENCE | MI_WRITE_FENCE;
> -
>  	batch_map[b++] =3D MI_BATCH_BUFFER_END;
>  	sync[0].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
>  	sync[1].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL; @@ -538,44 +532,72
> @@ int igt_main()
>  	struct drm_xe_engine_class_instance *hwe;
>  	int fd;
>  	uint16_t dev_id;
> +	uint32_t region;
> +	uint64_t memreg;
>  	struct drm_xe_engine *engine;
>=20
>  	igt_fixture() {
>  		fd =3D drm_open_driver(DRIVER_XE);
>  		xe_device_get(fd);
>  		dev_id =3D intel_get_drm_devid(fd);
> +		memreg =3D all_memory_regions(fd);
>  	}
>=20
> -	igt_subtest("basic-store") {
> -		engine =3D xe_engine(fd, 1);
> -		basic_inst(fd, STORE, &engine->instance, dev_id);
> +	igt_subtest_with_dynamic("basic-store") {
> +		xe_for_each_mem_region(fd, memreg, region) {
> +			igt_dynamic_f("region-%s", xe_region_name(region))
> {
> +				engine =3D xe_engine(fd, 1);
> +				basic_inst(fd, STORE, &engine->instance,
> dev_id, region);
> +			}
> +		}
>  	}
>=20
> -	igt_subtest("basic-cond-batch") {
> -		engine =3D xe_engine(fd, 1);
> -		basic_inst(fd, COND_BATCH, &engine->instance, dev_id);
> +	igt_subtest_with_dynamic("basic-cond-batch") {
> +		xe_for_each_mem_region(fd, memreg, region) {
> +			igt_dynamic_f("region-%s", xe_region_name(region))
> {
> +				engine =3D xe_engine(fd, 1);
> +				basic_inst(fd, COND_BATCH, &engine-
> >instance, dev_id, region);
> +			}
> +		}
>  	}
>=20
>  	igt_subtest_with_dynamic("basic-all") {
> -		xe_for_each_engine(fd, hwe) {
> -			igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d",
> -				      xe_engine_class_string(hwe-
> >engine_class),
> -				      hwe->engine_instance,
> -				      hwe->gt_id);
> -			basic_inst(fd, STORE, hwe, dev_id);
> +		xe_for_each_mem_region(fd, memreg, region) {
> +			xe_for_each_engine(fd, hwe) {
> +				igt_dynamic_f("Engine-%s-Instance-%d-Tile-
> %d-Region-%s",
> +					      xe_engine_class_string(hwe-
> >engine_class),
> +					      hwe->engine_instance,
> +					      hwe->gt_id,
> +					      xe_region_name(region))
> +					basic_inst(fd, STORE, hwe, dev_id,
> region);
> +			}
>  		}
>  	}
>=20
> -	igt_subtest("cachelines")
> -		xe_for_each_engine(fd, hwe)
> -			store_cachelines(fd, hwe, 0);
> +	igt_subtest_with_dynamic("cachelines") {
> +		xe_for_each_mem_region(fd, memreg, region) {
> +			xe_for_each_engine(fd, hwe) {
> +				igt_dynamic_f("region-%s",
> xe_region_name(region))
> +					store_cachelines(fd, hwe, 0, region);
> +			}
> +		}
> +	}
>=20
> -	igt_subtest("page-sized")
> -		xe_for_each_engine(fd, hwe)
> -			store_cachelines(fd, hwe, PAGES);
> +	igt_subtest_with_dynamic("page-sized") {
> +		xe_for_each_mem_region(fd, memreg, region) {
> +			xe_for_each_engine(fd, hwe) {
> +				igt_dynamic_f("region-%s",
> xe_region_name(region))
> +					store_cachelines(fd, hwe, PAGES,
> region);
> +			}
> +		}
> +	}
>=20
> -	igt_subtest("persistent")
> -		persistent(fd);
> +	igt_subtest_with_dynamic("persistent") {
> +		xe_for_each_mem_region(fd, memreg, region) {
> +			igt_dynamic_f("region-%s", xe_region_name(region))
> +				persistent(fd, region);
> +		}
> +	}
>=20
>  	igt_subtest_with_dynamic("long-shader-bb-check") {
>  		struct igt_collection *set;
> @@ -604,6 +626,7 @@ int igt_main()
>  		igt_collection_destroy(set);
>  	}
>=20
> +	igt_describe("Verify memory relax ordering using copy/write
> +operations");
>  	igt_subtest_with_dynamic("mem-write-ordering-check") {
>  		struct {
>  			size_t size;
> @@ -614,10 +637,12 @@ int igt_main()
>  			{ SZ_8M,  "8M" },
>  		};
>=20
> -		for (size_t i =3D 0; i < ARRAY_SIZE(sizes); i++) {
> -			igt_dynamic_f("size-%s", sizes[i].label) {
> -				mem_transection_ordering(fd, sizes[i].size,
> true);
> -				mem_transection_ordering(fd, sizes[i].size,
> false);
> +		xe_for_each_mem_region(fd, memreg, region) {
> +			for (size_t i =3D 0; i < ARRAY_SIZE(sizes); i++) {
> +				igt_dynamic_f("region-%s",
> xe_region_name(region)) {
> +					mem_transaction_ordering(fd,
> sizes[i].size, true, region);
> +					mem_transaction_ordering(fd,
> sizes[i].size, false, region);
> +				}
>  			}
>  		}
>  	}
> --
> 2.34.1

