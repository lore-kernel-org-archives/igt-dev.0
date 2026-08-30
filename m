Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD994C61DB9
	for <igt-dev@archiver.kernel.org>; Sun, 30 Aug 2026 18:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E55D10E0FA;
	Sun, 30 Aug 2026 18:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrdbxU38";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB3F10E0FA
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Aug 2026 18:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788116087; x=1819652087;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=KY2avRL693OyYMCEvuudzN2IIGusdILeAOG5JC2Qn+M=;
 b=XrdbxU384C/qAswUO8MSrHuqXT+RVeOtX5LZ+qMvIZN/ZAWGM2cgDqGU
 tS222wsoVV4E61kKsPNyvKCJ1Yue3KwBY0C0uf0/1DwQ76qXNPsdwoTe/
 Y3EIoEUXAL0LkHsxdCZvEOzQi3aNQWWVcqlhWnhxO/BnGjSiRqvH7taOv
 +Z3g4KNe0+njyjouXvussnlpt6/KOxflIty6hjBZ5ED0u9kUmDtF9KpDW
 qHHMEjoU/g6j0v2R685JPtW2CPbg9ZsDg2eOaxTTyh2z5rP/cn1QaS48y
 KN0dR6fK6gwRR5SmMRREJ5iBRlZ56keozIPznh2r8wdWqVJKan3SEo5kQ g==;
X-CSE-ConnectionGUID: horJ1ygiR0GHnCcUayv9TQ==
X-CSE-MsgGUID: /eMxrQBBRx+MmrItjV5frw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99692106"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208,217";a="99692106"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 11:54:47 -0700
X-CSE-ConnectionGUID: dh8749xdS/KcvkAbyoipUg==
X-CSE-MsgGUID: iwl84zrfSk+aijQEmbUGDQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 11:54:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 11:54:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 11:54:45 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 11:54:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNqxd3FIeanN1lLMcYWMMaqLwIRmG6rLQjAKEXIx5HH6jpCSfi81kGYEd0CizR9Qo/tfgXtk4yMgN+mDqVnYP8hYw1o8DB+WH4S/P/OY2bnZ/+FXzqocpe/CpXJ3EjrtBnTtZYCFabsArcDO0XGhSOg4L/+wM+6jwheIxi85VimcJgIJkrdzhuDEUVu8hxf7Aa8WKIUkTRTp4Y4Y+KRA9V+e51jmMoF8+k2FXGlDyzbDCcZq1GaG98yCb6egR0vMzUmIS8QXn0oDwItZnqlv1KMbBK13Q6fAvMaumbNVTqUoHRY/TtsSY7n8eMObDG3moMeZB0wWfnAzzX2VIEVvvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpUVEqBF7jfJ7HE+cPHAn3E57lusbkwlVyqz372wRj4=;
 b=VKRYQCuubYFyK7QrxWMuTW/iWReQKc7W2kbhjc+W8vFqBcW2mo1/KIxbNTBmFUCsJ9qW5HPuc9AaRGB2B61SYEiCHkT+IH7R+pVocGDkPbfND0tkxt6GzX3kF+xEf8x5HB1SOE/eyFu3eDTm8uzFUOmuHAxatiBhSDtzbi7j/zbE9+QXSSGcQStsJ4wD165JGO3GRxs/fTJYDYtRUagQJTzEzqZ1K0SsbFIPerNJq1HBflD/92cqtJJC7sg3IXgXVsJDmEZKuJFPCJg7GWDKMxBiAM0f8hK+L/cBc9F/7dwfwp9nP0mpXWMdkT1+urGVDbm4mzTVVgdDC/8avIg6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by SA2PR11MB5114.namprd11.prod.outlook.com (2603:10b6:806:114::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sun, 30 Aug
 2026 18:54:40 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%5]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 18:54:40 +0000
Content-Type: multipart/alternative;
 boundary="------------8X8iLKRjIJ4bW5q0OAEtozbl"
Message-ID: <16fd8eea-ec0c-4877-8cf2-33c4fd969dee@intel.com>
Date: Mon, 31 Aug 2026 00:24:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 04/17] tests/kms_async_flips: limit S/R to first
 and last CRTC
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <nemesa.garg@intel.com>, <karthik.b.s@intel.com>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
 <20260821124834.1974029-5-michal.grzelak@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260821124834.1974029-5-michal.grzelak@intel.com>
