Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2938CDB47C
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 10:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F52410E095;
	Wed, 24 Jun 2026 10:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9cmlIon";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7490810E095
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 10:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782298222; x=1813834222;
 h=content-transfer-encoding:date:message-id:to:cc:subject:
 from:references:in-reply-to:mime-version;
 bh=T4vJ/xe/LPsUTkWDSimwvT6e9Q8G6b/1dyCyf/qJNAc=;
 b=b9cmlIonZv1pNUyJ6jvqAfuD5nfrcmsk9gErP5LCNNS9KRC0tY2v7Q9d
 aUtsZ1BQtx4qDcbAcE3IEvrirgYVXzaRyT/BJ0JV1uLRPfR6dmLm8vrY8
 Xf1USjYutHqjqJ+1XYEKxb6VeKwauYnBmaODsTWl1iLSBuExjS6+U0n15
 VVqviiZFeVdth1WVqUsc/t7qFtBkc95DlzclsPoDm2d6nxykSlGTi1REy
 Tljy08lCnMI+n7Xhed1sMke/vKXqykB/yZVTxYNSkDm+yGUXdq3vdkVGX
 YAputuJ1Ci7kEo6ChzWaCL+xM+Yg0YdYwjo3HHYFwIOjaQmVc6U7wBNaY Q==;
