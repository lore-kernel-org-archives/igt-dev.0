Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3E2C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:08:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAD710F931;
	Fri,  3 Jul 2026 21:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIc1Usg4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B6A10F937
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112747; x=1814648747;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qKbQGeDSLW6t0+e8S4dMy2F/g1+U+90Fkucs2hTbwIE=;
 b=YIc1Usg4vggCQfLBSCmui2y9JKKdqF3YljvyANZr1sGVaq/8F+H9bqEB
 LgvMsX6VJOUSWlO0/kGWSUNeU7cjzVLtYS24GLs1mRT00Wuwku1vpt8J3
 dWKRBZ6ZY7+U2T7CVxWhrGcDTxtMjCtGZ60ltiPHsNyvRPhFytVuPYqE3
 CUoZcVq6H7YOLKBegObunH16/1AqPD1wQFegpzLjWwpsU29X5TWWnBSya
 ucaIh1QCBD23VJpWulICsRuwMYPgZz4KYbfb0VoVUBPdsqWve+UlMOcnC
 rpnWgAphnPcKv3ZqcjdupM7OHTCHbiI7DZVJDIGcFTGWn0/2UesDgDWOR g==;
X-CSE-ConnectionGUID: Ac3mL0gSSl+pkUrtXHb1bQ==
X-CSE-MsgGUID: TfDxBnQsTXCR/ZXN75kBqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86408902"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="86408902"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:05:46 -0700
X-CSE-ConnectionGUID: 8HxzR1H/RCS+BW6wqrcYJQ==
X-CSE-MsgGUID: SRK8fohYTQaLn2RKJ4mLWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="277517950"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:05:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:05:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:05:45 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:05:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=poR6rAt5I/tkKOpZwxT8UnVelWARz1CVFYVbpHNr2D71S/67uFa/XZYPUOMA+KqfVpsJCWIDt7uvDROumQ5xtsF/do+VX0wI4U05QGIzxFugS1K5UJ6lFTwFpbw1h4ecp6xr9D6yT7jXlG/btxJuDsqLpSxNk17wcyXEa6kKWcJ9eLCMfDI4hrWloLaV/dpha0GEUzIodMtSUHtjJ59Ok5s7/9uVMC/DqJdB+CsOoLvIN/g2wGd8mSYFsmOvLTzyN1uePz75+XRmPDNaBMptqzk+/H1dKNvc3uDxEj5q1lNmydVL5hD3bOy5NbQVSXXi3ZOEismfdAwYTLBUk7HubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13XgvVI+SRUqXmrHI26L61gwNjmVQ/yOsyLFtTa3+40=;
 b=oiJbskYIeIoQRYolKn9/ybO26KVM7iconZo5kRnsFQOv9Jmas+xw9oyh4vqFlat46NyV2JSyDWpNvuXD4+MTcc1HGXC7g8eMzuIya/GxVi6cbDk0KAojNo5OpCqmNJkR0GUHzFClW5bZTjUoMxFzx+bJ47mD0M5JIJ2DOYE2RvcDGEIgv1vOmZBazUCL42Ho9f6aao3LzrOslIEi256ftQWV6rU76DMHsWftycpljfNSBDcEY80/pcVKLtn0uGVSQywu7ImO+RuIYN+3sauh+Bwqznz9ilCH8NtbMmBKeEayuKkpdn49TXgzJ3K4n0dvjsPpwEry55/gPk8EhjM7TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 21:05:43 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:05:43 +0000
Date: Fri, 3 Jul 2026 23:05:37 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 20/31] tools/intel_lid: link with minimal
 sub-libraries
