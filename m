Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6607F109C057
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 19:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10ECB10E7D3;
	Wed, 25 Mar 2026 19:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKhQAsMT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322B710E7D3
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 19:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774467380; x=1806003380;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=7m4gTyf37hcMCLBq0I4v/VsNZKH1ijGAeSZULhlEU2M=;
 b=gKhQAsMT3xZTwuftHq853+V9r4TbkExp/v4Otb7aYR4fcdjB/4YKLs48
 xY8Bq32EyolP69PWzSv8PeB57Z+GLJr7GLiNbRXskuCtCycPiP/1Ar0+U
 Bq7OWa7A1QYuEqEhoEnAsXXck6FcjsUQ8GLflAnKUYtRj9GO71JfW8EcY
 Zw4ZPJsgNBsv0wPNdbqouFE7icxvpw4e7+95HtZsxVJYZyvIDS7fukw0A
 l1hHos1hN/n8pcNXxO/2e52nrebyxxoYWDiUiVS45IohYjNqUIxa22ilN
 WkvjjnPcix7WbazxzrxiCa5/6KOQZKslAPWECNaW8+QJRjSR9FJC5xrs0 Q==;
X-CSE-ConnectionGUID: siu95nl/QbyQ40Wc7Xygjg==
X-CSE-MsgGUID: gOlAap8vSlG3tmyW63gq9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74542700"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208,217";a="74542700"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 12:36:19 -0700
X-CSE-ConnectionGUID: CL65xcjcQZGcY3Kq8tE/hg==
X-CSE-MsgGUID: iEjqQErnRAagH0GgdWrPsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
 d="scan'208,217";a="228845416"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 12:36:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 12:36:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 12:36:17 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 12:36:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d20dmwnV3Ur9gSO6u2ug0EommhFlUxWyUSqTuoLAlmoBA2CBN+fC0VV0B/E1iYJonG2m14TRGbgRTml4cvnwaElw31QtEoiMBTKHd7BxjuvQnm6lxKG6RJU70dTdG05zAtVkblEyBMjjYIphYzHUr86Ezqj4f0SByXfYZuAWFhaGIN9goV4obnAFMWBcfXUIp+nb7R+usbjlMjkfpLxfYRE5RrRF+yMiNdjnBYYjWrHaikEKKVLnuDIYh7DdrmVrswa/WAmGlnIG1cQSmvjh1dIrvUNvoGQCzjIQfdj3+sauTMAYYdv3RRpjML++RxUFE4n3VnI8NkDJF6x9joJWwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6eP8xnCUFYavgvq+7xy2IZVKzvDKaoc/toTZh3HCHc=;
 b=RfGfszXowVgfeqcVLgT70MU7savW1ET+kFbDiwKqcJ+7aNZQQFqWYYtc3HOqKyirTBeCtfmuHL78RQq7zZxpI32YZ7z/Fs+coFIhjtRiv42zk3BVU9bra5ofNeeDiuiU52qO4RZk6W1Nd6AQgu6Fs09uZ45ffxUN024mQxCgascCjOxYjASpCQRvDiwgGiGgzqNmCRocS9/VhGNBCuv4hD7v7WW3a+5X36K2FB9b+apqrsrFnXqyEMqtkpvJuyGMI2EZQZSr2z8s+OmE9Cfrf6axOhhS6tD+trmWU4D/u3bOq34dilOjkrDUva2ZA6bH4bamz+RCcYDnmpgaV7Hi6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SN7PR11MB7537.namprd11.prod.outlook.com (2603:10b6:806:348::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 19:36:15 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9769.006; Wed, 25 Mar 2026
 19:36:14 +0000
Content-Type: multipart/alternative;
 boundary="------------cFAAw0z4w8R7z7TZlg5h0xhS"
Message-ID: <40842d8b-519d-4bca-8c18-2f800d438f69@intel.com>
Date: Thu, 26 Mar 2026 01:06:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_color: Add 10-bit color depth support
 to gamma test for MediaTek
To: Jay Liu <jay.liu@mediatek.com>, <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Paul-PL Chen
 <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20260320073409.17337-1-jay.liu@mediatek.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260320073409.17337-1-jay.liu@mediatek.com>
X-ClientProxiedBy: MA5P287CA0206.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::7) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SN7PR11MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d4f217-0ecc-4168-27cf-08de8aa5c70d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003|8096899003;
X-Microsoft-Antispam-Message-Info: M3frbLLCus4eYIpyhbdxV2wIL7HQsbFmzpSNd9f7AMRyUvwi8eAzH2Ay/q8eFiEdIHr9o4PxnVB7s6TunM6gdeuc8uz6TIiBwFincPCT1OG1JMJ0uqFDUotfggYAX+fOzWVqqmoRN9RRifkQPllorjj2PXv6iL4iwCc0dXMv90tCaaxyxgWm/XtA4ZeEUhy5Chj9EbvAp900XL2z3v/gZVpm5ghGs3kDHoAlczDrg7neEDTKGUKilCBXAiJARtxxiGW+bOPx1FgWPwVzg2DJ1AcVy8WLCulncmJMXR/Pl5F6fyxFzPGRkkFpcIsG1QN5WS1WdqxGfLrNWzUZPe7BG44TLwFepD34JU2RplS1UEQtvcf7jj3sj8bp3v5j6wlqHzL5WLvocOL47d4KeFFcn0nNIncMNrfIsSO7ljchTPip+gnHkV08qvIdAxyGWABT+j6hH2HPiYxZuvhJeYmOF8P6zkV0YsWTpPV3TIwDCNIQ3IHRHgemppLS577JNV3IOvJLJcKY+GmClKmA3QZcr26SGTYo1D2aCsiGSO/Lxe+lnJKoZ+reiRK7w6siMovuJx3huPPusg8no/BQi+cT2Ex+yR4T5l6nzIYhcm21+WqV7QOYBOYlkokWvKcM5oQsVHhjigcCuE8RoKnl8IxxuTGl4BEJ3tcnXdrRKkOtiRaEl3noa2ck686BB+G7p94JmL5hmFj/osJFtB9TSlTIzOOFRVN6M7XU28hEoxgJn+Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWFHTTFPM3pjOFRXSE5tUFhZQ3ZGdjFTK0VKdGFqbktpRnBFejZWVUZ2dzR4?=
 =?utf-8?B?Q3dJQ1BLdmwyRTBTVENIOEo5ZU00cDJzZXB0aEhDbWV1UmRDZ0RNZlppN2w0?=
 =?utf-8?B?MXBHcVZNbzdVOE9NRmxWMzhBT2hkQmo3TzNJUWl2TDVMSXhibitTNXFTTEJ6?=
 =?utf-8?B?cXB0MlUrY2FJcWNaaFlLYndGTXRCeERnYk5pcTBZQjBCVXNVcVBXTGU3ZS9O?=
 =?utf-8?B?WWM2UFRlcVlnTWRrUFEvU0FoWG5tV0ZSdGhiRWFKYmpDeFdtS3VVZGNhclE3?=
 =?utf-8?B?bEE4b3hZb0FrZkc3VGlmaTBDeTRBQTdETHJnMDdwcVU1OUZNaFRYcWZ5U3lO?=
 =?utf-8?B?SExiL2Z0ZTB5R01ZYjJIcEFiQWJrMmczVm5UYXVnNnE1cENKeU45b1IvWWNK?=
 =?utf-8?B?UjRMNXpYTzVqT3ZJa21BK3BSNEd3MTE0eEEvK01iRlRqem5vUU1NYUVkazNW?=
 =?utf-8?B?dlFFNit1SUJ0bXkxUzFocnAybTB3R1RKQTJ5Q2xCZ0xrRDNwR2I1bGJ0S3ky?=
 =?utf-8?B?UWNWa3VybGxNMmVqcWg4NnNhUGJxWmRKY2dEbkNCb1VDcFpKQ3FscG1YUnhk?=
 =?utf-8?B?Z05yV3gvbWJrTjhJSVE1Z0Q0SzlDYmszRmYwRlQvMzlvVHB3cXFrNjY5emZG?=
 =?utf-8?B?cTYvdFZVMzZld0hNZkEyRFJxS3RHYVNRZmVxNDJjcTVIak9nbGVJZjZkWStk?=
 =?utf-8?B?aVk0dGNKZ2htbjZQOVZCQ2w1bFhLaEpSTWorN1gwbmhVOWVsM2RQaXZiYkwv?=
 =?utf-8?B?MW1aRDFFNVBUVWlwcjQ5VnNpRnlpZWhTVDhvNFVkR0QyWUx0OGtJYzdXVW8y?=
 =?utf-8?B?eUFxZG9idjdJRlpURjRVbHJzdnJibnRtakNHcUZHZU8rRG55dVJDYlFXNWhm?=
 =?utf-8?B?UVFDTXZHRWZmUzhzL0xRbzE3aERyVXMxRkZTWWRpdEwwUnVpWVBpOXd4ckQv?=
 =?utf-8?B?WTVrS3czRktpS2RYSFRVNXd0VEpuaWl5VzNSU2JFaWM3TCtzb3JSTW92U0ph?=
 =?utf-8?B?dHpXTHZiSGxiUW8rRUJ1QlhpU1hsUWJJby9wL2tmT0U5dFZubVZEdVdkbmh5?=
 =?utf-8?B?a2YrNlp2SGZ0YU5FU05PbzlucmRodlZaTkJUZnRLT0ozT0JvMVd2WXFMb3Vp?=
 =?utf-8?B?Y096UEdXaWllcXpCMVNVWUp4ZUFrTWhGRm1wVUxPTmZPRG5ESG8veWZBM3V6?=
 =?utf-8?B?T3lyRVNXckFYYUtRM2JReFlobit3UEMrZTBvakJwNDNmc3RCMnY0NlkwTW44?=
 =?utf-8?B?N3N2NHVIaTUvRkNDRDU4a1ZCcVRUN09rZllxcFZ4eC9PQzZ5OS8vcXBYUkMx?=
 =?utf-8?B?ZVZla1RRQVVIaXVDSkdxZ3pIU0gwWnJ2R0VNdkRndUE2T3JiejVsSDd0cWc0?=
 =?utf-8?B?QVFubkpEb0UwUU55a0d3aUoxbnE5eEN3QzVGRXlFSGU5TTJqSEFGRnpVSHhv?=
 =?utf-8?B?blJURGMvTDRZYnhsWjY4ZnpmVEhqZ2JPTmQ3TlY3enRQMjlkdGk2bldUQmd2?=
 =?utf-8?B?QlAwYjRKYUptVnYvOUpSa0JEZjA1bVN0ZzZvWVdaQk1hZDdnUzQ0OU50RWVn?=
 =?utf-8?B?VmZwQVRtdU84Nnc0Ui9UYXhmOFQ5d2hGcHAzaHdsMzhZSW4rdTh4RVdWNXNJ?=
 =?utf-8?B?WmZaamZ1OXR5S0psU2RVLzhOV1hhbmErYlR1NVRjNFdwMnM0YlI0ZHljcVR6?=
 =?utf-8?B?azBQNFdBM3R5NE43YTFLZDNMMXZKRjBMNExiWUQyOVllQ3E0ODJQaEJrQi9G?=
 =?utf-8?B?aWxJTktNcWsrYml3Z2VITHY0a01rV3VUZnQ5Mnp3MDNESGFlcFRqVVN6TDA3?=
 =?utf-8?B?NE1VdUxSbnA2c3QvMytqUWpVU3E4WXVBcDRleHFVUGV5d0NqbUlkVWV3KzZJ?=
 =?utf-8?B?VXVmelNFVEdkYk5iUlVKQVo4M3ZyV0cyY0dpQ2k4MWZjK1hYeTBFQ25IZTRu?=
 =?utf-8?B?T29CcWg1YUltd1ZMZkpjM0tSUWt6d29rOUE3TitXUE1iOHZTcG9BcTZEc2N2?=
 =?utf-8?B?U2VrTXY1WlBhN1VlTVlEeXVOekZFOVgrMzRXNTJkNGNzbUV1MnJFejM1aHp4?=
 =?utf-8?B?ck1YQkxXejBkOHVRc3hiOGhPdDh4V1g4VXNMeVYzdjVyamNzK3RYTUVmaXNW?=
 =?utf-8?B?Z0Z6QjBSYm5MWXZzVHB3Y2ticTRzNC9MbnpFVVVKSVNveTh1US9IQVZKbHN3?=
 =?utf-8?B?QjBKTzB1dGxGMTd3bVlxT0c5MGx3dXJKaU1LcnBlUURjdk14cjdaZ1JMalpW?=
 =?utf-8?B?Yk0vQXpsRFZ0SjhkMEhLRng0VUNVbExiR0pLSHN3Zi9XaHpERjRodU5PRm9v?=
 =?utf-8?B?Z1NhWFlLcnZMK2prOHdwQnZSTUdWN3U4a0ZBS0tRZ0pVNVkwS2I1dz09?=
