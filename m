Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5281093189
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 08:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0ACB10E96A;
	Fri, 20 Mar 2026 08:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GiAh1dK8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE1B10EA92
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 08:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773995202; x=1805531202;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aknKyLpprGEkxPbt+CrCwBbRVQvL09LStH+pvp64Um4=;
 b=GiAh1dK8eU5ytl/OeWvcPWvXKM0SQ6EGtoAdaw8vc9rt99Icf3y8kP3R
 djAJxNt7icBdkbDteY+PznOJtLmRmWgQIZSdMHV8A5uQb7zY8rUSIY5Av
 J1iTt06rBCaCgXZEIvdzRubJCDbCNH+9c/fUldoxbh90FN+7kFbhWfD0x
 ft+rLm+SpO8/9pZPKxUcCzv/a2otlrTI7w2d88LV588kWJP79q3cW+9KI
 4QmrAKfw6avWIUpC2Ug4qASq65sGriNwRfz3RpITod9xqO+DfDFDl8Dwv
 oT3hwTRnCnRzJkVLSkZIrv9LwqZlChPQT+U2tUpK6NQOesADjLgptd3jp g==;
X-CSE-ConnectionGUID: bvYxVGeVT/O1MIYgx5zivg==
X-CSE-MsgGUID: EklgnVEIS6qYLC3GOkyX8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86155193"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="86155193"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 01:26:41 -0700
X-CSE-ConnectionGUID: vKuDfO2sTyS3pwDrYBt+sA==
X-CSE-MsgGUID: qoe48TECQHW+5AFt08wbew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227946004"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 01:26:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 01:26:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 01:26:40 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 01:26:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixvcq+v/5AcXW0VSVMcn0Q4yNyGWb/VdOMiwvLc3utnrho3hoWV4O2QCX0qLNlICK4lRdZRVM26GPD2xKaEBe9NIzoMA/JCYiC2hXCX29kTVr5PieSpdgLhafxIXk38aKYWZmUBr7pwjz1oTjTpX+lwBtkpyAqz5GSUvtvfqZAyNHCOpPTxfq8y1KkSZtZiWoSHQQUAfqkepby3jQu3XcbK9lwmMK0p0QAALdtyLv1dykwPfvMoan9Eyq9yaTKrBhKnHKIV9K+BHRpFvcYblfKndLdKXzw57I+q5Q+h7KJGZ3rpeB6/lox4Zc8aXs+bqnRkIEpNrmyAwxPdzOAt//A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvO4NXdWcPFlKj2cZxFZCzfR/AWhL3ZbEuXjx3E8bSw=;
 b=fQC1vu6NcEoATSsn6XqxIY0XB8922PbZKhnTKg5HBKs21sDKe9vxtZGjKyMbJNDg5ohuepm6gIyxY6ZnUeJQ9gxr3HwhdEiA0+HhVArsIHwZlXKzvOnSJZJogIu/f0E3qC0k6ckTwuPZzebSGPuQbJ+AxM5ziEwCe/0MZTTXsKhXFOk5zYTE+HcFtXf5wyFgZ9EhAAXClTDGH/tIJ5sO832boO9mZ6bQZQPTbGr+nQBJ3CtXWOItLFyl4XeA9D2cYUyqF1oz477+j64Wiben7cmzrdwP9nxpuA9t6TA7NPXyZnMMCTcIj+sngLLoNVFwiUZlT7msW5HmRHUSTzzJEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA4PR11MB8916.namprd11.prod.outlook.com (2603:10b6:208:55e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 08:26:39 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 08:26:39 +0000
Message-ID: <78ded675-1ca4-4767-9f8b-07f406a88dbe@intel.com>
Date: Fri, 20 Mar 2026 13:56:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_plane_scaling: Use selective modes for
 scaling checks
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, Juha-Pekka Heikkila
 <juha-pekka.heikkila@intel.com>
References: <20260316185218.700329-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260316185218.700329-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0237.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::13) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA4PR11MB8916:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf0c06a-43ef-4277-8eac-08de865a682d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: opPEkr4GwZkiEh28VEHTlvQAHfjFFdOExMBJcMgJrYaB0o6yp6Jae687gcVcRsN7eOTtZNRma1YoMq4eoddZJRx2nJ/04XFd5klyWDUcAgWTWV9UDm9HHoCJSiIAdF3aj4bKeOj/8r9gHoHN5yz8RuwvjC86JLngH0yLJrPmyjM9e1Y5u9wf7EeZIXDfBckBLy8mJzH/trpuKWlelwwlnMTYDus9CiD0vAH8EqTBWzAmPPDaWFyyrzHoAkbT+gA8exYVlu9DM+avKRlRhwCfX9nN5psv6QtGpX2LBHbqcLGNcedvoS11FoHCYW7U44YzKrErXPyClEnbGegqsbN1u1//W6+xQW1cBucqtvhEdPN0lWcSl9RymYPzajZttXUo/E+uUqHA0dRvmthjgTwQ25R9pM5nFBULc0Z9Qpv/axD4+dvM5RDSamoJgqkp627hPGw5DhKEkF320hvjZIWuVL9i3ltGS/lCW2iZh/+zvIOWynDUeH1ZsJNP+c7AQwjkb6BwMplLvaEtBlQCznu3HpF9tWaZP48x3JR2FTGf9kx/gSLwuFYXL9cYFOZHQfIBLj8QJOiO9wX3ch5EpZ1ZNALrIaQKS0gYj9GrQ8VgcK06bLwyID755RcyrhMMM2q/U2Kw0s2lfi8LqXcVfAkC/4mZLgNGBAbmz3//GWatzxqysfOyeBlYCDQAHN/gB1Tnygf2xlhm9rnnHPUR2GZ+3pIPPM/p3HKHGbiGHwNSARU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnNqYkQxSTRXNjVzQXJjejh4LytpN2V0ejJBVUtLTGFWckRVT2dWcGJIL0pn?=
 =?utf-8?B?TjE5UGZzbUJkY2tiZnZPenNYSjBJYUZ6a2dGRThtaHBKdExxM2xGREo5UUhl?=
 =?utf-8?B?UlFBekVGTUM3K2RQQjFJdDJPNHVhb0NpeXBWYTBlWXpyTXoxa2psNGFzUktR?=
 =?utf-8?B?MUQwU3BCNzBxeVRpeWxHcURuRVdlQlNkT3ZhVzFNVXBlTGdnbU1OQUJpeFBH?=
 =?utf-8?B?THNGb29YVnI0Y1Q2ZEhPWlV5M3ZLMXhiOEw3NjRuVjhnaWZJZ2g1UHp3dEM2?=
 =?utf-8?B?cnI4RzBGQlI0ZTJmb2xvS2REUnVJUFFhTHRKSGhhUEhrR2ZQVkt4bGlMQ3Vz?=
 =?utf-8?B?cnRSUXpUTUk4RWVWakhHVFYxWUVvNUhwR0RhU0djaGhzNGJXQTNmSEQ5QzdY?=
 =?utf-8?B?RDg5OWlFYzV5cFpDdEdZWjhDZWE5dnQ2RGlYWlpUZmJKQ2ViQVNaWVhZdGd3?=
 =?utf-8?B?b3Rzdnl1T2dFL25BdXJaYy9KTHdWVlRXY2pkVC81SitIQ0VnYkZoWjByTWZt?=
 =?utf-8?B?enVqTys5V2FjVk5BQlJjUnpYVHhZK0VnQnEyWEJWQ2tmYUNwY3R1RHF2QUhQ?=
 =?utf-8?B?dE0vV2o2MGVDOUZQLzlWeUhEM2tiUURQMmFGaHc3WElNL09QY0Irc1RRSUJk?=
 =?utf-8?B?OFFHWnpXeHgrakpybUp3TDBBSDV5SFhWT0cwN3RqRWpudTNCbHo0bGthdUhx?=
 =?utf-8?B?cTlzRVBIaUlORURvcWdHTmw3bnVXckFSVExYUGZHOEFZUGRHRnFyQVJYVjQw?=
 =?utf-8?B?SkViVmlDWnpuZzlwK0dLa0VMd2J3V1JtMERBdUx0eTl0WHo0cGhoTU0yTFg1?=
 =?utf-8?B?UksrMDM3WXl0eEphQllCZkQrUER4Y3pEZDVGbitFVEY3S3JReS83a0dvQUxU?=
 =?utf-8?B?ejhBeEJSMzRNczBnSGJyUE5ZeWpRNytNSUV5SlhnMkZxOGdSeHBpcHRETTJN?=
 =?utf-8?B?MDZ2MUM4RW5Ga1doWVRFbmpTMU5vODd5TFBlY256Y3lHQlFzVlZTSXVoQ2Rw?=
 =?utf-8?B?MU1ES1FKZ0F0clhERk9KK2Z5dGNWS292cjFabVJ5Nnh0VUVNbVVqYUxDQlps?=
 =?utf-8?B?UUZPSTdFQ3RodWl2ZEtNWFFEcVVwVFVsVmVGVEdOZlBNc3pOVXJLbGRQcFEx?=
 =?utf-8?B?dGpEZENPaXJsNTJoZ1ljc1dqYWRhWElRanNFY2ZzRkVCMVVNWlB0Z0VmR2Nm?=
 =?utf-8?B?blliRm5vSDkvdkVqWXdsZWNBS1Y0YjkzZzVhNHI0ZlNjZWdpWEJ5cnd5SXBj?=
 =?utf-8?B?eWxXZU1OT0gxME85UXM2aSsyandsdU9KSk5nTXVtVXhLbVZNQ1VhcjZxcm4v?=
 =?utf-8?B?dFFuaXNXdExzc09qeXUzcElEWXNHQlBzU2Q0UXI5VkNRZDJobDJNc2RENUFE?=
 =?utf-8?B?NXBtSGhZSGxyMHRLY2ZFb3hXT0xZbWtPUHRBbk83Z05DVVpQdzA3NzdFZElY?=
 =?utf-8?B?My9yanNHTVFRaUVFRm1zcXhJb2w1cDFYVnA1VnJic1dBcDJ3clZYVmZKazl1?=
 =?utf-8?B?ajlFRnBtbDJFblZFNXI1aHlxVW9UdjJqOVNpVGZ2eVl0cm9uL1cvaXJRcjhu?=
 =?utf-8?B?MVpjMFh0WTJhVldlM3U0SEpUNkJGUXY4ZFJ0cnhudVR3QktxSGtrYVhNbjcr?=
 =?utf-8?B?TTdPNmJWQjFHVHhNNitURUpVTmZOOGwwYTZRY2VZRE16Sm9mMWZWUTcvcjN0?=
 =?utf-8?B?ald5RmlMclN6MEVsTzhvWllBdEtOWHZrTFFudWdvQWZYeUxsQnFNendUWkV2?=
 =?utf-8?B?ek8vSG9QSU1MbHpiOWZ6RUwxYVB2bWJ4UHdkWlJPOHk0SWRDSjFYQ1VCSTFv?=
 =?utf-8?B?djZvTUpvNENQZW1jbmdOS1d6akRQeERNYm5XeFlMVDE4NnI1Z0xLeG5XZXM5?=
 =?utf-8?B?TTZrMjBCWVZWaHQxM1UxRWk5Q005cVQwOW1CVDM2WUdRU2U3SXA1VkVFY3Ix?=
 =?utf-8?B?cXhETE5iNXRobHBLQlo5NWFrdXJ0TngwdnowcXVaWkxBQ1V5Wlp0NzlPNURh?=
 =?utf-8?B?SkRmOU1Tbk8vQlFHbCtQL25UK3dTbjVFSTR3RlhqR1UyZlc1cmw5dEp0cEkw?=
 =?utf-8?B?Snk5elJlS2FYRmpzb3VadjBLeGpwYW9wNUdqUkI3NkdTK0tFQjl0WlZaanF2?=
 =?utf-8?B?UmZNRE9COURHeVdpQXlIY093cmpqZnJZOVlObUZHQ3J2M2FwbU0weDRKd2NX?=
 =?utf-8?B?dlFDVjcrWE1hU29PUDk1bkJpMEJRZGpwK1I3L3l6ZzRVTW04ZkRsMnBqeG14?=
 =?utf-8?B?WExNZms2TmpBOHpQb01nTExKczBXQnFkNTd4Z2NteVAwTUFIZ2IyeHVWa2g2?=
 =?utf-8?B?emRDNG1EQmxwcHBIeTdxZWpHWXh4eUFhSm9YV1FXUmJBcWk0YStiZz09?=