Message-ID: <y76wimpuxpy76mgkepqgsqx3c3qicctvnqzt247us5idozhtir@26sdewjt2yyp>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <6eb966962619af21ed2c1db21d802bfe1c8a0dec.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <6eb966962619af21ed2c1db21d802bfe1c8a0dec.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DB8PR04CA0030.eurprd04.prod.outlook.com
 (2603:10a6:10:110::40) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e24dbe7-f258-4a20-5142-08ded946d865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: 6DXcnKCeVhUNgtEGPKkWNXJI7kO74vMzSH5lFrNLIkDSE9JWY3oKL0OtTIB+TCb9earsFzs+rN4JXRNhC9BwHR2R1Var9nArUyw5jiXGZn3FcR+E+4p3Bzq5nf79VyG9aEVh15cWijyn/iDs8gXhx37yCWX+HzmaZ29oRZ6kD6FrX+6txtPz2Xe5LGihFEbrJPvPkAYVPG8xzokHcR5AUx+xiXiFsMvfeVupAtWyirnijRKm/BuScgkpKCnJ+Poo6qd10Baos2ng5w62tEDG9LiKJrBiZV4zPZ8/963wleJV3DI1kXqIPPkz3GG3u4I5WdLUjr2hE+HebiVdDtAVCQ+Pv5RfPxa9AWjwbIzcvgbYHoo7lg9HEAMoI4uqbNjUi5ELbuplpggR7bCKhkB6JyFlepvldsEUiAPTFvRVVBwSelk2ugUkRTxZpBn8sqtNvUQJHojqqYKGwqluUnHUf2AXU8ogL2RKDySQWelB/iehuBKT4yz5Q28lx9esI/0AyQ4BZPZXDkpIPnBGJAuQxYfuJBwJrsyh8kHb6JID7L8GlVTkugCM/Kj7/rscYxQfTWGEAZgWGFPsarNKc6ALqQDknTKNqHrKZPD0SShJX5I8PPoO0QomNdPjsUp/IA2iHR+jkGpdzwHgjqtyAoYMQqbnu5jYUWWhVTT05V9Lbes=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzNJNXZacXpTN1ZaZEZtZyt1aTlua2ttTzNhN1VKdFUzWmk4VGN0QnIxdmpI?=
 =?utf-8?B?S2ZJRWJ4eEx3RmhkRHBLeWVGYmhzNVhjZlYzYzVQeXkxQXJ4N0FOMTIrUDEy?=
 =?utf-8?B?anFLU1A1eHBzaTZoZDFyTmdZQlBXdFEvczNiZERtOXo1cWNqaXdEUURtdmx6?=
 =?utf-8?B?SGlvL1p3L082YlU0d2hMdEk3NmlteE16TXBicmlnbmZ5RnZoTGdWME1uaVl6?=
 =?utf-8?B?ZUZMcURHa1UvVXhUVDRLTVVHOUw4WHhFdlBUcXA1Y1pXVUJNWDRPbldHakJZ?=
 =?utf-8?B?RG85WWdTN3BVTFNiemJoR01sOGY0NllwdEZWbVF3TXcremxTV0x2WU1sMWVI?=
 =?utf-8?B?N3NaMThsQXlKd09JM0lrV3dzYWJqT21iTWFsQzVGYzJvQWlWd3cxT05maStB?=
 =?utf-8?B?MVJpMjNGSWZjNGJyeUYxcWo1MG1QSjhha1krVGROdkd2bThiK3pVdFVOdFZT?=
 =?utf-8?B?RVdqaCtYcGNRRFNLQndyTEVORm1EalN1MitMMkpHWTl5RnpKQ1NhYnlyNExo?=
 =?utf-8?B?Um9NNGJKRHoyTHdHZ1NPK1lwQ2JUZHdQRm9UWFl0RCsyUWlBQjhZSGIzZFB0?=
 =?utf-8?B?K0RISWlIZVMvQzVyQlZmcTJvZVArcDJ4RThCa1FSTFlJVGFpZndob2RCa1BN?=
 =?utf-8?B?ZFNXR0kvNXR2aUk1bWNtNS9VMHJpeFN5QWdxcXp2VXVYYSsrbDU2UlRhYk1l?=
 =?utf-8?B?UEpsMVFjaFJ3MHI5eVI3bVhVOXREaXlvUGxQVytYY1JzMEZvZDV6K1g4UGQ3?=
 =?utf-8?B?eHhiS3BmQ1RROE00MGZ4cnFvQnhrS1VTSnV3RFduT3BFY3dWekJINFQwQzJQ?=
 =?utf-8?B?bDJ2ZE5wTmQzZ0JDeHJCRmhjU0FObTNYaGo1YUVnempvZTRVU2puZzlBMmhG?=
 =?utf-8?B?Q3djU2UvankwbEFZNkZYcHI3R09WWkJSdHRISThLVFRMMWJ6ZW04WjcvNEhp?=
 =?utf-8?B?Z3pGRFQ1OXBhekR6QlRYUEJ4bkJ5ZUpNOE5oVG4zaWlodU1nK0J2bkZSNjdT?=
 =?utf-8?B?dytGNGZRL09UR0U0Kzl3SWxzczlTNEl2MjU0ZmJvWFArOU9qTDBvb1RqS1pL?=
 =?utf-8?B?MU9wWmp1VmpnbHowMlJNT2xvNUNydDMwb3gyMVp4aTVhdHptUXZVZVRGS29x?=
 =?utf-8?B?citnM1pYQVo0MmtId0d5ZTc0L2d4WmcyY3F6WUtwbW5NY2FEaUtYd21pOEdE?=
 =?utf-8?B?VXBsU1FzaldpWWk2ajF0bWhaR3FkbkhNYVk4WkV0MURZK0lYMFA1c3Y3c1Rs?=
 =?utf-8?B?eWRnZGhYV2x3YmFPSGE0dDhSSEtsemw4VG1VaGJ3MjU5TFBicFVoeGNXYUtJ?=
 =?utf-8?B?dDFpTzdKS0R6OTliK0M4QWwrdVJxcWF2NjE1TkVSaW04N05BN09nRnJzL1Bx?=
 =?utf-8?B?WU1xRmVWYnM4cGhqUng0ZDZ0aXpCTnZ3TWlNdm5zeTVtUGdsMk9SbHRXUzJ1?=
 =?utf-8?B?dmJrN2xaczdqaHU0ZjB2ZkswclJjUVJZSmZxYXpnNHp1QUZUck1vcE9vTHp3?=
 =?utf-8?B?WXFxRVU1ZCtFSVQycGhRYzdOSEtaNFpUZGVJVE9tc2NSS3BIVG9CVXhyNC9n?=
 =?utf-8?B?eVRkcU01N1JaNDhaaHJubW10WjdFVWx0UnptV0dzWTc1TmtmcGNHNUwrUTRq?=
 =?utf-8?B?NHBhdjFGeU1NSVJ5RnZLSlNxK1ZSd292cWcycjZNRDB2R1pBamFIaUxhRnBt?=
 =?utf-8?B?UHZmd3J0S2h0RGtLNTdEZnVDMll0MXY3MHRQN04zS3hRb1dGZExyd09TMTVF?=
 =?utf-8?B?VVVzeFNQcUFNNHVJUXlYeWVmRTJTNGllcnlpQlkvOG5NRjlJeWdSQ1h1blBB?=
 =?utf-8?B?dzBwbndUb3NvbXNiRE9yUGVtKyttMWJ0ay91a2g3TThia2xoQkRoSzZqVVRq?=
 =?utf-8?B?WXpibG9KRElwN1ROUC9PV2dNaC84Nm10STFqeXFCTGNsWmdEZUU5M0RUckF0?=
 =?utf-8?B?a2ljSHU4aVpOb0lrd0NnbzJWcU9rZDZxRXAzeWRmYllnNnlMUDR5TWkrVFQ3?=
 =?utf-8?B?THZiTzNXUThsZHJLM09tTkUzaHhlWUNERkhGdEFHRVJON1BPMFJqV3VlSnla?=
 =?utf-8?B?TzdSd3VWaERlQ0kzUlVxcFpyT0k5amFmQU9IWjc1aGpDcy8zM2dwMWhxUkJQ?=
 =?utf-8?B?SWdQbFBvYkhuaTNIWG01RzM1QXh2aXF4NFpzUGlyQXB2U21QcEhZazFoMS9y?=
 =?utf-8?B?aEE1em5BYU9JNHU1UUlqWHVnOGcxYnFDbXZhckRJZEZuTG9EMFNJRjNCMFZQ?=
 =?utf-8?B?TTh6ZVlKVnVaSlBaZXpzeFJnWW45NURDVGd2UVZkUzI1Y3ZVVEJwLy8yQzM2?=
 =?utf-8?B?eEJ5U2hGdmE4RDMxNmt0NWpiR0RucjkxcGg4c3BoQ0dqWHFjeFB6T0NKamxM?=
 =?utf-8?Q?FsDB9ntG2ZSvOcRJ2y3XlQDD2zlcVCNajzXo17uRMZQtg?=
X-MS-Exchange-AntiSpam-MessageData-1: 41+AoGLch6p8Y1WciYjVYZ0xfxWpOL8+OD8=
X-Exchange-RoutingPolicyChecked: U8Q0U8MtjBmpvYXN530X9UIu4OIWdnNBO5PgtrXw/8SHmcaEBNgIKOjXZ/qGOZx11WSTZ1TKjCe8gDDUBQasBU4beX7sn9oOs665Q4So0PkXXC16SPaLp3N0d+ywawL3+WG79p6adaxenP6OJ1nPXouxmQCEpotwwbqekLWzKE1gouqUymjuv6R9k5XNfWZ5pQT2W2WXNjbCI0bUiLjk0NNTQcJjoPOoJuU6X8bzZRF2EPXGYrGiOUX1RUNL9zbw9C9JNVb7WZj38jnyccznpRY4LA676MFxmKO7355zbDYkQveQ/rZUlyILFJhiXPUMGKSt+KmhGkwsenkF+uZ+og==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e24dbe7-f258-4a20-5142-08ded946d865
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:05:43.5613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lIlgvrib0O7Uz/CvfSOScdy9TCrqqM9MpUvNynom1nINDWnGphKt9Iz+Titm3IVtPo0JigFLEofq+DUO7SPi5SuVZvLfdUKChWABabNRNiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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

On 2026-07-03 at 16:28:54 GMT, Sebastian Brzezinka wrote:
> intel_lid only needs the register/MMIO helper subset, not the full
> libigt.so stack.
> 
> Switch to linking against lib_igt_reg_tools.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 8899a5b49..0978f8f11 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -25,7 +25,6 @@ tools_progs = [
>  	'intel_guc_logger',
>  	'intel_hdcp',
>  	'intel_infoframes',
> -	'intel_lid',
>  	'intel_opregion_decode',
>  	'intel_panel_fitter',
>  	'intel_perf_counters',
> @@ -96,6 +95,11 @@ executable('intel_backlight', 'intel_backlight.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_lid', 'intel_lid.c',
> +	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