X-Exchange-RoutingPolicyChecked: P1MGSX9fUdavurTvW76usfkFVS9S2QzVDbDUEPB9pdVJXZb3AMhYnkcZn4UFxQY/MbAmc7tv1wlFaRtUqgtfnnaol3Uf5se1NJAg5NaUTibEafEg2Gsa6KX1uQjsFBSmgFYd7DSyrLO+fW6F+qHoCJoqlvj3NJZI74ErbgI0Mr+WHaQZWdLPEAx4YbyJSIT5SMH+VneXIUvLM+MqzKCqlPan//Q2ZxKa2FG4eNy7vmPtj/rhMBuf1xvdGpOhWEjhsUd0wbbWW4iXmpFGEQ0J6uD+ThJlz1hOIWFH+7RNirc72bCEmGIVWt8NZQJXLPzbeE1C6jQc5IdpOoh3ZSjyOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d4f217-0ecc-4168-27cf-08de8aa5c70d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 19:36:14.8041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: odFgOtfGU+WO5ST6Ygfp8AtVwdn9lWUH7+U4oilrwMexbE3/gseMgajbHFU8K1XPJdHlwB7biCPtCG+avuDtcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7537
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

--------------cFAAw0z4w8R7z7TZlg5h0xhS
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Liu,

Change is functionally is correct but the commit message and code need 
more clarity and justification, especially around:
-10-bit requirement
-4092 LUT value

