Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9B7CD4851
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 08:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C212010F48A;
	Fri, 15 May 2026 08:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQ8GN21B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE64F10F46A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778834205; x=1810370205;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2+exlH9ajWSleljs+Nejj1KKAo2/1z7aBdR7JdOZ4Go=;
 b=fQ8GN21B51s6uEtG+aByp57L+LkHx0ZzsLTQttb0dvi4Ic+KvR3o60UN
 3R+8b0zz0mbyrAZqfg6MCvWYYNTCD9UWYUEKxmsrgWEG4g+ugJrGvy/yh
 a7QYlAFjn4SFSIsq92J6UWLWhOQiroOW4dIp6XTHgZoD/kjJlX3o6uK0J
 E5ixoS6hqBXobpIlyevqQ4SmkX/fgnzZzUXYNNPH6XtTPdk0DiBDQaABD
 MDEk3218hDNW8BlyjcVq82CIdTDCrxVaEVVONV9sLvtc2fRHgk4dvP37q
 +xRRny2KYaYqlL1g6I6Sd5YFXXUUxAjDBjle8YyuyJPn9Fpvb0CjzITWA Q==;
X-CSE-ConnectionGUID: PajCFq6BQiCjLgqxJla/3Q==
X-CSE-MsgGUID: BD/p8Jv1TsavKRMtfcyUIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90890738"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="90890738"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 01:36:45 -0700
X-CSE-ConnectionGUID: E6Vi2xWLSa+9W+CjBpMZlQ==
X-CSE-MsgGUID: ptmvWMGXSmeetZqkVWKB3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="238515796"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 01:36:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 01:36:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 15 May 2026 01:36:44 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 01:36:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gC+OVzDGpO51KsdnNKhTEzFyItKJRjVPB+uinqmidfcSkYfmmF/DtfDV/bBeYqqe3J44yIuAShnU5Dom6aLVsuBRL5WivJPvPUZTlGksZvwpCaagCe3tDz0JQrayrg7hNzIGPeRi/7+LihKYN5IyWYhLwOt5jqHooO7bfw5fGY+6yimAeG8uCghd1IIUWly8EuO0n21MHcoK9iSyD2AehHLTAxxDO+t2BkADvjUtdqofigbf8kz+G2RCxqQgH4hfkRz+yl8xRtdp8M7fjlKSbEFBSNJyjG1OSIMyLAA1Zt0ntk+0Fc3QdCQNTWZxPeBuafz3vxOYL2nF2PwHgYGXLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WKUuRArRoPjg2jIRyOymr1yItcmls9fUxNVBR/sjU4=;
 b=Tb2yAal3Y7Tv6QArhixpi0faT24SVO0fSJjoiZsOPMBG545qaIb6Suy8TLbEZ58Ld3ffrKksdP1s7NmU5FS7FiHvJ/BuOXs6jsbCtO6wHnZ+N9/WSiKLjiK51LitXVl0wFepl7czC4tzv2n93KDFZaL47cEVhEs3eYF3GpjSfNOU56n5sC6AZ9x06p3xisqrhOptjG1EE0lzk+2pnPNR38ulqDKtLRfDcHv0zTtg/edRn0qkbjXEmdi+MIHyWw4Y/cUaUXzBQyhcn7tZgKOy9JLIxsacUxrwbgI1i/U6TpLZN06dmnLZoEQJTHYWql0fgLm+GxI6rHo3I+YIQZV7kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA1PR11MB6371.namprd11.prod.outlook.com (2603:10b6:208:3ad::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 08:36:40 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 08:36:40 +0000
Message-ID: <6a4d2a00-358c-4ca5-a41f-d6044dbb5e0c@intel.com>
Date: Fri, 15 May 2026 14:06:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v6 3/4] tests/intel/kms_dsc_helper: Add helper func()
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260430190947.2347314-1-swati2.sharma@intel.com>
 <20260430190947.2347314-4-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260430190947.2347314-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0270.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::8) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA1PR11MB6371:EE_