X-CSE-ConnectionGUID: FBCMYxCeQ/uqc94TzDza3A==
X-CSE-MsgGUID: HDp43ebcQW6jiJTGRYaKEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="108604480"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="108604480"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 03:50:22 -0700
X-CSE-ConnectionGUID: z2RoPff4RPe0hzCc4uR9QQ==
X-CSE-MsgGUID: xKTbaaTxQi2+sJslwlZeng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="251754581"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 03:50:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 03:50:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 03:50:21 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 03:50:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JU0iT+imFNG4WmeUMCz5pTV49mHttwJxEPj4EvxsBhkivh+r8HZtnStyVFmz9izAQHl0Kx+reaPwiaSqEBPocHeyJ4dYLlOWnNhukkLNWdKJjWdgeoXATyqkefX8wmTgPb6dxOov1mX1N8D4cmjuC9pbC0Ep4LenIAthTHdao66PHyio1cDpZgMpw40skl1NsipADeKKSKnLaahpsD5FhXWKmL1ecQ/rYh8tIy7x9zteTpE7BbaYIpmeDtUC78nAb+DlkG3tVdEEawXP+15ueQwQUkCeC1UpT7EresF4zTKhvFsi8tyzCbIq+4WA6xFmspgFLtCkPIrcsOwqBOPbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4vJ/xe/LPsUTkWDSimwvT6e9Q8G6b/1dyCyf/qJNAc=;
 b=eiZOPVAJpDSw3Fl2u3x84LowQhzUHxxbXpuRj+chA4yTFAecBYW4WjFBJAzB1i0SbGoHfE9eZQ+0ulm+r1zQY608sWwExfj1zmODC8aNMFZJnNZNUh5x1vWiWAVZYPtAfq2/wNgh+LAHv+mCP4F3s3OdZtJQjTAADvTL15LiQ02gUy4OAHHCT+YuYIbhTBozSv2XgXmAjStxzyBsJHrVJn3+uzx3xiqhUH6h+D+HErlvUH9OTWt/u+xnMJTzdWmA/Tj9XTsbTCGaddYumt1lwTwAw40ucHU37+OflKtglxvgOts1iD33gm95fHjS0224VPUr+fF8ejiXqq5szr/hkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by DM4PR11MB6382.namprd11.prod.outlook.com (2603:10b6:8:be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 10:50:19 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 10:50:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 24 Jun 2026 12:50:47 +0200
Message-ID: <DJH7ZZOA7MF0.3GZ69BKPSYOIC@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Janne Grunau
 <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andi Shyti
 <andi.shyti@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t] blocklists: Add asahi tests to i915 and Xe
 blocklists
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.21.0
References: <20260624102913.903645-1-krzysztof.karas@intel.com>
In-Reply-To: <20260624102913.903645-1-krzysztof.karas@intel.com>
X-ClientProxiedBy: DUZPR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::6) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|DM4PR11MB6382:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc1b744-b4bd-44cb-c774-08ded1de61f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: YDqspjvQLm7BQYzCDpIYMcHtrT/Lq38Wt19ExUGT9Q8vD2GfcZ++//B+xz4yVuDfqjJDPQ6qC5QbmzVUbwYMRiDZVEcqjwecGPJS0y1WxToRTahPmyCa8xNj77KR6+WSJflyP41lv4bRoFbp7e4DP5BBt9mP2TgPfhBQTIxs4uWuBcGTY5FpTJ6AXdeWv4tpR0qd7Mf0PZPDtoUuhNKnxkW6kNIHAJQRo60Hn6ryKaTeq38yML1oCqePknxwuS1sg4ihZ7tBNR9ykkcxx/dpGjsZuYr2/Kw/6ZsMq3ulYwAdev18SjXZUs6NUt7RGML3wPzML2aZ0YqtbHjRGFKaRwygXV3pLRjCFltCkU9fE/KI4BKaM+tEMUuFltrLQde/Lu6CX0uu7aupzjsiOnIDJK52otBFNvWbMsV7WPNFvSxkccHj2G+1DSsOHfBRTXi3F/KpOtUyZmYGMcKSWb4Q19srMByzFFgvixnyPEEjEN5asiG5irWNAedPlFo62xOm/Cx9ZwSIWtt7lQEyDYIN6RUPRJnRP7dvxcf/G/LiS3Xj2pvvEOZEuVJGBXipuxexQNyWZWFu+e0LiJZXSYrW7EsHSobUSk1CTUD6epiqnjM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDkrQnpLbytOMC95RXJjTHZ6dHQrOU5LUjZQaDJ3RnlaamdxS2ZNUVVMcjFx?=
 =?utf-8?B?b2pMeEMzbVpWRmlIMjU0VGd4VmNJSWQrbW5QYkF0Q3oxamtUM2tDMVkzUmFs?=
 =?utf-8?B?ZWcxT2FNNXdULzIydnhYbW5naSt1SlJ5aC91TlBydlFBRmd2MlBwQmx1a1da?=
 =?utf-8?B?WFduR0xKZnRLcHhqMkl0ZDRNbW9YWlU1bDRBZ0o0bit6cng2TytsYjJqZTl1?=
 =?utf-8?B?WjVKdDVxSXI0OGxVSVpYMTlvaGdMRms1SEVXZTNZSjZxWlVvOWdYc2J3cjUw?=
 =?utf-8?B?VVp4Q2dDRkhSSnNadXNUQ2I2WHN0TXFnMDJwNEowNk0wTGZHOEcwTWZHeVh6?=
 =?utf-8?B?N0NjcjZyNzdFUWsxa3RRTEgrcmFtMlpTNG84Uk9pWnlzc2NIemJZN1lLaEZm?=
 =?utf-8?B?dlhvSG9TVkE4UytoMHRmQ1V4WEFNeWlnWmFrNFI3WFJtU0lSaWlQdWdmRE5W?=
 =?utf-8?B?YzI4V3J6VlBKaFRTc3VPd0Rrd0ZsWnNGYnZxWG82Q2FnR1JOR3A0bzBlRDdq?=
 =?utf-8?B?ZkxoUzBmY0dhUVB2RVgwbXpOVklKZVg2VHI1eHBzc1BPWlU0aS94b3Flbjli?=
 =?utf-8?B?d003RHNjcE9uMHdZbzJ3M1o1emZuNjBMZHh0Rkw3Q3Q0K1d2cjdDWVk2R0VH?=
 =?utf-8?B?OW44c2Z1c0FMT3diUElLY2dBSTNnMmZKd0FKQ1hQSWlYeUpia1gzbjJxdmxV?=
 =?utf-8?B?MWhneDNJRGk3cVpQdkw1Nk9MSFQwWWdndmRYNjR2R1dNUGNTRWpJcEV1QVFF?=
 =?utf-8?B?WEovWEJVdVRWVDZsR1JGOUtOOXVFQWhubldxc25LRmRhWEwzcUxkMzZzTFF3?=
 =?utf-8?B?SHV4OEN0R1hlK0thbUVUWjNGSmhSS1AyOU5uVXhoeWRJOXI2azJSZGV0bDUz?=
 =?utf-8?B?VFFNWG00L0dLd0FCYm1aLzNkei9mMnRtMnZSZEVhS2RIRisrbTFySEZkbHRH?=
 =?utf-8?B?S0h2d0pjTU5hS0VyY3c0dW14SmdKcExEZjRqS0NvVjNjdGNrODhXdU16WFBi?=
 =?utf-8?B?bVpRUFhRbjFRL09yeFdUR0pyYXg2SFdWTnpadlBpZHB6N20zVjJHSTN5L0Z5?=
 =?utf-8?B?NENLKzhYVURZLzdnOXpaNU84QXdTazJKait1K3VQQXVYMHpSNjUydTRhbjFD?=
 =?utf-8?B?ZEVUYkdOclA4bWduSHJsc0VzMHcwa1dCeGFQL1YxYWhtcmhvaytvTmJrdW9s?=
 =?utf-8?B?L1EvWmxYdUh0UkFWUkdVbTJnenV0TGl5U2MxRzdIdnI3LzhEeTd3ajFYaW05?=
 =?utf-8?B?VTlTdHhXYnFZajlON0FHZldqZmlVRW15TTcyeHBFVkk0aGdyRGlOUUhITW9Y?=
 =?utf-8?B?eGVZOE9Mb1hvaFBzbEJJL1U4V3BIbSt3VTBsWHBtL1pCR3psUWtqRklNUUla?=
 =?utf-8?B?aTFyRi9mVGppZTZ1KytOMlF5Qzk3YkdYQkh6MG9Gc3VsODd2WjZjeVBWcGNs?=
 =?utf-8?B?RFVPN0hncm1pZmg3Sys1QnFSV05lbEJlbHNCZ0NjYUpUbEJSUjN1a21qeE1O?=
 =?utf-8?B?WXdneVE0Z0xmTHNKTGFYY2UwZVhWcHRaeFo0MkZqYS9DcDhUTHFiZndBako0?=
 =?utf-8?B?emFzUFJvUlFsSDVQc01YUlg4ME52bGQ2NTRFWjNFRmZXYzJSSkhiRGN0eXBx?=
 =?utf-8?B?MjgzanBBbTZwdXl5UlZMbEx1TGF1WklHK1VVbHJrSHZLb2tFV0RFWVd3UFY0?=
 =?utf-8?B?emk1SGhsa24wSGZIV1FRWjQzU0c3V0I2b21qVlcwbklZWFR2aERFNkw2YmZ1?=
 =?utf-8?B?eXR2ZS9Vb0ZzN1FtSFd2NWdKMExodVEyT2NvNWt1eFg2b0MzVUpOSUVVdUs1?=
 =?utf-8?B?YXRqc00wOE1pczdmczMvMWtlRWN3cU5rRGo5bWhScG14bUI0bVBDdmQ3ZEU2?=
 =?utf-8?B?dFNXNzZFZzNMNEFGZVc2NENtOGhXQXZCQ2lPclByVkRjSFo1bG51SUdUNTll?=
 =?utf-8?B?SGtHUFFaZUFuT00wNHh1Y3B1MmU2dGNhdnFsWkxkRXBrNWRoMmZnK1dXNFE2?=
 =?utf-8?B?cU82dkppZ0N2ZVJXelFWRVVtWEVzamp5SGZhSW1rVXRUVjVEbC82djc2WDMw?=
 =?utf-8?B?RTU1WlVWdnFsTVgvRHlJWmh0dnNWMGRUOE9WVXdTTjRYSTBrY2djODhmZkh0?=
 =?utf-8?B?NGFCTmJMMzJhcVQ4TE55WWhSYzV1TkhZYWhXdVhpaVhFWHlBcVB2eWpXdHlm?=
 =?utf-8?B?SHUvdTYzS2NkLytzTzErZDY3WkVJMURST1M5c0Y5L0NNM3BoUXhjZUdSUkNk?=
 =?utf-8?B?RFVDaUFDeGZhT3BMNVdLOEtwWTBIWGh4RTNrVTlSS3lYN2taZTQvWUljRUQy?=
 =?utf-8?B?eFlYUlQwb2ZNNGVVdm8wNytZUnBhSTA0ak4xR25aMEJiTXdRVWdiREM3NHVI?=
 =?utf-8?Q?9q46gLyGpY58CO9w=3D?=
