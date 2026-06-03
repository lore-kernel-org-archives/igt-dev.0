Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BE3CD6E4A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 07:50:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AC410F995;
	Wed,  3 Jun 2026 07:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/O/eu/u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF7910F98D;
 Wed,  3 Jun 2026 07:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780472989; x=1812008989;
 h=content-transfer-encoding:date:message-id:subject:from:
 to:references:in-reply-to:mime-version;
 bh=JVD9xlaqox1GbIScKY2Kgt5QB5rXNp3I+Id34sxgWxk=;
 b=g/O/eu/uOzcgR0nqc6IzYF6NHxOVfNbxAbZau1kENKKbFucuNZgMLMKF
 U/6bk2yJDjnQZfcKXDiHcWXQn/SMc9kZ29yuIWecpgvLN0ksEdOwn50o1
 aPQ9Ym01Y/Zb9zLYwB8HhMW+ZpW/0WPL4HrqzTFJ4X+lxLb19yLgZ8KH+
 37/5d+LZgwt0U5Lq2UQiQSZmnXjMDf2sdhvvzqduv69z/nLYaEtKfDMQc
 YOCYWBSVRfJ1DEUkU9mNXlOl7kPx3oItm2+1/GPTTLehtI5VNLF8Jkcvh
 jc9JxvsqUDvaCq9F/9tNj/8DvO3cO8KWgTqWexN8N1MDsh8T7NEU5akGz g==;
X-CSE-ConnectionGUID: 3Fl17QP7Rq62Pq04g+9rmg==
X-CSE-MsgGUID: gRu8r17PTgO2csH7Tckc0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="80413677"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="80413677"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 00:49:47 -0700
X-CSE-ConnectionGUID: 82Nua31GR6ShsfShreDLGg==
X-CSE-MsgGUID: VWAPREO2Q4uapcYVt1mIzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="249076654"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 00:49:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 00:49:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 00:49:45 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 00:49:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wD+IycsXs3ox3F5+l7noCZyvWfjMhlRN4eniFaZdwqWRlsSQxZpT9ao5DP0oUlV5CtzesFKV6vbe2Fn/XqMHoRwq9/ltg3VR7romjYl+hhyfvkZeWBNXswq7Qjiw3OWFsVdoqlbGQtyidLU1E2T3xolrusTsTlQyvqNOzYebVYoUGLuWB1pa4PGaDOuKQDkWdK8icSD2zHhrVbz4HlMPiDGoTlPg8O4f4ht4S2IeT9uLGBXNFCEbbcQo36Nk7rf938GCy3mzwjBfoHRz0zdZq6P/Xqf/1AwPVAeFRUEqdDwd6DSNFdqmbmZmwIEOYU85w1vKUeY8PH7tjRDveOrIpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xj0rHYeyGc1WIwOMtC4eNHXDi154JfgzEv3skGgmUhI=;
 b=dzGyV/GLBt2ngIFHv72XypECak7PhqLPIf3TmEH5VtilXcNz1dcoD+y/9usfL4e6ssRNU70UnF2KE23mfdtwHGTC61/A/6vfGK0AA3PLNqS4aCbL2vYcSa6l2VQriSqzfs2Q2RkC41E56WEtJpe8K6nudTKd0Qb7z+6pbt9HIv+nv5/QqQUn7w1XRahBR9+DDOMLgSuG7IQdowgIOj5IyZHy+oO/6CdvtF39TO8tsAzphPnWPcn2lhsjPBrehpDFIlpdYH9jS77AxSqKMfeh3imBOZOZlr7RMxKuRmR/ViMNYqGvu7rXnKAJqoZN7SFLgscPIRi0/J1GztGpYKUYbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 by DM6PR11MB4675.namprd11.prod.outlook.com (2603:10b6:5:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:49:38 +0000
Received: from SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833]) by SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833%4]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 07:49:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 3 Jun 2026 09:49:42 +0200
Message-ID: <DIZ8ZWJ2AQJU.138ZNL1LXVX04@intel.com>
Subject: =?utf-8?q?Re:_=E2=9C=97_i915.CI.Full:_failure_for_tools/igt=5Fpower:_fix_?=
 =?utf-8?q?Xe_crash_via_drmtest_path_helpers?=
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, <I915-ci-infra@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <cover.1780397630.git.sebastian.brzezinka@intel.com>
 <178045488091.38098.11789898288908217698@6beec6c84f66>