X-Exchange-RoutingPolicyChecked: l9krc6rqGv6xw2x3pNT0x7y5YtBgbgEV43OAzj+WwZsKvPugQN8IxkTJXJgVXhJ0ST9zysk9sVENcQRdZylRXL0A1vl5fhVeEgJswaL+mfkZwNmP6uNsSyYJMtq5qjKR3E1vkpi2NDUk5GeXU533NebonhqdDiDocfUDnaWfJfkjHXnDfCOCC9auln//NIOPuF4W+aGWDLJ32PkhCuZcD/CvFn5cHa0h/QtzX8r7P2fSB2tdTnWpS9gZvY+v+0AsX6ee4dFyKBJiVJmJCyDVgjsmMqQEMowhRr6avOG536wyMaewPEan0Uu1rtkk+fgCxlnfXmzhdalWkrDtljrlhA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf0c06a-43ef-4277-8eac-08de865a682d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 08:26:38.9544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DaalGc1j7QVTTIAllk0Vod8z4EQTKPvS7p7kzGHTHRvrFlBrQ+e1kTBPctgz00O2qc0RjpgI47zVg4xLO1+D1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8916
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

Hi Ramanaidu,

On 17-03-2026 12:22 am, Naladala Ramanaidu wrote:
> Update the scaling test to try only three representative modes:
> the first, one from the middle, and the last. This decreases test
> runtime while maintaining adequate coverage.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_plane_scaling.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index ab619fb2b..33546d5bf 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -584,9 +584,15 @@ check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   	int commit_ret;
>   	int w, h;
>   	int width, height;
> +	uint32_t mod_count = output->config.connector->count_modes;
> +	uint32_t index[3] = {0, mod_count/2, mod_count - 1};
>   
> -	for_each_connector_mode(output) {

This change was introduced in

commit 27926dd5792a225f28eaf938134505fd44ba8872
Author: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Date:   Thu Jul 18 19:35:45 2024 +0530

     tests/kms_plane_scaling: Find display mode fitting in BW for rotations

where we were lowering modes to address BW issues, but here adhoc we are

choosing 3 modes..doesn't look right. May be we can skip 2 modes and 
check instead

of choosing first, mid and last.

++JP

> -		mode = &output->config.connector->modes[j__];
> +	for (int j = 0; j < 3; j++) {
> +
> +		if ((mod_count <= 2) && (j > 1))
> +			break;
> +
> +		mode = &output->config.connector->modes[index[j]];
>   		igt_output_override_mode(output, mode);
>   		igt_debug("Trying mode %dx%d\n",
>   			  mode->hdisplay, mode->vdisplay);