X-Exchange-RoutingPolicyChecked: byPPZO7QYp7veBKOaSD/y2m8VVHP3sFsvEt2TjnGL62ukonZf3l306GgZicsMRxsWMxfXO0cg1MF6HGV2g+TODJ0/+xNfMqJHTK8T4hu7mOLdO9IVUZ0imMzDelUwc7foO1S6Eq1t40nzSWsfxdxWeenQX2w4UBZ2exva5Wm3Zk1El1s35NjUcgqHZ2/jhDH94qmcQyf2iZ3N/cHWpkf0vHAU0uXd8p718z9GPLhSso+3iz6AyxlYfgR+FHuts1MIiaq+o2+o6a2IM+IhXh5MNWJdAeQR8SVD4z0ebnanwjgXYZvk+U0tLIpufIYpU134SYo7Vn8jheW2BBwlZjoHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc1b744-b4bd-44cb-c774-08ded1de61f1
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:50:19.0210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SoNAguHuG5LXN/jHjhf8ACtWZLHl2wbxNcDVroXSPTIF9LMUuUQWsBDAPQuclwtbXIvSidSfVhw0pqqZ33yYxjyMIsjBHNkfq6v0U6p63I8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6382
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

Hi Krzysztof,

On Wed Jun 24, 2026 at 12:29 PM CEST, Krzysztof Karas wrote:
> These tests are not supposed to run on Intel drivers.
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16489
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
Looks good,
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian


