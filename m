Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557441077605
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 18:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE44710E43D;
	Wed, 18 Mar 2026 18:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dtoLFxad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF9410E43D
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 18:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773858626; x=1805394626;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AcS+oUQYZEfi1rTzVaJFnhfjDf+QKn2wspGpHx4Lalg=;
 b=dtoLFxadXhwnLclJm3f92QcmbzwwBQDsigWSBksGbuFU6o/l4WrM3tTB
 oqvhCsc/4rYheIDOvp16pYk5Ww+Tp059DWoHjcxv6mH+LV1MGTfeHAmKS
 xgBuN/SgQjsfW+xADo9CkZWw4rsgAk8OeUX5/V4Vt0akM3mFE32U7kjFx
 P6BSmtBkSDj9E1Lu8UhIU+XP7mk00MfsQlxlebOmM5x9latZxXKEIiy0a
 DFb307uAiN9wiLaOOBsfLcEoKLPWZDyt3NX/1hi7JQIDW4YAncyD2v55/
 mB9qp2/KUsxYcnSOTIeqMjWPEXyypve6EYUce886ZKCbgxv1S101lIR7I Q==;
X-CSE-ConnectionGUID: uMlrQXQvTjKppf4cqIEQcQ==
X-CSE-MsgGUID: XlS2kY74QrmIsvG2QT9XmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74106707"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74106707"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 11:30:25 -0700
X-CSE-ConnectionGUID: einGyKsUR0GF9B9pDXTozQ==
X-CSE-MsgGUID: I9VoLDmkQEGK72lcLUQCGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="218251956"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 11:30:25 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 11:30:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 11:30:24 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 11:30:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bS/zukUrVcEtArlJxi3dBG0h16UDUmIIYkwTTJ4t7bypj2ifxLukOK60RidSrWR36WsfKWnYJCiH2BXzWOBxQzjj8pTLYUYacmiu9qXHjm7LTRSIbTf0xmTYf1Ovl9eWO8nslXlECME1/BBIDAupQhpWRGcfA2xNJUa/B6d0FCNSS2TRrUPD8+N73ShLiAqZQjimeo3Zr0AIsdI9QgmpC+e2gBHvY23uCzy1hEEzNkkuSyyq+7jVCKLcVisgP8RB7RIh8axUUYtYkB5igystqoixe9+ga/yDwE8+k8Nxyq/FMbw8OjPh1EemXLx9KdlRwHj3uk2pKKXksII10KZk6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEEZBFsAVCqhp1c3UILY/UuZYHG9ZKHuDIo3p+2kEXg=;
 b=MgcvyeoxiEbzywsHAeSC11ziMe5IBAL7qBKv3LQoNJFCRN/ZyntlJpVM1sGV9TgaN30c6/1khyGqmWT+nGJ88+f5jn9sA/LLKIpXQjY0yuJv2iIXPV4k/6sLi2Z9ISNnmPyCfDR8/lb/4alSGC2314aj6OELPoQVdEBQ7A60dcBgQ59Fns8reZB+GKYsJh+bN+xfnbcoebLFt8c8Eo+BYarbQ048tYcE2RID5pepr15tGqCc3LpV1QBSpZFwmQVjECitZ+yzbqDGOZU5y/0YbFSyyu4GcbZVJ4GhDOhPgUfwW7LyiEY66KzvN9NPH+qjX94HYu//ga1ZHJw+6L0XSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CH3PR11MB8657.namprd11.prod.outlook.com (2603:10b6:610:1ca::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 18 Mar
 2026 18:30:22 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9723.014; Wed, 18 Mar 2026
 18:30:22 +0000
