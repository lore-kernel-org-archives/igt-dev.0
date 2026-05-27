Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9095ECD5BD5
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 14:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4968510E1FF;
	Wed, 27 May 2026 14:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNR7xuvA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECA310E07D
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 14:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779890527; x=1811426527;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EBmbmBdbtK1UIEns96COgovw0t6Neasw33BJ2/LoZY4=;
 b=QNR7xuvALTu+Lf84bywbDACJtIih1QfJcy/oOIRKYhlnFEC6KoR4KivM
 RrU5Lb0fIkHWx8SDKet37nEtFqBgXgJ61CHabSLLH3W/jJKosEb9x3fd/
 OL1eal+7HBcORa8GfuzhzX6eJZWw0GXusc2phQRzBFfjBzBsIludmdmOM
 60XwoX99RRItzrFBdekrjsY3AxslvC6TCB40RTWshnD4OYlhhUl741prz
 A56NGv/ApSdknbHFQQ9TB3dW5wIcd53dvy7gKmJyajyCSiHosYDKnW96R
 xDX30t5UQEJH3gQoPRP/uZUmfhGJvJZoBR/4LeORU81iAS05v4KG/b6Ad g==;
X-CSE-ConnectionGUID: M4QKrdyFTxqez+KakeLVcw==
X-CSE-MsgGUID: TEMm2yJlRUqjBz+fJMRSbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="68247990"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="68247990"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 07:01:53 -0700
X-CSE-ConnectionGUID: qFJP4Lg1TFiKTnB6Zqh3AQ==
X-CSE-MsgGUID: JFB54hPMST+Wl95B+aJY9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="237827191"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 07:01:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 07:01:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 07:01:52 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 07:01:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkcyvtxZAjdym8ckCWxs8brsy9PlHpuTIm8PxlLWugIQ5XrF+yNGENF7KIdQ2ek6avPmyrkDU+6fTz+QkuR0YVD0PSgjdeqGi12g71sotVcOsqG7IP+R38xFvLlBIO7t2Azg3XT3PRofiw6F5ng9vMv2I3qJqTQIs4/DrES6T/inkssRa0UmTOph2U8VDkJyUFdmzcd3X2UK7tJzJOX1vgYSwfYPwpSUgum1fZDlLOQnelE+UZrpSBkyGNEbvyow9BJvC7/NBvQV+4MUz+zjftzrQtBi4o4QpTO77pazZqfRt5Gs4/38sWxeURCt7kPNzUPJEIvLvw4rKXAml90x2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hlVP7wlY4N7y4gybwLzBIegHeNShnrAHrVE7x6rWGE=;
 b=dmxTRlsf0enhuxjiSiDD5+ETo/EFdn2l9hM7zmNRJBGcX7d9WMXSxmgQbOS8t+GMk+XMtpb/bZJGYPQirPyIxe9d8jWMW3socTn+JabOrgBc7Xw5UfXR+mhl/M5elNSndxynA2QgOVOZ+jim/RbxhWBIOdHbSPSUiKKQVdFhGNp5XvjL5iUTl4ORxOY/LnuIjMqtf/URcXxfAY2aurIwJafnoaNqYw4kRYoW/HaIVSJG81rN4oz/HxBfKZTELDAv1TVU1i9DzAI1HiinLmuVtW4oRw2gXbjfK5ZEtOKauoYVwXWXaxK3PM4cy+i14FnocncNJkhAfFoQCQoATxD73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by SA1PR11MB6941.namprd11.prod.outlook.com (2603:10b6:806:2bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 14:01:46 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%6]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 14:01:46 +0000
Message-ID: <34638de8-16dc-491c-8f83-ebe6327737f5@intel.com>
Date: Wed, 27 May 2026 19:31:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 7/7] tests/intel/kms_pm_dc: Add
 dc3co-vpb-framegap subtest
Content-Language: en-GB
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <animesh.manna@intel.com>, <dibin.moolakadan.subrahmanian@intel.com>,
 <ramanaidu.naladala@intel.com>