In-Reply-To: <178045488091.38098.11789898288908217698@6beec6c84f66>
X-ClientProxiedBy: DUZP191CA0071.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::11) To SN7PR11MB6897.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6897:EE_|DM6PR11MB4675:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ba65a1-09cd-4387-c612-08dec144a971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099006|4143699003|6133799003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: tfknVIm8SCxSL92iljhT6ql9jJoWzRI2oDxa/fpq0GUYOcyZS2goPJo6oPj9a9nOA1XjuATQKft06ZFt/cp7cSwOL9qEi5qJxZL6u8zFOEGQXndu1QBq71mj9DqnU5OBE6qJgbfs0ObBJnufXWJsqDE60hQ1w+QkfazeCVSJiwLjFXfxaQOEidewjhZ3FdtP/NCx5FKGOW/+om45bhbVH/5nYGBCeVmkI4QazI+zMvnp8co7lJrFnp9fspTMZU5mc0OYaK/gA5xJpYCTXJoftIyDTOhJ2J/U5ACnjjeAI3+DM0HPDxB+/i6Xon0CzR9ekh0apCCKHLH7m97Ca+R7V31NIp4E4plRumzS1jVelQqBPKZVw6P9SSljV9zlIlBSQRn2CyvchnnVGnd6pj7L7S/PCHouIUaTXXr/XiU2duCr2NkBotlQpWqyqUlw+6RlvbNLmcKwlVvvTcYbAti7ZqHCmHoyJt0iunOQYTJIgKle2X0gjd9I7kTdRJTtw1XYJCk488vocpjxa3GQ64yNf9cBHw5kVZ5PEdGPVwqg9mOXRTf2H66SyxIxr9jH3K7oy5Upxg83MapZbd02XPVxYPTrrHPfRMVeCCiaUp15MzzGWFR2M/1mndWJuTTRiiivAidYb1BKRQkwAcfu3Rjncg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(4143699003)(6133799003)(11063799006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUk3L1c4Z2RIWUoyTHdHc2Urekt3NGNGRVlFZmU5c2ZIYnJTeDJaN1p6VVF3?=
 =?utf-8?B?Z1IzOEFIWkc3Y2w5N1NUOUVQb0ErSThZeVhUQUZJVGs3QlI0UEozaW5Md3Ft?=
 =?utf-8?B?MVhROHhZT2VUc3hmdDQ5VUZwMWFPMUl1NE9pL2dRSnNiNGwvdWs3Q3dtaGdo?=
 =?utf-8?B?TnlIQU5KQ3lMeU5mUzd6RjlUM05TSkU5N0h3R210YmdVbkdZanFrM2NwWWpu?=
 =?utf-8?B?dkthSVoybjh3c1pBOWVVc21ITVVST0pJbThoRzczd3JYVm9iNHMxWVhwcngw?=
 =?utf-8?B?RmZaOVMveVMwd09HKzFSczNEdlV2RjdySG1ZaXNWUWk4cy9BelJQbVdPRW9Z?=
 =?utf-8?B?WXRtRDlxQmg4VzMyM2tFbE9qQmRTOC9uTndRY1RBRlNsQTJLd09nSyt2RXlM?=
 =?utf-8?B?QVRUckNhNnJ2YWxUM1JzNHBxQXdObGdsTlBadzd3aUxOaytOejI1YUlDa2ha?=
 =?utf-8?B?SS9SdlpzcUVkbExzU0x0N2NJUXZMM2dmdHVKZVI5SW1qa09iSHA1aStEdEdp?=
 =?utf-8?B?cGpweVl0TjZSVElrT1AzY1k3NS82ZitTaytyK2RYS3RxYkI5a2x0R3NmM3Z5?=
 =?utf-8?B?RmFPby9lWDVVN05kQlJwRVJpUGJZZXl0TWkvMFRja1doRmVyQVdqYTNZTzBZ?=
 =?utf-8?B?T002TEZYL0xyR3FuNlo4S0NuRG9GYzBxSlVraDVweGFHVVhIV1d3Vmw5NkdZ?=
 =?utf-8?B?ejZqdmpuK2trVjIxamxDYzNWZnpIMklPeXFNQnFpOUQ4RTFGOGJidWF5My9H?=
 =?utf-8?B?SFZzWWxZb1pvK01KbEx4bGV5Um1LeU5KQWF2ZXkzWVZEMk80bDFJbTlZVWNj?=
 =?utf-8?B?QjROZFFRdWpwZGVGWlAvLyszR1VLZ0ZTNkw1U05SVTBiTDVIeVFqem5lMGcy?=
 =?utf-8?B?MXUwRW81WXhhd1JFM2QwZEVmVDdTTkNZUW9Hd3ZXdmdZSEUrZ3JyaVhNbnp3?=
 =?utf-8?B?ZEplUjhHbWtpWm9XaWdZZ3hKbURnOUd0c3pRNUhHUGFCOGFhRExIenI1NTgw?=
 =?utf-8?B?Y1JRRm1pay9lWkNlcHBBaWtlZEdncnhuSG5TdlV5THY2RUdjdG9CUk9HY1NH?=
 =?utf-8?B?M05LdFY5V2xRS2VRanU2LzNwcnNpQTAwZmNiMHNzb3BDaTZneVFySU9pQmRI?=
 =?utf-8?B?cGRJY0FHdEc3QTRPeTNUTUNtR1dmcy9uM1hHejkrYzBXeDBkcnJpL2F3VWRs?=
 =?utf-8?B?alNGYjZlQ09GSEJBZ0g2TVVRUWdYMVFaYVZPd3hzWGEvUnUvYUt3aWltL1E4?=
 =?utf-8?B?bkJJZVp2L1JmeEZ1NVpkTnFYb3BEZ1Zmdk5kbWdwUVZXL1ZzODF4eHIyVDRu?=
 =?utf-8?B?TENheG92NWovY09tc09zOHdldDgxL2JlQmROVUhnaVQ3ckkzUVpXU01kWVda?=
 =?utf-8?B?OXJxVDY5ZWlkMWdHMnhxamFxa3RGWklWS0dCRFQ4Q01uZm0rS3ozYUpzTjhm?=
 =?utf-8?B?M1JGZExVOHM3bFFDWmk5RnJOT0RmNHhnTTM5WFBiNjFHTCtldGh1dUdTRUZZ?=
 =?utf-8?B?L2RmQ3F5akpOTGVWZjRrQXd1MXpEY1pnaW03YTZMdVY1NC9YQ3Q1K083Qkp5?=
 =?utf-8?B?V0RzSXVDcXBIZU5LM3l5L3VwWURMUkJoQ0ZQRkxrZWh6TCtGdVF0QjRYajlu?=
 =?utf-8?B?M21ZczdpbWVVS1VaTzc2WFo3MDEwMzN4aE4xSmsyN2VLdmwxMzg3VWRPcVNo?=
 =?utf-8?B?eWt6ck5WVys1eU0rM2hVb1R3UEJ4dWlYUUlZRE5jMVRXNjNMaEsxR0laR2pk?=
 =?utf-8?B?Wk9KWEZNQkx4dUtiYnV6UlhOYWJ6aGpKdVNWNzhwZVRsL1hSVmJDN09HOFlF?=
 =?utf-8?B?RWxjaXNkYUZSdThtWkdaVk9OUDUwOVZxSzkwRWJZR1FNWk96YURDR25ITW5l?=
 =?utf-8?B?MDBuWWM3VHd1VGlsME1MRkQxQ3QwRDhvQnkvZnMrSCtVZzBReUVhK2k2ZnhX?=
 =?utf-8?B?cUc3YkUwQkNkNlBFMjEvT0NWbWIzeUozRTB3b20wN0xPdHJxeHJRd2Z0WkJD?=
 =?utf-8?B?NlNlWXd5dDc2dXdybG1HTFR5ZGNpT2J3TlVLZW5LeGtuY2t4aFhacUFMMWhV?=
 =?utf-8?B?eHU4Sm5iMk02WUdyejVYbE5mL3JUb2J4cFNqcUxTWVFCSkVTNk81VGVaK3hO?=
 =?utf-8?B?TWR3a2FPd0xURzlhbFlLWUF5U3pDL2xTOGxHcVVFWVpESGY0Tkk3Rk02RFhO?=
 =?utf-8?B?SVYvQ3B5cmQzQ0lwTTlXSVRwSGllY2tMY3VxTkovZUpRWStGWTF1SUZXVm5h?=
 =?utf-8?B?Qzl5cnp1QndjeHNzV3JOaThwL2VFUktWNUF5cFhFVFVaK0U2SCtBYWVuenVp?=
 =?utf-8?B?YWc1RFUvWU44RmkrTXlKMWhoWHc1eG51SFlJbnlick9yalRHZFIwTGZRNEFZ?=
 =?utf-8?Q?AT7LI+RTQioaT/Hk=3D?=
X-Exchange-RoutingPolicyChecked: nUgb3hw7Ms2cIHlg9iHTYG/D4MsIGIlR0dbTeJe7L2UjjZW6W6hQcQbaD+EUF1xrezJR+wHoc21mnAIx4GyIJZGV7/MBMG5yL3LFR8kvNEfqg+aoypsTo75nJRhAHJ1CFumH2VvZWpRBUCysG8RqLcRacmbNLf2h3dYgnQcUQpoodIVeIiUewABIZ3G4770FS1QW388jIJTShScVGC8CZmdkCUgxS6Zr8P2bWThATGkI27grIDC5xpaCRh4e5mDOdC4+jdK1IA3f8v7w5f77/qDMVHO6AS84o4hoqos2xngvuoRN5sWqRZwBCVfxiwELHggkKCN5n7JTDzOFmDL+qQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ba65a1-09cd-4387-c612-08dec144a971
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:49:37.9534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypF9GiMJJprWvQZCahXW6RHaT5NdGYew5h2XqjuI/oIk5ulP+6TC2b3Rtz2a6xMXG55lKWqFLwKSbxygzzrqHm4L/3wv1pv7ZP4yLeJEPUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4675
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

Hi CI-infra team

On Wed Jun 3, 2026 at 4:48 AM CEST, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>
> Series: tools/igt_power: fix Xe crash via drmtest path helpers
> URL   : https://patchwork.freedesktop.org/series/167738/
> State : failure
>
> =3D=3D Summary =3D=3D
>
> CI Bug Log - changes from CI_DRM_18603_full -> IGTPW_15285_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with IGTPW_15285_full absolutely need to=
 be
>   verified manually.
>  =20
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15285_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in=
 CI.
>
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15285/inde=
x.html
>
> Participating hosts (11 -> 10)
> ------------------------------
>
>   Missing    (1): pig-kbl-iris=20
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in IGTPW_152=
85_full:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:
>     - shard-dg2:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18603/shard-dg2-1=
/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15285/shard-dg2-7/=
igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html
>
>   * igt@syncobj_wait (NEW):
>     - shard-snb:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15285/shard-snb4/i=
gt@syncobj_wait.html
>
>  =20
These failures are not related to the series. The series only resolves
the issue with the tool.


--=20
Best regards,
Sebastian