Message-ID: <277e7a99-7241-45b7-81fd-9c963c318379@intel.com>
Date: Thu, 19 Mar 2026 00:00:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] intel-ci: Enable hdmi 4k resolution test in
 chamelium testlist
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>, <kamil.konieczny@intel.com>
References: <20260316075611.3333142-1-mohammed.bilal@intel.com>
 <20260316075611.3333142-6-mohammed.bilal@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260316075611.3333142-6-mohammed.bilal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::10) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CH3PR11MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a50cc15-6bf6-49d6-c1b8-08de851c6a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: qTBXeA+IjnEAABCxaAGxKw23tGbZ0jsmhkox9MFad5kk0KaQYfZI0mgbMGTknVRZ0cpdL7JO7muUxBpZ5Bm+pvzltk0ru4P+RNmMaEfGINXJlHDe170NunM2PprY2LLWUNinrznIGMe6X6IunvTDoo5dWZInNN/XVfeaVossP11rA2WiPcsqUYZ9OMq1h9Ordn5H7bqkW175ncd/5RPOSVTspW7K37GpiZg7geDA1VYryK3DXbMus56sVNKnGGY4+ZL/D7jcw4RLDZ3RsTePVVygzNPoTby18x8G3G1dDU198VT/ASuhmAeW7SJ4yE8/Cb5NeAneog0TiN9xrK5ANJQ/6Aqr30jHgz+GAmRKCUkfHsAnUdAbTWrvJAiV8HST9DNGBohs7VayS21D5BsUXjeVdJmQdbEavfe0OLd7JVnfywGWc0XvKLj0JQUXKuRuCdJ2DacGHj4rpQXyaV9smcyWymL6BvvFngu1ym43MqNjjqter3W6AZMwdzryUGeHVU2RUWjVk8kr4QS5ihSGIZ8q9eq17epXuLZ1nOmTTgamX33Ava/xwLxdQfsqKPFD1434YI9wds/ZHRIoTYNecB6pxpdliQqdsoqQ3x/TVrOmvezx7Fia+czfEXgNMjiaoiT5MVIWeWyoPDQH4U85/v1b9DhCNj3kkbaODiEFNLXwheTxlygUtQ3HLp20qEmIonE0qbqlU6tdFLnNRLuwwTP4MI773er45uXvWM1+c1M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEVUZFpTSUpMQWVXQVdZdGJ0bVArU3dvc1p0RXRma0FXeW1pNE1veU9leFJX?=
 =?utf-8?B?T1Zkend5UkxEcDhJSEwvVnIzV0Yzb0dYd3NpNXpWVHZOaXFadjNtelA1N24w?=
 =?utf-8?B?L1ZUYk9va0EzWFp0N3JjbHdURlpCTUhrZzBPSW54ZFhhQ2Nmc1Z6L3RtUTgy?=
 =?utf-8?B?bVJHUDlFZUFYSnA0aXVZRVdTQ2NqVkR0Y00xcHVzUHFESmxVZUdhOFRCTDJa?=
 =?utf-8?B?VitYYmF5MTBsQjdLWVhRKzhBRTBiNUF1L1Q2WEZEajFLUW1ibmhNL1BCamM0?=
 =?utf-8?B?eXpmbUN0Y3ArakVURGVrSnMxTVdUVG5abk9WZHJQM1RManR4akRMNE95bG5S?=
 =?utf-8?B?eENuVDdDRDBnK0xMS2VnR1Y1UWVpV2JBYVFtZkRqdlR2ZjdXSjU1bXNrNElB?=
 =?utf-8?B?aHhXSFl5TkVoNXJ2blZIellhaS93WUFkU2g4RC90NzBBVHY0UzlIOWF4ZU54?=
 =?utf-8?B?c051MFZHNjFiRVRMU2x6K2ZnR250VmE5bnp1R2JFWk94ODJLdllVYWx0eTdp?=
 =?utf-8?B?T2k5bllBcEtMY3hWTjVpOFFnRkdBZ29KQ09mY0FFYjJQRFovTTVlcnJZZ2Vy?=
 =?utf-8?B?TXIxYXRzMW53V043VUk1ZnNSbmlzV0VHNTF5ZGhqaVRsQlNKK3JFWjZqY0Rq?=
 =?utf-8?B?enhqMlBFOFFsdEV5c1B1b01KVjgzU015NFJ4eENxM2ZOWE45UHR5Z1A2ck81?=
 =?utf-8?B?YUtDZFZqTTFhREJVREFNbmRGZmRqK05QYWhOR3lFcGdzcnN4TU9RQUdTNDJ2?=
 =?utf-8?B?d3dqUmlYM2ZMYmJDWWtwRDVzOW1hcnYrZUZRU3crY3dhV0dXZnFUMmlLbko4?=
 =?utf-8?B?eDFsUDhxT2pkR1pGSEpoR2pYRzVqcXVYZ2thaEx0ODRhY1p1UVdmTkZWbjdY?=
 =?utf-8?B?UndiNjdLR0cyYkpHOVZES2xRNnR4UXU0NTJieU0yQjloWExFbzFmODVaRFBm?=
 =?utf-8?B?ZzBaUUZuaitTcVFwaTAyV1NsNXN1c2hFUmJZYllHUmQzcWs4TkZ4c0FIaDdT?=
 =?utf-8?B?ck1FYm1WNExtT2lLY0tWRjVRVHFZWkxLVzZnUmdtQVFMcFZkUC9mbjF4N0V5?=
 =?utf-8?B?VXpuZXJ4VzI3YzZLWjNHTzdvUW1KM3UxdU5CVHdWM3BJRE9DaUgzU2hqYStq?=
 =?utf-8?B?SnBUckZlRE9US1ovMUxTYXdyM25HYU0vV2RDYXd6RFdvMkdQRVFOYWlGOG0v?=
 =?utf-8?B?bFUvQ2VCVkplbEt1OUZPYk9JdFQzNTJzYmxYeFhOSXgwclRQR1M1SG1rU24r?=
 =?utf-8?B?MGI0YS9iQlBTallTOGZkUlJkMDBPZWJ0cDhQNHE3WnRNOElvVGxJanVWWUEy?=
 =?utf-8?B?SUFKWUp4Y1Ezc2dHM0pVOFh5UkY3VUpORDdjVGFEeWZ1SEVVRTJoOE85Z2FQ?=
 =?utf-8?B?NE8xSEEvcGJSNkZsNVQxUWxBTmV4VnpMdFYrbkJmQkJJeVRKS0U5K3JlRlZ2?=
 =?utf-8?B?Wml6a3czY2lrL29Qcmtydk51NjU4WVN5aG9xakVFREhIZm0xaE83bVB1bDUx?=
 =?utf-8?B?M0IyeTJRdEtuMTJqSEY0djBrNUlrcVpBMnhJMWhSNEphYm92STF2K09PdnFQ?=
 =?utf-8?B?UVB3UFBiYnZsd1RRd2JOc3JoeTh6Ym4zUm9YMFlrcHNlRE5USUhxT0ZLU3Yw?=
 =?utf-8?B?NDJxQ21IcWtLZTJEK2xxKzNlbmdwNUpXaHV4MzB0N2tEODJaeWdoamxnZGJY?=
 =?utf-8?B?ZGJGdXVOVDFoVVFDZWgyRFROZnRjMFBnZVJDTE4yVUkrdGtTWm9lbmZESkJu?=
 =?utf-8?B?VGM1Q1Z3N05MZ0NKdHIzUjhJOWhjKzByNFh1ZUFZR1RXOGZaeW1na0xyYW9I?=
 =?utf-8?B?aWNxeldsNEQ2Y01xcG4xemVqQUMzeDVpZVlTbDF2QVVNQUh4Q2l0UHU5Tkla?=
 =?utf-8?B?azVyQkR6MHlHZ3FoajZmUjVKM016bmtDbjVZT1ErcGpEV3FyTDBpYTAybHdu?=
 =?utf-8?B?bE94dmEwQ0t5YXpad0JXQURMeTJCWnB0R2hnUDVsdk1JSGUzOTJiNVRNdE9S?=
 =?utf-8?B?b0hOb3RQTThQRWdNQU1NK1drY2F5RkpKb0lPRDdsdnN2ZjRpQStLVXk1d2cw?=
 =?utf-8?B?RitlRmF6L2tMdDRVMDVwTVdOeUdCckZFZmYxcUFBN3NqYktESGFhNHQ2UHFt?=
 =?utf-8?B?aTh3bzdCZGFvS0w1S0VWUEt6N1BVMVBXbklENHVNZnpUR1FKY1d4OXMxcTNY?=
 =?utf-8?B?YzlXd05BUDFCR2t1VHZOdHFUK2h4SUMzNXBYRitEazJFeTJXTG9GRCtXNjdP?=
 =?utf-8?B?b2VRcExlekg5eTBFZk1oSTV0L2EybUNpNVBGNWpDblYvSTZFK1I3MEF6RzFZ?=
 =?utf-8?B?ZjlpeVdRNVVZd3oyUUk5Mk1Eblg4SUdLdk5NQTYyRy80ZlZLdjM1dz09?=