References: <20260527084915.1916365-1-jeevan.b@intel.com>
 <20260527084915.1916365-8-jeevan.b@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260527084915.1916365-8-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0352.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::16) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|SA1PR11MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 8452f461-a410-4168-ba33-08debbf87d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799006|4143699003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: NNGFR4K9MPA0ke/Hjx3WRaD6ITCi5TFYf03/XntwlySwFpaxbvKNTOhtu2yoc/UG36qsDfj46LXnboxIt3fbUxJQt5OlLSiksSPOhnKwa+hyUafjP/n4ef6HoLLY+QvDzZY+bjSGBJVAT7871gsHTrVIBlRBzF5V6b6leAHYZeNFLh4Ojw0zEDizBdaVhASnzAVCN/sOiXg/ZLAWdPu1KugcOJOvxboLV0DkBsp5Qm0Nc/KNmYFyrIkdN0Adz/h3NfoIcTsRAP5hUeowE3Nj3Cg7v/z6q/qTNRDdILkTkvGTuI3zvruZRRNzrw5vUV4jtVKKEPmTX2xckvGCmX7htD0+o8DDJUSTXLf0KVsnNOyep+KZyym1mo2jvSLrR5dISFpnx19L4PRuBwvRNY1luy1smIXsdJ7OMmOdQss+RYC6ofxdYv1yunAspWEOTbVVbme5vzXFSHEy0wzN4QmH6B+AaZzcLdweQ39HT3QyZkn3PgtKjyEe5Lik9hM1M9WVEzZtWzeyEeFQUzMNZ+GhlRSgaOExx87HMDHXSEju2aSgbYiZhL+tuEUFWe2ZKvBEl0Yqd05iQ2Mc/IUOenJEe/1nI3sfg0+g7aDdw+lw/wCbwDJA+07mA3pqz2Cqwy10GW22C9mvtDQ7vZFB0eIDTu8QA1XlKXEo9+2OnYPKdp+Oh+l/BR9UJUuN1wLG/QsY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmFNSVBFVk10ZEV5YUJURDRWTjIwSUtINVZjaVVReFVaZS9lc3liQThoRENr?=
 =?utf-8?B?RWN4VTlaRm5Lbk56eXFaWFc1VUJ3VEdMRjdXYWpZWDZIMHdBRVE5RnVaeEdz?=
 =?utf-8?B?Y3IrSU11VGg1SDRrUTM0ajF5T1VybjRUZXBVOExpTGNYTnlCOEoxM2k4VXI3?=
 =?utf-8?B?VnIya1M0RWs4WktrbTROb00xQUhJeG1YOW1kQmIwQ0NXTDFHT3RXM09uN0tZ?=
 =?utf-8?B?NDhTVUdYd2hlbUpuNUUzVU9oMEU0c2M4UWIxNlU0M2FzaXB2d0FNdzhtU005?=
 =?utf-8?B?VDRlcWtzb28vWHRSdHdrcHVBaGZSNnRDYUJBLzl2QlFXNUtPZGlqQjVjVnFG?=
 =?utf-8?B?ZkRBZzRDaDkxaE8zcjErZlc4V3FacFRNUGtSZ0JBdnpXOSs1RHNsNGNtazRB?=
 =?utf-8?B?UC92VUcxalNpbG5pRjlvR0prRHNRZE9SU0RCZUY2UVpTTWdSZDQrZkgwaHBG?=
 =?utf-8?B?WDZ2bEpjVGRHc2U4VHBNK2h5Ti9LSnFyTk5sb2NLT3RFK3haa0hVaHp2ODB1?=
 =?utf-8?B?SmpMclJZbVJEN1F5aEQxSExqa0J6aFpheUN5SnU0NnJOeDl3UjBqdzIvUmR5?=
 =?utf-8?B?cmxYanpWVUNERmhNbXZKVktVeCswRGxHc0RxYmRXUHVnWW01L1IvcEVaMVcw?=
 =?utf-8?B?S3hXcVdaek56elhiZC80b05iMjhtTjdnVmtldlVoMVRyVTNaZXR6Rjgya1po?=
 =?utf-8?B?TGo4KzVyVUVmbUpINlE3QWdLcjlUZzk0OE9KM0RyQ2lVeGlxaG9xRVQzdTMw?=
 =?utf-8?B?R1NzdFRZeVY0WFZxckoxTVFqVk10NDVrWmlvMHIweTVUekx1QWFoUTUydVJV?=
 =?utf-8?B?aFZROUpKYStBMWphankvVjBETnZlVFdPT1ZQaDlBN3oxT1dLUk1lY3drbm84?=
 =?utf-8?B?UW5PRnFocnIrUEFiU1NqanJTTUVYZ0l1QjYxYzI2TzA1ZVRoNU9oQkFndlJN?=
 =?utf-8?B?T3ZiVHg2RFpmTEFZY2M5UzJ6dXd2OWpJaE1kUFdDVFZhNkszeEJVdlZXcDdi?=
 =?utf-8?B?RkJPbjNESkwxVXNHUFozQnVLRjN3ZSszcHMyNXdZNUoyazlXY013QWlrdEhp?=
 =?utf-8?B?alVkdkg0N1c2bUJQVkFiN0NTdFFwWnQyai9adDRUT2NZRHZWOGxQeVFzTEdV?=
 =?utf-8?B?UXdzYWYxT0d6b2JkZUJCOCthbjBuSFBSbHdZZG9rSk45ZVJTMlNidDAxdjA2?=
 =?utf-8?B?QmIyMGNsemdiU0N3dDZxVHk1Y1laNjRJMTlrNmhPeVd6NWhuTGpQWWNsSGc1?=
 =?utf-8?B?SWk4N0FWOC95dWJVQ01UQlcva2E0WmQxendwWExUb2kxQjUxa2NjNEdCVXpm?=
 =?utf-8?B?T3JyNXRVdFFrZjJWcXQ3QTdOeXppakZBSzcwYk1UckpTak13VE1zS1diS1Vr?=
 =?utf-8?B?eDZ3bDhNeTBwVU14NUdnam9ReGhNb2lRc1drelZvY0V4YktnWE5yZHhDSlpW?=
 =?utf-8?B?a0hqQzZVUURmZ2hCWU9EcjdJcWxVR1V0RkIyT1dVMllWTVVMUWtNMTlBWXFy?=
 =?utf-8?B?VlZwUE5iUnJDb0FJSHk5SUtCTWxHV0sxWUppeDFnU3hmUk5kNC9yNU95VGdq?=
 =?utf-8?B?VkNvZTZlWXVHMEd1dmNORWkwSmk0c0ZjdWdYNy85S2VuYjFrUHB0bEF6bXov?=
 =?utf-8?B?b0V0bHRuU1YwbFFVQkdBdkdjdFFXRmk4ejU1MEk4OFNxYVcyNE1VT3E0RTl3?=
 =?utf-8?B?S3cyeXlFQ3hCU0pPVXVhZ0s2anRrdTR3Mm1PZVpLUHFqbTdWSnVqUGoxaXdW?=
 =?utf-8?B?a2pyQ3VyVkVFVGovQnZrd1BQSi9mNXkvc0Q3ZG9xSkpvcXMyK01rbkVsK0VK?=
 =?utf-8?B?dFpkaG9UUUlPM0EwNlNrNmJwcitCMUt5UERPaFBwUGRUQkFvbFlkMm9LN0NY?=
 =?utf-8?B?L1lDbHp5Vi9PaWlSMHd0ZzJmWTQ4SVJvb3gyMGE0Ui8wKy84VkFJamJnbjFY?=
 =?utf-8?B?QnRSc3p4UXNGVW83eEh2bjFGNGJnd3c2dVY5bkdoenVBZE4veHBrSHgraDQ4?=
 =?utf-8?B?cFN3QU53K3pXZ2NmTGE1QnpwcDFDTXV3RnlBL0MvRzhQVEtDNjhQeWF2QlFG?=
 =?utf-8?B?ZnhkMTNWYS93b1RVRC9OdEI1ODJZaml4S2JKYzdDQUVYWi9Na1ZXYVYyRitH?=
 =?utf-8?B?ZHlMQ2doQTM2WlcwQmM4bXpQWXJ2Sk13RGZPNEgvVG1lUXNsMG9obkI0cHMy?=
 =?utf-8?B?M3F5L2FsK2E1SUZ3aGZGT3FIT09ydzBpcFBLOUhHb2pVaWlmQ1o2RGJ4eG80?=
 =?utf-8?B?aDNqdjVvTDR2SWMwNjZITktwbHoyNHhOTVcrbk5SSnBNTklwNE9mMWdUTWJS?=
 =?utf-8?B?OHJCWlJ2Nkh5cmgzMGJSTDVIdUpKdXNZeXhFY2xuSzFBYlhxcGtXVnhCNjQw?=
 =?utf-8?Q?JNieTLxszDkBTskc=3D?=
