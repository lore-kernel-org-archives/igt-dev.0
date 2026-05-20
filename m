Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4568FCD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 21:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46F810E0C6;
	Wed, 20 May 2026 21:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKPEQptq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52F510E0C6
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 21:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779311327; x=1810847327;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mhtdlE9bvZ4rXjn5vKMxzS4QtUw8pqAFYsIhUsJUwWM=;
 b=DKPEQptqkLeucWnbJ3mvZj9ahJATpJKkm1UORhnGYCxvDMxW+rc9JTkH
 ajMp9vrtKxolNKsJzVaoq+9kHkw+0kRIkPCY9oy+59ael2+AMM9M89ZoR
 MfUJHgLdoj5ZBnu4FodJOuRAjy+mkBT9xohJ1g75ebuBcaAndcnXj8nPE
 hTFZ15AM9hDd5frQ57xdKao1z807HW3pc3AYpMMU/apnLBELoADBiaOYd
 f3I54L+rObVJXCrLoo0bun+NpANV/vnbLCDSdCdrnsPI3uwbwlMyk5btc
 V6bghPPGNDDrjq+XME9kGwXimUl56yeThK0V19qRo9s9gzHpntk6bEtg2 g==;
X-CSE-ConnectionGUID: p4jjBV/9QDKYuiB+POE+VQ==
X-CSE-MsgGUID: Th+OMWBLRy60qci4GioXhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="67751376"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="67751376"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 14:08:47 -0700
X-CSE-ConnectionGUID: D5kVhkqFTgiAVBL2IygRAQ==
X-CSE-MsgGUID: yOH1gvSXQKy0CufKbvQ2tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="240357295"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 14:08:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 14:08:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 14:08:46 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 14:08:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9hywr1T3N2us6JX2OaUEUvZVDSyfQZKG6uVlQUbT0gUR5L+H7OXUwJ9OF6Wc6H61cJihY7+Az9it6rLJKaWgwFtekE9KOlEEqJ9MXlck5Osu5xohGwN9Y5r16tOHh9+Z6e2PsOF8laARdgC5kjOnKYYc6vEohIw87N9JV9kBK/TYC+eSKnoHTk0VUHHp60P39ALc4h7BIB6anZhXL5KDpEZOJLgAsWJS7HYgfZb9OAZ0eJWZjsd4Y3GBaCY4MePCopzBz6l5swSbcCD08cmfdbdJBXPhNBRmSnEMSch+yRsJ19sh1VtepkpBHEprhlrH0H9EmZIPEBS22VMx7Dn6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcdDueV1MMxaDvlwJ6Lqd3qYRsuf8vWOw73OlkHSp5g=;
 b=DMEf2UVyl/aayqVqIUjnylmphDp/iirmlRjoCsQ9R15jCMnzvGkxWBjM1Ixs/kV1QfCVVcYRu9DD/J0r5wXAvCXTbIPbj4RzYthfojjFCE0ghtXt+dw6gsSeVuLyZyCY1h9z9dyjq1RXlMEPkCOTK1YxEW1trZ+p8d3DU2FYxalUB1//bXmr1cMs2IExJDaEiUf+Mt9k+w8NH7ZPSH1t3VGCPRCHnSPmHLjLjPYYTfqIAX7c8KALwXwUx1wzexegh8fXkMPZTOXNwaqN7L+6MTFpnKJwPAr9bCApHgq4IotnOt/B3Vm1VR3IfsaCMkK/i+8Y2oMhQ7l23uwHPgZIkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by PH0PR11MB5094.namprd11.prod.outlook.com (2603:10b6:510:3f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 21:08:38 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 21:08:38 +0000
Message-ID: <d97c4c0a-e27a-41e9-ba99-d7feaf64e818@intel.com>
Date: Thu, 21 May 2026 02:38:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2][V5] tests/kms_hdr: Add interactive HDR verification
 to static-swap
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <Mark.Broadworth@amd.com>, <vitaly.prosyak@amd.com>,
 <kamil.konieczny@linux.intel.com>, <jani.nikula@intel.com>
References: <20260519150022.3964921-1-alex.hung@amd.com>
 <20260519150022.3964921-2-alex.hung@amd.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260519150022.3964921-2-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::16) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|PH0PR11MB5094:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b90aa23-b385-4e20-a910-08deb6b3f657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|11063799006|22082099003|56012099003|4143699003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: jcC7zKY5GxkqA/Yo1zXg8ytgRyCKvPzUfOz/thG5yYsplvsDQGA4uKZFfBCXH1gwDx5cqtJWous2+1nhk7zNa+/QCG8jG3goQWNoqWH2Qz+jsza9DVYL636SY7ND53DRQ0HF5hEQuCw+6SVH1lfkYfhs8/LFWtiw3mqq7oolKQR0wVAaGDvDAqluRdGo7QhImbT6YO7OUxavsXMDJQl/PRaeO8V8fXWfrWjo6lB8XAOso4MMsEkrFG2xb6xpFBpBV9SIZhlfyCGst9st5AIuy8dk6eiXXhNvWnb4OAraUiELgGgS+H4JcMjKXe91MqRls1+UnLKYlKheWEYdUbCRqqgGH+4IzXESrMULYdon/7OgTduwwLm+XM0fXRGz9PJ9oQiE0cNM8TCM+iWqbR8GAjrdwVoyO8IFzzpoN6muRsU+X2wf92DS2WgEmOSnxnwolzp/6hrfz3mlal45EdWjq9B0w/l4/Jofk9F7TYfrJ8tR6erpNoyDXrIu4t/Yl6J8hSgKlrKO+hdwELeyZ2mDhEqb8KO1VAOKJhVDYUc3iiZmrJODwC5SmNA6cS/XMA4xGD7nUwc8u0MD549EZjaU9pyIBAsyY297cTZMKUx9urLhJr3SQ8JUoWE2i94O8riA8/P/xb4QTUDCs9QpNSXIqGZscR7tyDqM24rdFJhBpkC1/CWVNOVI+KKSk2NNCIi2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(22082099003)(56012099003)(4143699003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmdVYmI3b1JiWHVraU95cGdnUnBER08xUk84OUFmTkx2bW5xRVNkRzEwbHpC?=
 =?utf-8?B?RVJPQWhrTHprNldDRkxKS0ZIQ1JxMEo2UkN1bHZIRStQd1g3L0FqUXk0cGdJ?=
 =?utf-8?B?RENPeVpucWZNcGNpdjdyUWRYNWpqczBKQ0svRmVKR3lRUjZQMGN6a0tnN0N3?=
 =?utf-8?B?UU5CKzVHWUxQa2R1ZloyaGpKN2RwU2tXb090bEMxVktSWUFaZjVmWStiODcz?=
 =?utf-8?B?Ulc5Unlpb2FWdldWNkZkc3poY0x1MzFGZ1hmdHdYeFlPMXlLU095Y3lRN01J?=
 =?utf-8?B?SlArWStHMkJ1alh3Sy9PdU1jTEM4MGxWbVZxRHZPZ052OEFzSGE5RHI1Vmw5?=
 =?utf-8?B?eU5GQ2Zqd3cxSXZFSC9aN1dKc1MydmZnRll2SnNTZUNNUEM3UW5XVjZObmdM?=
 =?utf-8?B?NWVpZTRhN1M0VVk1OEtwRVdxUmxHOTZONnFaeDVWcTRGY3BvbC9Tdlg3dExJ?=
 =?utf-8?B?aVIyYUl2L3RwcnJ0VDVVN29mOEpzYmdQNHFkTUcvRGlLQjhwUzdZblYrU00z?=
 =?utf-8?B?UC9sMTA3cHBzNnNicmZRNzB0RlVtbmxmbkd5SnRMOE1DcCtqSjNITy9OY1l2?=
 =?utf-8?B?SnRnckVXL0ltWm9mS0ZQNlEzUWRrSFNhaWxjMkRDUEdtWFFxVzlEd3ZVek9a?=
 =?utf-8?B?NUVtNm5aWkc3dmJJdW9SSTY1b0xqOSs4dmJxL2xXcVhycmJXZnF1cDk3TUw1?=
 =?utf-8?B?TjNVV1RFUXZOeHR6MmNCeXE4N09PWm9BZ1FvcDdiV3VmaXRhVkp3NmlLMFIr?=
 =?utf-8?B?ejJHQ1VnR2pDSlhuQkEwZnFKSmwzNEhZMFoyZ1FuM2dCOFl0VUsyWFBRTEl2?=
 =?utf-8?B?Q2dnNEFZVWFrRGt0bzZhNkY5MU5JUmw1N21uQjdObWF1M0l1RXZ6ek9sQ3Nm?=
 =?utf-8?B?bU04NHdKNUowQ1BxTEVNZTNORjdEcDhXRllYcFBVRlFKVytXVUUrQmluTkxH?=
 =?utf-8?B?RGJWMElRaEdaM1A3aDdYTDNSVDBtTlFFeVZRblZta05FMk5HbWZOTnN2T25U?=
 =?utf-8?B?RUJLbzlxdDY2RnZHNmpHcFk4MlBEb3lkaW5mT0U3SFdwYmplYmZxSzZ1czlK?=
 =?utf-8?B?SkRON3JzT1U0VUxlbEo1aDREaW9TSzY2SXN2YXJiMUZLNlFVQVhBWnEvempx?=
 =?utf-8?B?a21jbjJPaE9hNjJuOWZadCtmdjc0SWdGSk0vK3VRWWVFcFQ4MzlSMkVzUzZZ?=
 =?utf-8?B?cThJVHF2Q1ErQmtLNHM5U0kyMkw1ckpSekFLcFh0dks5UUFhSDNPeFI3dHIy?=
 =?utf-8?B?dGQ2OEhtK0JHdVJNVzI0L0FqYjU3a2kxVmhGRE5TWVdPSWxEdFBPY2JHTFFE?=
 =?utf-8?B?RUlMd3NxTXp3YklpVmNOYlM5aW85Y3VmUGo3Y3U3RGRoVzNyc2J3eEZxUHQx?=
 =?utf-8?B?TXYxUHNobzAyclJ1TUdzT1lmbERaUXgxak9nY0VaTlFuMzJrWlVybERNeFVO?=
 =?utf-8?B?dW94NzdaTFIvNTdPYzhmU0Z1RTVCSWpYVzF3SFVmMDlESUpVWEtkNjNrZzRw?=
 =?utf-8?B?d3p3d2UzYkh3OXVwdnR3aUpSd3RjaGdBZWtCeUtrY0t0QW5FdWlGbFMzSTVT?=
 =?utf-8?B?QzRVNUsyTHFYWitzajlMcHZoZW5ZNFRGdWI2QkNZdTdvZW9zWlpJaURVQVlF?=
 =?utf-8?B?dnJLQ2Z6U1YwbFVRY2ZmckFtY0lucStxT0xUdlNKTUVlaVVrTnNiclhJOUk4?=
 =?utf-8?B?eUdsbFlhK0taMlJ2NnBLbGV4Z3Ntb3pINzhxcWlzQzB6YllQTUZwWWNrUmMr?=
 =?utf-8?B?aDVGQXdtOFFWWGxka0l4dkdxTU41Yjh4Z3k5K1RqMU5SYk16WHpKTWRwL1pi?=
 =?utf-8?B?VlpyenhWQ1phenJTMjZGQkFBSW1PY3BjRDQzdUxJaUNLK3BlajFtdk94OE1D?=
 =?utf-8?B?L2U1V0YwTHFDOFZKNTNVWldWbDZ5cGZUYVZkVTZLWTJsbTVrc1Zuam5KY01m?=
 =?utf-8?B?d0NRd1RGR1VRbkxKall3aWxSbXkrRjExbzNPYjk5TU85YjJVVHlpUjlFU2JI?=
 =?utf-8?B?WGdGUXNNMWQrVTRxMzlWSkh0d2VScWdOWU9WaG5kbXcvZXhPaGVvVk5IUXA5?=
 =?utf-8?B?eUpwTlVSK3VDV2ZBUzNvVFk1Q3RzR2sxR0lRL01FQkJXUldkcUYzMk16ZHE4?=
 =?utf-8?B?ZFpEc1ZmSmxURlhEbVd4NkRlYVNUSEV5MWRUaWZLTkhDMmFWL1BheGVpeklu?=
 =?utf-8?B?RTJOYWViN3duOE9UQ1dQakpmblpzdmdYV292YnhNT2ltcHExY05mSGw0Y3Qy?=
 =?utf-8?B?TENkNXNWeVN3YkJqeThFa0tZcS8rTmlTRTh2RUNxOFIyVXpiRDdZRGVMNHdi?=
 =?utf-8?B?emNVeTEvb1dMeE16b3I3OWNuZE5CQVFhenZrbGxHM2JvcVc1NG93TmVldDlS?=
 =?utf-8?Q?YOsr24gPHyJavrvg=3D?=
X-Exchange-RoutingPolicyChecked: L62IohO1DIgupywAJBJduNHkqHEwI4Q0JOTpLmO877FpUvDnXmgGv/2MlG1sK66cJMv1/7sDsKnBm7hEMCc95brqSLAWLEiBVEY1cGYYO0ag9GtgVkJIJvInHw4bgzKkPYVX3IT7sEO5W3nmUt+t/GGZi9FsgVFmYXyPKw2W7ECZkx1C7w6UU7RaH/jNKstyLSLeE3467pKGJKwZ7otAIMrzKbE/cybf15NuLQ4bZQ1Wc6kJzcwUPEdii669JIFyBvSEYKmghCMlsMXQMkfNpy1yHHA7qezM9rPFupv2A/p9MMokBci1lLkG4iiU1RQfPZk5qQiAlTdBLCRjf2PjkA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b90aa23-b385-4e20-a910-08deb6b3f657
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 21:08:38.4323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJ+SRz1PUAqIztIVoWzKL2LTW7UvwpXTa0WyzuadMbrjQPUGRvMvLAvLZqDJhqNbXHARTEEytVcHs+C7JJMdiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5094
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

Hi Alex

On 19-05-2026 08:30 pm, Alex Hung wrote:
> Add igt_debug_interactive_mode_check() for smpte2084 and
> traditional-sdr in test_static_swap(). These checks are CI-safe
> (no-op without --interactive-debug) and provide a Y/n prompt when
> run interactively:
>
>    kms_hdr --run-subtest static-swap --interactive-debug=smpte2084
>    kms_hdr --run-subtest static-swap --interactive-debug=traditional-sdr
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>
> Assisted-by: Copilot:Claude-Opus-4.6
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   tests/kms_hdr.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index d21f1b3f8..affd38887 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -454,6 +454,8 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   	igt_assert_output_bpc_equal(crtc,
>   				    data->output, 10);
> +	igt_debug_interactive_mode_check("smpte2084",
> +					 "HDR pattern displayed with SMPTE ST 2084 metadata");
>
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
>
> @@ -483,6 +485,8 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>   		igt_display_commit_atomic(display, 0, NULL);
>   	else
>   		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_debug_interactive_mode_check("traditional-sdr",
> +					 "SDR pattern displayed with traditional SDR metadata");
>
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
>
> --
> 2.43.0
>