On 20-03-2026 01:03 pm, Jay Liu wrote:
> 1.Add 10-bit color depth flow to gamma test for MediaTek devices, which only
> support bit-true results with 10-bit data. The test now selects 8-bit or
> 10-bit color depth and framebuffer format based on device type.
>
> 2. Change the maximum gamma LUT value from 4095 to 4092 for MediaTek devices.

The commit message mentions changing LUT values from 4095 to 4092, but 
the code updates values from 0xffff to 0xffd0.

Since the LUT is programmed using 16-bit values, the commit message 
should reflect that.

>
> Signed-off-by: Jay Liu<jay.liu@mediatek.com>
> ---
>   tests/kms_color.c | 28 +++++++++++++++++++++-------
>   1 file changed, 21 insertions(+), 7 deletions(-)
>
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 565edb2dc..27fc08ab9 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -288,7 +288,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>   	fb_id = igt_create_fb(data->drm_fd,
>   			      mode->hdisplay,
>   			      mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> +			      data->drm_format,
>   			      DRM_FORMAT_MOD_LINEAR,
>   			      &fb);
>   	igt_assert(fb_id);
> @@ -296,7 +296,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>   	fb_modeset_id = igt_create_fb(data->drm_fd,
>   				      mode->hdisplay,
>   				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> +				      data->drm_format,
>   				      DRM_FORMAT_MOD_LINEAR,
>   				      &fb_modeset);
>   	igt_assert(fb_modeset_id);
> @@ -322,8 +322,16 @@ static bool test_pipe_legacy_gamma(data_t *data,
>   	igt_plane_set_fb(primary, &fb);
>   
>   	red_lut[0] = green_lut[0] = blue_lut[0] = 0;
> -	for (i = 1; i < legacy_lut_size; i++)
> -		red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
> +	for (i = 1; i < legacy_lut_size; i++) {
> +		/*
> +		 * Use 4092 for mtk gamma LUT to remap all values
> +		 * to max red/green/blue.
> +		 */

This comment can be improved stating why MTK gamma doesn't map to 0xffff?

> +		if (is_mtk_device(data->drm_fd))
> +			red_lut[i] = green_lut[i] = blue_lut[i] = 0xffd0;
> +		else
> +			red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
> +	}
>   	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->crtc->crtc_id,
>   					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
>   	igt_display_commit(&data->display);
> @@ -752,14 +760,20 @@ static void
>   run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
>   				 bool (*test_t)(data_t*, igt_plane_t*))
>   {
> +	bool depth_10bit = false;
> +
>   	test_setup(data, crtc);
>   
> +	/* MediaTek can only support bit-ture in 10-bit depth pre color */

Typo: probably meant**bit-true. May be rephrased to

/* MediaTek requires 10-bit pipeline for accurate (bit-true) color 
processing */

> +	if (is_mtk_device(data->drm_fd))
> +		depth_10bit = true;

Instead of setting depth_10bit to false

May be we can do

bool is_mtk = is_mtk_device(data->drm_fd);

> +
>   	/*
> -	 * We assume an 8bits depth per color for degamma/gamma LUTs
> +	 * We assume an 8bits or 10bits depth per color for degamma/gamma LUTs
>   	 * for CRC checks with framebuffer references.
>   	 */
> -	data->color_depth = 8;
> -	data->drm_format = DRM_FORMAT_XRGB8888;
> +	data->color_depth = depth_10bit ? 10 : 8;
> +	data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
>   	data->mode = igt_output_get_mode(data->output);
/* MTK requires 10-bit pipeline for correct color processing */
data->color_depth=is_mtk?10: 8;
data->drm_format=is_mtk?DRM_FORMAT_XRGB2101010: DRM_FORMAT_XRGB8888;
>   
>   	igt_require(crtc_output_combo_valid(data, crtc));
--------------cFAAw0z4w8R7z7TZlg5h0xhS
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Liu,</p>
    <p>Change is functionally is correct but the commit message and code
      need more clarity and justification, especially around:<br>
      -10-bit requirement<br>
      -4092 LUT value</p>
    <div class="moz-cite-prefix">On 20-03-2026 01:03 pm, Jay Liu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260320073409.17337-1-jay.liu@mediatek.com">
      <pre wrap="" class="moz-quote-pre">1.Add 10-bit color depth flow to gamma test for MediaTek devices, which only
support bit-true results with 10-bit data. The test now selects 8-bit or
10-bit color depth and framebuffer format based on device type.

2. Change the maximum gamma LUT value from 4095 to 4092 for MediaTek devices.</pre>
    </blockquote>
    <p>The commit message mentions changing LUT values from 4095 to
      4092, but the code updates values from 0xffff to 0xffd0.&nbsp;</p>
    <p>Since the LUT is programmed using 16-bit values, the commit
      message should reflect that. </p>
    <blockquote type="cite" cite="mid:20260320073409.17337-1-jay.liu@mediatek.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Jay Liu <a class="moz-txt-link-rfc2396E" href="mailto:jay.liu@mediatek.com">&lt;jay.liu@mediatek.com&gt;</a>
---
 tests/kms_color.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 565edb2dc..27fc08ab9 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -288,7 +288,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	fb_id = igt_create_fb(data-&gt;drm_fd,
 			      mode-&gt;hdisplay,
 			      mode-&gt;vdisplay,
-			      DRM_FORMAT_XRGB8888,
+			      data-&gt;drm_format,
 			      DRM_FORMAT_MOD_LINEAR,
 			      &amp;fb);
 	igt_assert(fb_id);
@@ -296,7 +296,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	fb_modeset_id = igt_create_fb(data-&gt;drm_fd,
 				      mode-&gt;hdisplay,
 				      mode-&gt;vdisplay,
-				      DRM_FORMAT_XRGB8888,
+				      data-&gt;drm_format,
 				      DRM_FORMAT_MOD_LINEAR,
 				      &amp;fb_modeset);
 	igt_assert(fb_modeset_id);
@@ -322,8 +322,16 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	igt_plane_set_fb(primary, &amp;fb);
 
 	red_lut[0] = green_lut[0] = blue_lut[0] = 0;
-	for (i = 1; i &lt; legacy_lut_size; i++)
-		red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
+	for (i = 1; i &lt; legacy_lut_size; i++) {
+		/*
+		 * Use 4092 for mtk gamma LUT to remap all values
+		 * to max red/green/blue.
+		 */</pre>
    </blockquote>
    <p>This comment can be improved stating why MTK gamma doesn't map to
      0xffff?</p>
    <blockquote type="cite" cite="mid:20260320073409.17337-1-jay.liu@mediatek.com">
      <pre wrap="" class="moz-quote-pre">
+		if (is_mtk_device(data-&gt;drm_fd))
+			red_lut[i] = green_lut[i] = blue_lut[i] = 0xffd0;
+		else
+			red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
+	}
 	igt_assert_eq(drmModeCrtcSetGamma(data-&gt;drm_fd, primary-&gt;crtc-&gt;crtc_id,
 					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
 	igt_display_commit(&amp;data-&gt;display);
@@ -752,14 +760,20 @@ static void
 run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 				 bool (*test_t)(data_t*, igt_plane_t*))
 {
+	bool depth_10bit = false;
+
 	test_setup(data, crtc);
 
+	/* MediaTek can only support bit-ture in 10-bit depth pre color */</pre>
    </blockquote>
    <p>Typo: probably meant<b> </b><span data-start="877" data-end="889">bit-true. May be rephrased to</span></p>
    <p><span data-start="877" data-end="889">/* MediaTek requires 10-bit
        pipeline for accurate (bit-true) color processing */</span></p>
    <blockquote type="cite" cite="mid:20260320073409.17337-1-jay.liu@mediatek.com">
      <pre wrap="" class="moz-quote-pre">
+	if (is_mtk_device(data-&gt;drm_fd))
+		depth_10bit = true;</pre>
    </blockquote>
    <p>Instead of setting depth_10bit to false</p>
    <p>May be we can do</p>
    <p>bool is_mtk = is_mtk_device(data-&gt;drm_fd);</p>
    <blockquote type="cite" cite="mid:20260320073409.17337-1-jay.liu@mediatek.com">
      <pre wrap="" class="moz-quote-pre">
+
 	/*
-	 * We assume an 8bits depth per color for degamma/gamma LUTs
+	 * We assume an 8bits or 10bits depth per color for degamma/gamma LUTs
 	 * for CRC checks with framebuffer references.
 	 */
-	data-&gt;color_depth = 8;
-	data-&gt;drm_format = DRM_FORMAT_XRGB8888;
+	data-&gt;color_depth = depth_10bit ? 10 : 8;
+	data-&gt;drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
 	data-&gt;mode = igt_output_get_mode(data-&gt;output);</pre>
    </blockquote>
    <span class="ͼ6">/* MTK requires 10-bit pipeline for correct color
      processing */</span><br>
    <span class="ͼe">data</span><span class="ͼ8">-&gt;</span><span class="ͼe">color_depth</span><span> </span><span class="ͼ8">=</span><span>
    </span><span class="ͼe">is_mtk</span><span> </span><span class="ͼ8">?</span><span>
    </span><span class="ͼb">10</span><span> : </span><span class="ͼb">8</span><span>;</span><br>
    <span class="ͼe">data</span><span class="ͼ8">-&gt;</span><span class="ͼe">drm_format</span><span> </span><span class="ͼ8">=</span><span>
    </span><span class="ͼe">is_mtk</span><span> </span><span class="ͼ8">?</span><span>
    </span><span class="ͼe">DRM_FORMAT_XRGB2101010</span><span> : </span><span class="ͼe">DRM_FORMAT_XRGB8888</span><span>;</span>
    <blockquote type="cite" cite="mid:20260320073409.17337-1-jay.liu@mediatek.com">
      <pre wrap="" class="moz-quote-pre">
 
 	igt_require(crtc_output_combo_valid(data, crtc));
</pre>
    </blockquote>
  </body>
</html>

--------------cFAAw0z4w8R7z7TZlg5h0xhS--