X-Exchange-RoutingPolicyChecked: qsf1BRbsPiRyrqrciLhm22vq8WI+foaadH++19YWOvU4RLbUZdndMICQYcYf6sUymvWH9GhPQ5TRdqTGZtrS36zTs/pv9KVorlste8UZEoF7rOxbsZukjWy2dZ/xm8Edn2eylGmmeOvPEHUIqRgiOC5YzwbjDYZhuwkONFYd3Z+rhTdUCz0P0c9OdQENwRyV7DUDbiZaZChVoPoILy2meWOTX1ITdetJ99lNkwdTMbRl33pUENUqXF0iYpM6REZ6MZ5qV12MZ9xZHD/hDWJmsFFrWrLOuis9S5TQNbkrf3t4nKIs0b2195c6aU3fYPNcV8r6gHGfHeO1tNKgb3CBPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8452f461-a410-4168-ba33-08debbf87d38
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:01:46.4875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCCwgRblvsEwzD7gkAe8Y4DKQI0EtcBx0K9qA4eMOFNbG/uL+foqOj4YiSs8r14YGgjGFzUQeTbVHzGGMYKEemMLcCcDy4dW+M6Ydm+fvBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6941
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


LGTM:
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

On 27-05-2026 02:19 pm, Jeevan B wrote:
> Add a new subtest to validate DC3CO counter increments across
> frame gaps exceeding the threshold during a video-like workload
> with PSR2/PR enabled.
>
> v2: Update commit message and test description.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 91 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 91 insertions(+)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 59cb9983d..3f17effc8 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -60,6 +60,10 @@
>    *              exit cycle, ensuring DC3CO is not broken by deeper power state
>    *              transitions.
>    *
> + * SUBTEST: dc3co-vpb-framegap
> + * Description: Validate DC3CO counter increments before and after a delay greater
> + *              than 6 frame gaps during video-like load with PSR2 active.
> + *
>    * SUBTEST: dc5-dpms
>    * Description: Validate display engine entry to DC5 state while all connectors's
>    *              DPMS property set to OFF
> @@ -427,6 +431,63 @@ static void test_dc3co_framedrop(data_t *data)
>   	cleanup_dc3co_fbs(data);
>   }
>   
> +static void check_dc3co_with_framegap_load(data_t *data)
> +{
> +	igt_plane_t *primary;
> +	uint32_t dc3co_cnt_before, dc3co_cnt_after_gap;
> +	int delay, long_gap_us;
> +	time_t secs = 3;
> +	time_t start_time;
> +
> +	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, NULL);
> +
> +	delay = 1.5 * ((1000 * 1000) / data->mode->vrefresh);
> +
> +	dc3co_cnt_before = igt_read_dc_counter(data->debugfs_fd,
> +			   IGT_INTEL_CHECK_DC3CO);
> +	start_time = time(NULL);
> +	while (time(NULL) - start_time < secs) {
> +		igt_plane_set_fb(primary, &data->fb_rgb);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +
> +		igt_plane_set_fb(primary, &data->fb_rgr);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +	}
> +
> +	assert_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_cnt_before);
> +
> +	long_gap_us = 7 * ((1000 * 1000) / data->mode->vrefresh);
> +	usleep(long_gap_us);
> +
> +	dc3co_cnt_after_gap = igt_read_dc_counter(data->debugfs_fd,
> +						  IGT_INTEL_CHECK_DC3CO);
> +	start_time = time(NULL);
> +	while (time(NULL) - start_time < secs) {
> +		igt_plane_set_fb(primary, &data->fb_rgb);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +
> +		igt_plane_set_fb(primary, &data->fb_rgr);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +	}
> +
> +	assert_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_cnt_after_gap);
> +}
> +
> +static void test_dc3co_vpb_framegap(data_t *data)
> +{
> +	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
> +	setup_output(data);
> +	setup_dc3co(data);
> +	setup_videoplayback(data);
> +	check_dc3co_with_framegap_load(data);
> +	cleanup_dc3co_fbs(data);
> +}
> +
>   static void test_dc5_retention_flops(data_t *data, int dc_flag)
>   {
>   	uint32_t dc_counter_before_psr;
> @@ -854,6 +915,36 @@ int igt_main()
>   		}
>   	}
>   
> +	igt_describe("Validate DC3CO counter increments before and after a delay "
> +		     "greater than 6 frame gaps during video-like load with PSR2/PR active");
> +	igt_subtest_with_dynamic("dc3co-vpb-framegap") {
> +		static const struct dc3co_test_mode dc3co_modes[] = {
> +			{ PSR_MODE_2, "psr2" },
> +			{ PR_MODE,    "pr"   },
> +		};
> +
> +		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
> +			const char *name = dc3co_modes[i].name;
> +			data.op_psr_mode = dc3co_modes[i].mode;
> +
> +			igt_dynamic_f("%s", name) {
> +				igt_require(psr_sink_support(data.drm_fd,
> +						     data.debugfs_fd,
> +						     data.op_psr_mode, NULL));
> +
> +				if (data.op_psr_mode == PSR_MODE_2)
> +					igt_require_f(IS_TIGERLAKE(data.devid) ||
> +						      intel_display_ver(data.devid) >= 35,
> +						      "Platform does not support DC3CO with PSR2\n");
> +				else
> +					igt_require_f(intel_display_ver(data.devid) >= 35,
> +						      "Platform does not support DC3CO with Panel Replay\n");
> +
> +				test_dc3co_vpb_framegap(&data);
> +			}
> +		}
> +	}
> +
>   	igt_describe("This test validates display engine entry to DC5 state "
>   		     "while PSR is active");
>   	igt_subtest("dc5-psr") {