X-ClientProxiedBy: MA5PR01CA0222.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::15) To CO1PR11MB4913.namprd11.prod.outlook.com
 (2603:10b6:303:9f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4913:EE_|SA2PR11MB5114:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd65b67-94bc-472f-6524-08df06c82553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|10067099003|4143699003|11063799006|8096899003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 102TiIdE1ZTHU9wLK08WMx3ZIU3eRLOtEthiutg3U/uVxhcIEhrlSRR8PgRX5Qzow0LtZnd9zfYNZuWLilGX0nPzi1gid+tDfLWDwYn6jJJrU3w2ff5rl/Ppgy3FrYwg1CGUZClQH2JJqeNPk1M/1MK/wy2k1/DqnZaHldU8saHtAxL3lXIrcmWrx5y0WKPMjLpvai2c30BOBPMMVSqrh1FKzEZnkv0nKqz6U9o5xTBydNvSiMLy6GW588S61A4XrFEc+oZqPI+MI7euDgWQua+S4Qfaxq+5YjMpnXA5ONXMXeDNRTujcHp+JSgXAAGqdCcRZtu2vO/V8KFlijApTnQKXCNz1+mqJgwElvjdHMg2D2CCbszdoG2fv0tbJAbxm+uajncjVuffgyAj8hDeFM0TcpD01aQzw1+OHNmScQZ9iuSaE4dZfeLLDcUihw1X6RB9dyVZxZoAQ9f020fBKzHNTS9Y9LYopsKSaaU1aHAkOy/P30oVF/KqO7s2xtY7Dx+uxpsAxuDDLd8O58MekDhDJ6yezkBN9KEvojhSu4mt0REZKTsiZ8G1IB1DM1b51O6QP/pvETRbUPoiMfFQV31l63iH/1eSOQKJ1q2PMHegWnOAFd5472Qf6AcSvxwyzYEC/F1nShvTxGlmR2UZTr0JvCj9qVdqg5oFMcFwhoA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(8096899003)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnpUS1p2SGxkSzlxWE1nZUhabjVYMnByeDIxd2VYSFliN2J1bW04TkRvWWVm?=
 =?utf-8?B?VnB2YkdSUm5pU2M0cHdraTRsSTRxYXp5YXh4ZC83dUdtYTJFU3V0OGlKNzMy?=
 =?utf-8?B?NjI3SHl4aCtZVktvN2J2T1FZSGVuYTlKZkhDaFhmanc2azg4T05sOTdDa2RP?=
 =?utf-8?B?ZEFsa05MRUYxV2tITzV4N00zc2NkcFl5cUoyaTVUak1HQVFxS2ZhNVZUUVQr?=
 =?utf-8?B?cTgraGd2YnZLenkzNTRxbElYZGFoMENrRlRzdTRLNE9MYW5nRXRZL2tpbUta?=
 =?utf-8?B?LzBvdFR0NjhrcnBqckV2Q2ZRTzFiZ2FIMGkxWitIaEpDajJJRWJ5ZUxxWnVt?=
 =?utf-8?B?SHRWeHlQeUQ4M3VsM2V6cEd4ZjM2NjNnUE1uZlUvS2M2Ni9VaWNianFSK0hI?=
 =?utf-8?B?Q0JNeDVuWjdhOXJqcFU1SFppY1d2V3lHbUV3dUdsU2tRVlhZbkppckFZZUJK?=
 =?utf-8?B?ckdnOTlDOSt3TGNTaFZaVm1HV1BBMVUreTU3TmxQVE44RG5xSEcxMjVibjVY?=
 =?utf-8?B?ODdwbTFjcHZpWjRVbjUwOGphVGVqT3h4aXZvRkNUZmhURHh5MGFRVFprMXpa?=
 =?utf-8?B?eE9oQU5MSmdTMkFLUllBaklYbjUvVXpabmJoMnA5OGQ0MHR3MjRxc3ZLNW9H?=
 =?utf-8?B?bjdLNWtiU1c0cGszMjdRMk1sa1hIME1VbG54VlVNT25DMnlwakRIMXU1RHk1?=
 =?utf-8?B?MHJKdmZaRlRtMkJ0QXVXV0I1UWcvTDF3a3k4a0h2d3JrVzdiUnlhNjVaNm1J?=
 =?utf-8?B?L2dzdVFuL25VaWx2dnc2dmRzTWhOOHFOb091TUJpOGRXTVF0dHhVUDhRMnJm?=
 =?utf-8?B?cVpDQVRzblVPWXBxamlpTkRmOC9UbFFUWFM1K2N4N21GU2Z1QmUxOXBLSGlv?=
 =?utf-8?B?eGoxWTVHZHBDM0luQjY3SjNyNThnMU1qWGkxYVhvWlZzV3pXZjhFaGllckhN?=
 =?utf-8?B?Rzd0VnV3cFZpTVRjcGV2cytqbWRnejkvNmNCWmd2ekZ0V2JYTFNNNXR5MVBE?=
 =?utf-8?B?K21yR2NGclpQZXEzK3N0Sy9zWFJzZDVkenozcnBVb04wSi9EeFJDQlZMRk9N?=
 =?utf-8?B?bzVmK3hhSlZGcWl1VXFIZXlVTmNQbzJkMzE0VXZNbG9lRUlwbFZsaUUzQzNQ?=
 =?utf-8?B?cXVFYzRmNUdkQlY0emdFdVJyUXNZOFdDejF4dDRzL2JNRG5CWmxIazNIUkhv?=
 =?utf-8?B?ZWNSWUpZMjJoR2QyQVRFUXQ0dW13RGRTcndESmxzRmU4WWFqOVlVOHVuVW96?=
 =?utf-8?B?aDlKWWgvVFJkUzkxdXowaVg3b29YMjlxVjgzTCtGcmcrWlNyMnFXYld2bzc5?=
 =?utf-8?B?bTFSbW9YYTIwV0dGNmVMUjJRMm5EZTN0UEVwR3Z5S3Z1MUNRRGJJSTV1Z3lC?=
 =?utf-8?B?MXUrUEUvWElNbC9uaXlSL2xOa1BXSVk1VW85QWhNUXVCb2V3d0tQUTBkdlov?=
 =?utf-8?B?NUJ1c0JselhjMWs1UStoWE82K0lPcGJFK0tBeEJleGJhWmJtY2ZVK3ppOExW?=
 =?utf-8?B?a1ZCcXhvT214WkpKNEZOdGVDN242WTlweVdreHcvaGVyVkV1YklHN1ZsbnZU?=
 =?utf-8?B?MXJJQW1LTHFCMm8vOHlLLzViTWFvMUliNXNNS1lMSGpzVW5jWjNBTldhLzAz?=
 =?utf-8?B?WW9OVDJLZEpFb29mSFkzWTdPbjZJM01JNFNpcnpQU250SUNzSUt0SUQ4d3Vh?=
 =?utf-8?B?ZE1PNVc1M3ZONWxoRTdnVlNBd1pYV2kyVVhKbkoxVUxaTmt6TC9iVVZYaHJx?=
 =?utf-8?B?OENSWlZaY0tVQXplUVZkaDNlUDdDNEp3Z2I5bFpwOEVEQy9qUHNEK1o5Wktx?=
 =?utf-8?B?eUlLNldOT09tUVZFYVdZWTllbk5pQ2kvQm02alhuYmhobHdiUVdPeEhUUjFv?=
 =?utf-8?B?KzBhNUZVNmpPdjFsN0hxZHBIZmdLZ0pUa2NRbk9KSUgxblZCeEEzbnFGdE1F?=
 =?utf-8?B?WFFlaXkwcFUxbWFiZTQrZmZQTzdIWVVwSy9Gem1Kcm00SEUrYjZKTHdKSXc4?=
 =?utf-8?B?ekFQQnFwblhYRGJ6Q0YwT0M5MTBXS25Nc0ZpT2JXZVhSRGVjeTlsUnROODVE?=
 =?utf-8?B?cDJyeDB2b3F3ejVSd2FPQVBUY2w2TnE2bWRhcWp3MlNIQzlPVldaU1k2TU1l?=
 =?utf-8?B?ejVJK1BKU1FCTzlKMG1lNnlWUnlmVkpuaEhmU2dHR0pkdUFtaHhTbVpUblFH?=
 =?utf-8?B?M1M5NlFMZjdUaEZWUTFUQVdlSkpMM0dqQnB1dmlEa2ZXRnFESzhLODB2akxO?=
 =?utf-8?B?SFYvbXZWN1FZSERybVliVWlTeTRTcU9aTFhvaEdnU3JsS1ViWWxWZ2YvdmJ5?=
 =?utf-8?B?R0xwL2RQWk9HbTlNeGNLKzZyNTJiL2h1ZUU4OSs3ZHpuSlJRRmVNNVQzSEtm?=
 =?utf-8?Q?PcmOuT66J6U0sRM0=3D?=
X-Exchange-RoutingPolicyChecked: 3Qorc/oJCSEDcTIo/ugI0qId7v06ScJCQRnpNe1RNbVQ5OvCZpA68XWNmpYBoOqVaJN0CeCu87Ud3iXA0DdjPlqvBHBo1DOzJiYllYVFrbxS/feHIQF30hgwHSmFQS2kvTdqvYWbUMElqmuvbdVVQDcAlT0CyPOCDl4TT6KVDLbO2BnK3vKszftbCNs4UTpE60OxjfAEm6Cfh2UXvwh0miAxHjYbRUgUroCv707e9tAmrTdwe4n3J0Pd3I9W/OBQZpJxlcXzhdFoWuHsBEo0tVkJwoBKEW6yNbi6Dguedr21kRnwtz8tz4NcMSMGyxMqnEUdqDjuj7yal4Lg+eBuAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd65b67-94bc-472f-6524-08df06c82553
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 18:54:40.2037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpGWoosDKe3QP5IIHuGDl1P138fkvSJhY0+/wTTINmph7aREWYZFI0loamZYpyHzmPIYzf7K1gZa3mbP4MM8ITosxmtLM4E5ni1djfjxBDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5114
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

--------------8X8iLKRjIJ4bW5q0OAEtozbl
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 21-08-2026 06:18 pm, Michał Grzelak wrote:
> In order to increase tests performance limit suspend-resume's execution
> to only first and last CRTC.
>
> v2->v3
> - add missing S-O-B
>
> Signed-off-by: Michał Grzelak<michal.grzelak@intel.com>
> ---
>   tests/kms_async_flips.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 03348d958d..5c143e71df 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -873,18 +873,23 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   {
>   	igt_crtc_t *crtc;
>   	igt_display_t *display = &data->display;
> +	int idx;
>   
>   	if (data->atomic_path)
>   		require_atomic_async_cap(data);
>   
>   	for_each_connected_output(display, data->output) {
>   		for_each_crtc(&data->display, crtc) {
> -			if(!igt_crtc_connector_valid(crtc, data->output))
> +			if (!igt_crtc_connector_valid(crtc, data->output))
>   				continue;
>   
>   			data->crtc = crtc;
>   			igt_display_reset(display);
>   
> +			idx = display->crtcs->crtc_index;
-->IMO: display->crtcsis pointer to the first element to the crtc array  
and always gives same but not current being iterated , please check this 
once
> +			if (data->suspend_resume && (idx != 0 || idx != display->n_crtcs - 1))
-->You mean to skip if not first and last?
> +				continue;
> +
>   			igt_output_set_crtc(data->output,
>   					    crtc);
>   			if (!intel_pipe_output_combo_valid(display))
--------------8X8iLKRjIJ4bW5q0OAEtozbl
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 21-08-2026 06:18 pm, Michał Grzelak
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260821124834.1974029-5-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">In order to increase tests performance limit suspend-resume's execution
to only first and last CRTC.

v2-&gt;v3
- add missing S-O-B

Signed-off-by: Michał Grzelak <a class="moz-txt-link-rfc2396E" href="mailto:michal.grzelak@intel.com">&lt;michal.grzelak@intel.com&gt;</a>
---
 tests/kms_async_flips.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 03348d958d..5c143e71df 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -873,18 +873,23 @@ static void run_test(data_t *data, void (*test)(data_t *))
 {
 	igt_crtc_t *crtc;
 	igt_display_t *display = &amp;data-&gt;display;
+	int idx;
 
 	if (data-&gt;atomic_path)
 		require_atomic_async_cap(data);
 
 	for_each_connected_output(display, data-&gt;output) {
 		for_each_crtc(&amp;data-&gt;display, crtc) {
-			if(!igt_crtc_connector_valid(crtc, data-&gt;output))
+			if (!igt_crtc_connector_valid(crtc, data-&gt;output))
 				continue;
 
 			data-&gt;crtc = crtc;
 			igt_display_reset(display);
 
+			idx = display-&gt;crtcs-&gt;crtc_index;</pre>
    </blockquote>
    --&gt;IMO:&nbsp;&nbsp;<span style="white-space: pre-wrap"> display-&gt;crtcs</span>is
    pointer to the first element to the crtc array&nbsp; and always gives
    same but not current being iterated , please check this once
    <blockquote type="cite" cite="mid:20260821124834.1974029-5-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			if (data-&gt;suspend_resume &amp;&amp; (idx != 0 || idx != display-&gt;n_crtcs - 1))</pre>
    </blockquote>
    --&gt;You mean to skip if not first and last?
    <blockquote type="cite" cite="mid:20260821124834.1974029-5-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+				continue;
+
 			igt_output_set_crtc(data-&gt;output,
 					    crtc);
 			if (!intel_pipe_output_combo_valid(display))
</pre>
    </blockquote>
  </body>
</html>

--------------8X8iLKRjIJ4bW5q0OAEtozbl--