X-Exchange-RoutingPolicyChecked: rT8ByAJ9m8CzfK95o62dkRUJjW9YO+1vYWDWha6u8/dXOgC4H3hdAv+kMGjRKfujw1EcZk8FtSWP7nNB1lDoaBkjrmEApD4+7PH4YjRsaOfH3fzvsAifbDsybaUfGvkt0bJbDaKI7lSZcwNcaD0R2lb1Qal8LljjlMchNdRCtjMV0WIHc2XYUNWlDKZ2iF2WkXKffr5E29Uy6e2rVpr+TdUT3qp2o45GCm5XxCIeOWb2MpXKG+yi3ZYbRY4Rg56j+PgHb0Tb3IuSSbTR8u2z6J+6zK/5of1VsWmJpAygUEndWf/tk9gT3RkUwjlNhRvea2DW1ovzwDz7tYWcTXMJFA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a50cc15-6bf6-49d6-c1b8-08de851c6a32
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 18:30:22.4830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKlH9lwg3D9BVbG4evIwGN2zjpHwUMuQub1tfEq5ah3uNIGG1+DYiyjHK2C+K1YwOO18U1/pcsSKnb0G3h34Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8657
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

Hi Bilal,

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

Can you please add one comment on top of chamelium-only.testlist -

not to edit this file, blocklist tests to be added to xe/i915 blocklist.

On 16-03-2026 01:26 pm, Mohammed Bilal wrote:
> Remove inline comment and enable the test in the testlist as the
> exclusion is already handled via i915 and Xe blocklists.
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>   tests/intel-ci/chamelium-only.testlist | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> index adc9aea92..bbc28d7e1 100644
> --- a/tests/intel-ci/chamelium-only.testlist
> +++ b/tests/intel-ci/chamelium-only.testlist
> @@ -18,10 +18,7 @@ igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
>   igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
>   igt@kms_chamelium_edid@dp-mode-timings
>   igt@kms_chamelium_edid@hdmi-edid-read
> -# Chamelium v1 board HDMI receiver supports max 4k@30 resolution
> -# removed test as its having a mode 4k@60 resulting
> -# TMDS config errors on v1 board
> -#igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
> +igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
>   igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
>   igt@kms_chamelium_edid@hdmi-mode-timings
>   igt@kms_chamelium_edid@vga-edid-read