X-MS-Office365-Filtering-Correlation-Id: 55b5cdd1-724a-4594-2aba-08deb25d15f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|42112799006|376014|56012099003|11063799003|18002099003|22082099003|3023799003|4143699003;
X-Microsoft-Antispam-Message-Info: pSUQKDNiOJ/EfXoh2bDR+PS2z2LRsFJf+wrc2bv4mMsw5P4OXwHObwuiiCJODF3SKHUN4jTgZopS2GV6llnQ6JgiWY6UlQx88qFXUyCky57ET/XoMTW426Of9iTfcUHwH3To8khwUTtvlUYFyNsk3xkG8wTMUA7eKiLz2uxr/UsfKxxIynvjxIHmDONhCWLUNsSa4O1I3pW7CWFDj4pXGJ2JxsNRO+RyTaYHzXeQu+J7hXQRPUdz2PZz6EKEXuybrbMeX6qEYl67HSLFf2DMM1Cp8MjXZ8PnnWHJ5mtOk8/vTpOowv8qsO7uoFOj9bMZ7mx78mexd2xqMOrAOBKwsrUphWv/QJsIqHMHs7kdiF+Wf2ag61l27dXRxboaltHVbU1Hck9s5LDbvjvmiWqyrUPBtjG3XGsIAMKYUAiz95quGYySqWYvv3ZE7yCNS3Z4UKAEuq0A+9VM7mUuGj2rpicoxDOcNZTnaSPgOHUed+Fpc+hun+7JmEzziQr7rPq6+CfwMBfkChDm+OWUNF95C7veC89/JHMzCIdWXkxV2nOuer0Vg0JrsM6Wbn0NasK1bOSeNPBdixZEmQj0Kv6ocMBrxhcvojg7SHRcjgyeOeMhgc9wqlEayPBQkm65zuGnB/4DA6trqx+Ydf/GrR8BV3OWiVLloK8tl2ivEtIzgniTNSnKBst42ty5JfaCgs5G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(56012099003)(11063799003)(18002099003)(22082099003)(3023799003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N25oN3FnYXFVcWt3N0pjeGlmdGRycklHN3BVWWlpNVdPUkNMRXgvY25iUDJ6?=
 =?utf-8?B?OERBOEtMUWQ2b2U2c3B2SUNWNm80a2xUb3JYUU9lRmFEWXRUbW5OTktNSHhB?=
 =?utf-8?B?VGp5UWVLQmJpcm1vNFJwUnhKbTVRYWVlUDU4UGEyQkFvTC9lU2lCZFovUjdN?=
 =?utf-8?B?ZXhGck44WWo5TFczQWlPekxxSi9qcEZKdXY3MmdBamdsNUw1Z1JvNm5QRVJP?=
 =?utf-8?B?QW1rdjY5RWMvZVo0Y2V4NUNJQ3lvZm0vVkM2L010VVNPUmZYTzZyd3VjZlM5?=
 =?utf-8?B?WUZLY3BlelUrblB3emtjQitHa1dpSUNSTmFlNlBPZkVoSTB5N2FtNWZYSmQ2?=
 =?utf-8?B?d2l4TkxVZmFVZjdsNElUZkZNeEVaZThxc3VaK1hkcXpKaVF2N1puRkZDTmpw?=
 =?utf-8?B?bWdrZzM1dzlYUnloWVlMWnJjWXpnNEFWTlRpVEJVQnRVSnBxZDFyNFFjR29a?=
 =?utf-8?B?dW9kVCt3cjZrRkMzVUE1NkIxMFZrbmUwQTNYNE9KakdWV2pzeFhwTWhBcytS?=
 =?utf-8?B?RUJMaW1HTjdhQXBwamY0ZndvT240UGIzeDh1d0pnUGNWTHJ5Wk9wTmdyVTVq?=
 =?utf-8?B?MGc3dVVOQUFBV3M0RzNMOFBpdFU2bjZCTXZwVnk0WmtGa3NabDcwaTlqWnhq?=
 =?utf-8?B?bjF3VG11dHpzMG8rdUJWdjlCSTJxSHUvSGlOOHRKc2pIWTQxMTd5YjB2dkR6?=
 =?utf-8?B?OXRZb3dnUDl5UTE0eHVhYk9FbVRIaHI0VllHcEk5ZUZTNWhBYjQ2YjVuYWhQ?=
 =?utf-8?B?R2R4UzJ6SFBCOWtaays2S3IwcW5rekpvQklQbnRKaEk2SzYvNFZTcUh4NFZT?=
 =?utf-8?B?amhtYlozNVp6QzNYdVY2MmNHL3BScVVJSWYwbGtzekh4Q3hlVkw2cjBPLytG?=
 =?utf-8?B?YURHWmNZK2FOQ05YQUxLMmFpMWloT05yTThvNlArL0F6UjBuTHZtMGJiOXhB?=
 =?utf-8?B?ZERqaVEvUVoxZ0VRMkRUVFZPdDJYSXBRenNjU2NqRFgzR2Racko5OC9iOHRT?=
 =?utf-8?B?YVlyWTRVQzl6RVlDMjFYTTZrTVVET0RCOHpLVHd6bjJIVHZScWQzbUFMSkhm?=
 =?utf-8?B?alNKNzlXUnFZZGZ5V1JldHVhOE5WNlk3N2gvcWovQVRCY0oybXhDelJQWWdK?=
 =?utf-8?B?SmptOHduc1o5aERhRy9sVDFUaVpWaUd5Ylh5bFhnYlZJRnlXMTdJeHpHLzZa?=
 =?utf-8?B?T1JhTWcrdU9Hbk9YdUhsRyt0LzlGemliWWQwOFljNDR2QUNiSDJLZGJhNjZ6?=
 =?utf-8?B?UzAxbldvUk9WMU5Cc3Rnc2xEcVlhQkRhSXdic1REWHA5NTFVdGFwQzA2L2Rm?=
 =?utf-8?B?TVNncVd5V2w1ajE4dUZ1QXJiWXU3bTVlczQyOXZPclp0QnIzS2ZkRUZVZkJi?=
 =?utf-8?B?RHJCZVlUcU9GR2Yza0J6aE16V2NjODNyNmJnZkJBNURobHhIWnhVbEFVdnpX?=
 =?utf-8?B?ZGtmVkUzTlBmTjAzcGRCb3dOWW5ZeEJjUlFIU3pUeTJpRG92NDA3ZjdaS3M1?=
 =?utf-8?B?aUtoQ0wwSEQ0ZVA0VVVWNVdsZnRaUmhML3AzMndDdGNpUEpXTHNMclRCTEpM?=
 =?utf-8?B?NEg4SDI2MDdGVGM3OWJxK0huRU0ydUE4ckxmUWE5N1hKRTZJQ1hOSU11RUlN?=
 =?utf-8?B?b2RmRVRWaHA5VUtsM3FFM0lMZnBkeFNFLytJQzlBVXI5S1hQYTlyWmhZUTRI?=
 =?utf-8?B?T2szTnlUZUJBNWV3aDNjZnNWTHp3Wm1YK0p3NmR4ZWxXQXdiOE5ucU9ieVQ1?=
 =?utf-8?B?SVpEZVdOdVpOQk94VXhBejU0cndaa2hodVVURi9CZkV2OHpGVVhadm9OcnF0?=
 =?utf-8?B?emlqQm10Q1lNRHpVcHZZVEFlK2hrYXcyaTBGY1NwT1kyTFpJN011aExuUHVv?=
 =?utf-8?B?TlIwQnF5UWZPL1YzWlJkajRUejVET3dIYXEyM2Z2VVo5TTJadTAvS2FXN0VZ?=
 =?utf-8?B?RUMrRk45T3NZZVFtdWc1Nncwcnp2MmZjVjlPSjI1OEc2Rm41U2ZhTjRWOWE2?=
 =?utf-8?B?aWFuYlM1RGhsUWpUNzlXRys2Z25FNTVQYU1oYmdhNU85aCtQSXlBeUpZK2Iw?=
 =?utf-8?B?UmdOalRaOUFwSTU4Zm9kWlZ0NXNacFBCVzU5REttMWRGd0xiQUhpaU9lTlZJ?=
 =?utf-8?B?cE42OFBkNy9xMS9yK0FLMDV1b2kyMGtLNVJucU9qQW9KSm0zUm5nTU9uZGtu?=
 =?utf-8?B?NEVsZFpqOWxkYU5wdlpWcXNKR0NvNmxoWTBNQ3lzaTdTanJKUk9yMWhqZXFP?=
 =?utf-8?B?ckVuRzdTYkpzc0xuRm9abjUwRW90ME1jQ045dmpIT3kxejNNbTg2MFNNRkRj?=
 =?utf-8?B?S2kraE5nNHRzT0toRzljUTA1MXdPQ3BnVjg0N3k5dHppekExVkxYZz09?=
X-Exchange-RoutingPolicyChecked: G7oAOcA5dH7VFp27BxnaOREYQmb8m5AY24kkueijcNXqohm95lh25EkP+QhltLgdk/K6UPqpq6gXIKdCbH3kQ+zIoLvqUb79yvs4T+GrlEckWom7fTHwc6iwGtzA7EOfc6PKfZmVGXHzHdqg4p7277odAdJSvwR1RSxP6rU2rFDeD4rJZ2YjWn0Y631yAXIjp+dHScW/gB/6jUtg9JcCTGOqenO97tvnvaG/B0uBnk92tsOPUJQQaUzN5Mo7poEMKRdBXNsecK/khitSv5emLmRJ0+HwgImE8gWgcKbWaFxEkd5mqaDx2UqrGIyxujK0c5qcQNvjBNH4tQgwYvDs9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b5cdd1-724a-4594-2aba-08deb25d15f7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 08:36:40.5666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ElWyvJD4AkDirdiZNpBUSKwtcSas1AbAVf8a4U/3XyWTOYkBHc37vzmLHzbWmYWO+yd0n+f8yQjaNBIB9Ekk5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6371
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

Hi Swati,

On 5/1/2026 12:39 AM, Swati Sharma wrote:

> Introduce check_dsc_joiner_constraints() to validate minimum pipe
> count, DSC slice requirements, and joiner support for DSC joiner
> scenarios.
>
> Update meson.build to link kms_joiner_helper.c into DSC-related
> tests so the new helper can call igt_is_joiner_supported_by_source().
>
> v2: -Avoid hardcoding min_pipes/min_slices, use enum values (Santhosh)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_dsc_helper.c | 54 ++++++++++++++++++++++++++++++++++++
>   tests/intel/kms_dsc_helper.h |  3 ++
>   tests/meson.build            | 17 ++++++++----
>   3 files changed, 68 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
> index 29b998c2f..63170af1e 100644
> --- a/tests/intel/kms_dsc_helper.c
> +++ b/tests/intel/kms_dsc_helper.c
> @@ -203,3 +203,57 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *outp
>   
>   	return true;
>   }
> +
> +bool check_dsc_joiner_constraints(int drm_fd,
> +                                  igt_output_t *output,
> +                                  int num_pipes,
> +                                  enum joined_pipes type)
> +{
> +	int min_pipes = 0, min_slices = 0;
> +
> +	if (!igt_is_joiner_supported_by_source(drm_fd, type))
> +		return false;
> +
> +	/*
> +	 * For joiner, 2 slices per pipe is used
> +	 * i.e. min_slices = 2 * min_pipes
> +	 */
> +	switch (type) {
> +	case JOINED_PIPES_BIG_JOINER:
> +		min_pipes = JOINED_PIPES_BIG_JOINER;
> +		min_slices = min_pipes * 2;
> +		break;
> +	case JOINED_PIPES_ULTRA_JOINER:
> +		min_pipes = JOINED_PIPES_ULTRA_JOINER;
> +		min_slices = min_pipes * 2;
> +		break;
> +	case JOINED_PIPES_NONE:
> +	case JOINED_PIPES_DEFAULT:
IMHO, since this helper can be potentially called other tests in the 
future, we should not call these as unsupported with DSC.
> +	default:
> +		igt_info("Unsupported joiner type: %s\n",
> +                          igt_get_joined_pipes_name(type));

There seem to be a bunch of indentation and styling issues checkpatch is 
throwing, please fix them.

Thanks and Regards,
Karthik.B.S
> +		return false;
> +	}
> +
> +	if (num_pipes < min_pipes) {
> +		igt_info("%s requires minimum %d pipes\n",
> +			  igt_get_joined_pipes_name(type), min_pipes);
> +		return false;
> +	}
> +
> +	if (igt_get_dsc_sink_max_slice_count(drm_fd, output->name) < min_slices) {
> +		igt_info("Output %s doesn't support minimum %d slice count for %s\n",
> +			  igt_output_name(output), min_slices,
> +			  igt_get_joined_pipes_name(type));
> +		return false;
> +	}
> +
> +	if (!igt_has_force_joiner_debugfs(drm_fd, output->name)) {
> +	    igt_info("Output %s doesn't support force_joiner debugfs for %s\n",
> +		      igt_output_name(output),
> +		      igt_get_joined_pipes_name(type));
> +		return false;
> +	}
> +
> +	return true;
> +}
> diff --git a/tests/intel/kms_dsc_helper.h b/tests/intel/kms_dsc_helper.h
> index ee419c849..e4c970447 100644
> --- a/tests/intel/kms_dsc_helper.h
> +++ b/tests/intel/kms_dsc_helper.h
> @@ -8,6 +8,7 @@
>   
>   #include "igt.h"
>   #include "igt_sysfs.h"
> +#include "kms_joiner_helper.h"
>   #include <errno.h>
>   #include <getopt.h>
>   #include <math.h>
> @@ -39,5 +40,7 @@ void force_dsc_fractional_bpp_enable(int drmfd, igt_output_t *output);
>   void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output);
>   void restore_force_dsc_fractional_bpp_en(void);
>   bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *output);
> +bool check_dsc_joiner_constraints(int drm_fd, igt_output_t *output, int num_pipes,
> +                                  enum joined_pipes type);
>   
>   #endif
> diff --git a/tests/meson.build b/tests/meson.build
> index 60cea3aa8..38a42bda6 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -399,14 +399,19 @@ extra_sources = {
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_sharpness_filter': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dp_linktrain_fallback': [
> -           join_paths ('intel', 'kms_mst_helper.c'),
> -           join_paths ('intel', 'kms_dsc_helper.c') ],
> +          join_paths ('intel', 'kms_mst_helper.c'),
> +          join_paths ('intel', 'kms_dsc_helper.c'),
> +          join_paths ('intel', 'kms_joiner_helper.c') ],
>   	'kms_dp_link_training': [
> -           join_paths ('intel', 'kms_mst_helper.c'),
> -           join_paths ('intel', 'kms_joiner_helper.c') ],
> -	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +          join_paths ('intel', 'kms_mst_helper.c'),
> +          join_paths ('intel', 'kms_joiner_helper.c') ],
> +	'kms_dsc': [
> +          join_paths ('intel', 'kms_dsc_helper.c'),
> +          join_paths ('intel', 'kms_joiner_helper.c') ],
>   	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
> -	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +	'kms_psr2_sf': [
> +          join_paths ('intel', 'kms_dsc_helper.c'),
> +          join_paths ('intel', 'kms_joiner_helper.c') ],
>   }
>   
>   # Extra dependencies used on core and Intel drivers
