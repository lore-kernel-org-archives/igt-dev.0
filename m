Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75CFEFCD63
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 09:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8BF896C7;
	Mon,  9 Mar 2026 09:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVQZl0zk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0443E896C7
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 09:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773048619; x=1804584619;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KTiibnqkfml/5GedYgBeVMY22DOgB8GOHtf31FnQb8E=;
 b=YVQZl0zkMlt9B0LdFRVEYK53BsCUmJCKHISDpTEHYZnF/eRZ9vgqnbBk
 n5JFVuXO3ZF1kJ8fdOybEuLHr/2BrRKXBBg5az1OwPi/ccxdk88NLFSps
 U/UhhrRHaQmdu4MqBMO23otUqGGwoe6XBkznRVZ9hyuWcEmSSfmxJT8Ot
 tdaf0VGn+EwhdscqPBGLntZ+U3yWk+A3Cl/FosgphnA0/+NiBSVauvNXb
 X6R2J51hqBW5wnL/p+6OMFzRAsOZhFV4x3KZs+yqD6cLAL0wArh4X4onN
 v8XDndrUay1vz7vjy2jMM101WEJjYNYfM6N4BWkC6bwMsb+aGHAp5phlZ w==;
X-CSE-ConnectionGUID: hCvcCuc1QGacs4qp/Fimqw==
X-CSE-MsgGUID: g74x+OjXTca8Ym4Rtg2K/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84778262"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="84778262"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:30:18 -0700
X-CSE-ConnectionGUID: ZtBFYguVTEi4CQvEFlBg5g==
X-CSE-MsgGUID: VuggUv4fR2u9HveYv9d1uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="219641382"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:30:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:30:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 02:30:17 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:30:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkbTwdTddHmx4ykYydiXz2CaURHeIopscHN0Vvp9TrwQDkhfacdytAlTQf8KipxmWiXQJfv+7bh3oV0zsd8U76Bt28xMOgyE35wDWClkECRaPj9Pk+/uzXz3a51+cXy7WzEhXyA5lxMQmPB7iF4g2NPd/ncnKG1fionAmlcujwIyBgKCCpnLh2n2FW+96f8G8M6c8IgK5OCOPP7nvfg/MNzRMnbQfho5i1GMSjDOwPqoxjgQJTBtNkCpohCz4sEITGGbdygASEpSN1TjVkD0eZ9yT2LRlfIexplkHLl23FdvWg/6EqIWVL9Nr3WubarikAlIpopGFjU9L7SU8FnTnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGag8gifiaQSRSqMl+SuTqis3eG2CZwRMDokjuKcjtE=;
 b=PYiX3q72jnyha3XNfCbMtuZICLzfy0pwu6fnb8yPVcBTt06zdpNXz/uePKfT27eaoSJQQDqh9s6dV4v1zZyXX5tAYny7sFTYo+fY2TReYHolk6WKPvrYaANcsnUmjpWtJk4HZRDgMbXzQQ9jnN1/58Z+5FNzYIfItJDlyOCGrxWwHpKEevffKWep3fBtTJXkgiioOWgajaXxUehpKGGqen20qyr2jvFsXLfV1K34RIm7eKeIdJXfCexRQV5Yb3tP8OLE61luLpMneF59JBQNKTWlpja08nRdd4SrmnEVQK0rUmW4ec3qhjBrTYEnWSDUEETyu5lGJ3UAw5t9KpNCdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ5PPF44E8B88DF.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::825) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 09:30:10 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 09:30:09 +0000
Message-ID: <64b4bad8-09ff-4c5c-81d8-7d6767f4c472@intel.com>
Date: Mon, 9 Mar 2026 15:00:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,1/6] lib/igt_edid: add EDID serial extraction helpers
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260225212859.876713-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20260225212859.876713-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::16) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SJ5PPF44E8B88DF:EE_
X-MS-Office365-Filtering-Correlation-Id: fb875577-0c35-4f26-5760-08de7dbe7521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: Vkw2cvggNZPzFsIeerUwmguLUo/dVA70lZIlKGQ+OMWuH6u53KxQO+9XhwBspLzWyeJzTSA9X7MiGTlrh1Y0XnOUwpArnh9m0jXj6ugJxbY9cOEQ3CpKsnQIh0vaXuCemdfqI9/Da9T8/4Sa1iJJtRLi3BoYTcYf8+6a3AlOscfDTd7EcqMkUDwvvOzvi5QOecwfnO/7N9PQiV7R+G+atEqfxmcDspH6uYm8I0Qn/R5FlRiAX4RxGNNP/p191Mcha+GsV8TolQy79cQvcGg/LflAs90oSt+v6nooScsVeVM+yc14WDAGwvxin5apqRir9yDBWwu6NOlor65+YB43i4l9Uoa/SUhVE1iiW48OghkRXk5nCXI+pFfaDp2cfntxBnHiYVI/2tR9/kNQtaWwRKShJ09t4iWpyjh2ucI9uHgIf9uJwWOOqW0xWEPjh6abFfVcBispyx8sGuGA83DKBVZ/yYhuOB1W7WBrn14salO4ZXHFvyDVnnL98R9dqE8cqLluWTHcO3UKgl6RETi579Og2JpQvZSmFOd5SJLaituHLws/c9kHB3EIMb2AJpcmG/E0cI6+JYO35pL86o3kb+4ejtoQFleNGYMcN/mwfqH/xWChM6i8AipBi+CheWg9NHwiC0vHHBWd4llOZ6NqJM/qqtho4Xh8ZlotNBtKQcXo2jcxGumZ4itLYnIzJsFkNVL+h+/nNgeyedcX+huZYJlvhO5tOT8ybnd7ieUKUYY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmJBd0JPS05yNGVRbU9mcjh5ZGRZaU9IOUZ3MVM0Qk53OTVwLzRIZ09sNWRp?=
 =?utf-8?B?S3czVGdZdDUyRytrdElRRkQzcDVGMU8zK20rYStSbk1yK2IxZmZkVmdPdmNH?=
 =?utf-8?B?dFJZMGFOTVN0d3FiRWo4UVRkUmltOGhBLzF6UjdLK2FhRnFlOFcyRk8ra293?=
 =?utf-8?B?U3Z2NWovdytDdVdMb1BFUFFYR09xSS9HeXhza0ZVZVRrMzV0UTlGdlJPU0Ny?=
 =?utf-8?B?aTFoS0c4MDhVbVpwRVpBZkQwUFJZbUljeFZRcTAwdGJIUmVKTTRwOEFDbzBo?=
 =?utf-8?B?TWd4Z2pueUhSOFlQOVMzOVVFTms0ck13d05kZFR4Z2dBdUR1ckVlTzZhdWM1?=
 =?utf-8?B?SWh2WUlHT0FoVkRFcFR1alBaREE1NG0zNXAyeWNVd3IrSlR4WG56RzRCeWFs?=
 =?utf-8?B?TjFBSFdPaXNDOXBEb2cwbHpvUlZjZkhaZWVFOTV0Um43VTYveXUweXBWcGhj?=
 =?utf-8?B?ZUpNVWcyN1BPa3R6N3JUM0xaeTdzeEdKR0Z6UHVzY2QzcmJ5MnNKeDFYNS93?=
 =?utf-8?B?NGk4a1ppZkR3YkRuZmdQMXV6SHplVG9FQkVUL3RsVlQwK2trUmpDV2ZsTDFv?=
 =?utf-8?B?aWRzeW53RDBSSjJFYlVseXk1UkNoTmVvSkZNOFNZNS9tbkNHOStrL3dwWWpM?=
 =?utf-8?B?bXREZFNQL0E1QmF4dWY3RkpnelFqK3NPTmx3N29hdFgwSlY4NUI1M1F4M0M2?=
 =?utf-8?B?bTMyWE8xR3BUQUxBb3BYVUtXTjdlcEhoWGRxdDVqaFdJakJmTU5nSU5icXdz?=
 =?utf-8?B?ZkxVR0NjQk9qbzhvV0g3b1BuZnM0QSs0S3ZFSGppRGZ3TDdkTSt6Z1RseTF0?=
 =?utf-8?B?cGozRW0reElmMFFYRjUvV2NUamorSGw1TVdMQmNaWXZjWld6elN5TXk0OFVk?=
 =?utf-8?B?ODRSb2R5RGFycmQyMzNNMnI4c0toTkJwT2hPek9SbURFcjFvemp4dFVJT1pm?=
 =?utf-8?B?M2MxR2k3bDZjQVFhWmVzYzZVL2ZsZDg5aVdKYnBTV3phRi9XQTNZNEUxaW1O?=
 =?utf-8?B?bUxjK010cHUxQjl2Q2x5cnF0T0xSYWQ0UGV4dHlKWFIrUDRpdzZ5OU9kNkxI?=
 =?utf-8?B?WmxkUVh1Nis3MC9kMmRMekhzUDVLdEduT1c4My9WZkJaV0FOa2pSMzVsZkZT?=
 =?utf-8?B?ZVI5bkQ0RWhVS1NtSm9Ud2VOOXhlbk1Eb1BpTDlQbzRSdUcyK1FOL1lsQlRO?=
 =?utf-8?B?MzFoa0h3ZWJYaERtTXZQbXlOR1BqdmpZUERGSnF3dGNtQW5RRVQrSDVaOGJs?=
 =?utf-8?B?S3k5dXZhK1Z4TU1IRFhITmdkMTR4bUVCR0lXY3hLdEt0QTRyV2t5MHlmd0E1?=
 =?utf-8?B?TVNaRmtPQ0VnRHQ4TXQyK1gydVZrcXlVcStYQ3BjL05tSTJOa1hJWENDSFpu?=
 =?utf-8?B?REVhbTJublQxQjEybmtYWkV6ZkppNWNPamhHR3IwNkh3bkNZVWNPTGdzWXY2?=
 =?utf-8?B?WWdMeXpRRGR3cTRISHJQNUI2U1hPS09UZGduOFFveGJpVFFjVkFVaXFDaUdB?=
 =?utf-8?B?TjRiS2duV2pvVlBrTkxDRlFoNGIydy9HTzZKN0tnZExkbVdleFV0Y1h6WUZu?=
 =?utf-8?B?dFB6Y0NkbGNGekJUUWhiamFMZ1AxNlp0b0Q3TUZaMG9iUmxIUVA2MDdLTWNr?=
 =?utf-8?B?bGJkNUlxYU9ZUzk1WVRNOEMrR3JrblVISGRZTTVuSlRldWFPS3NWRlJOVVMx?=
 =?utf-8?B?Mlp2RExESUc1UVFPbUdONmpjS2dzdTh5SjF5OTBaOHBFbkV5ZUJ4bkJoeG8z?=
 =?utf-8?B?Ui8yNWM0TzB0TWJ6U0ZKQXF6dm1kbU1lUFBMMGxjVnBHWWozQURCbjk4YVFR?=
 =?utf-8?B?MlBoRVkyS0hrQ3U0clJVQlh5cys5amFYaTdvVHJDMGZiMXBlM2pxV2RqSzdV?=
 =?utf-8?B?Q3EwdTZab0h6a2lVckd0cXJDU1VOc2lUWFRGZS91VkNDWEQwQlV6VFpxdHdz?=
 =?utf-8?B?V2NvSGxQZ2xrQVBUajMwNnF6UkVRL2EydmpMcU13ZDVpOVdpd0ROWVc2bGNU?=
 =?utf-8?B?bGtuVE5kTTRjWUJHOFQ5RE1PalZweHVaNWh0RVBNNFhYcDFIZmhSd3RBTk9x?=
 =?utf-8?B?b1BEVG9ETHcvekVNZ2ZjTVdMajY2THI0QkJ3NWJST0s5NEplcFE4UmxBcE5i?=
 =?utf-8?B?ZE0vUzI2VnViT2ZVeUtpVmVTckFlbE1FdXplbHBneXpaQW16aDJGQ01qYVJy?=
 =?utf-8?B?N2JlaE41ZnR3OHhQK2hvbGtPeWpJdzM4SVA2N0MyNVVQTEZzcWdWL1RmdFF0?=
 =?utf-8?B?TmFuRnJCb21FOEhORG5NNnFWSVI1T2hyTXlyRm1aZFRESG1RcS9paHZTelFF?=
 =?utf-8?B?N0djLytZbEE3K3RXcUR2T3pYbEVuNXVScmNCVlFZcWFFbzBlTTFKdz09?=
X-Exchange-RoutingPolicyChecked: EuXH7+3ScN6zbCPgYLu+xSicstnKRgUbQ+DUNlVS6CD52K0Jks75W/ArwZ5/rnKxECpiCcVxw7PQQdIEPycgT3B3GqN5tuOmh+dufom8HdUW+chrsIBK4hQXQcOi0mxizCn4/0z4edkYw8AZoYCDVsZ9FMbGIuAuixNfYZWGQSfE9mWyfrKzwmXjTLWVIyC3DzwGAGmSe+iu10h1mL3sEtEtk14Ej1rD82EnSRT2E5pThG+K5eMh0+uqM+KyQGaJDwMiK1540P9OmZr9Xj0mCs/TPHWP5Et6Hz/cyaPTFSOWG21BwYbcymn83z35BqgxqVFOkXJNn5PWjZlBqy3+Lw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fb875577-0c35-4f26-5760-08de7dbe7521
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 09:30:09.9317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6RqF1tFAMcMY+WGDfgtN4TUXMIyM0nvkD/SFyHwgAri3upgofXI1++IhuCffqm/oDjQHQqP6popank6D4x6bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF44E8B88DF
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

On 26-02-2026 02:58, Kunal Joshi wrote:
> Add helpers to extract serial identification from EDID data.
>
>   - edid_get_serial_string(): extract ASCII serial from descriptor 0xFF
>   - edid_get_serial_number(): extract 32-bit serial from EDID header
>   - edid_get_any_serial(): convenience helper that tries ASCII serial
>     first, then falls back to 32-bit header serial formatted as hex
>
> These are needed by the connector helper and USB4 switch test suite
> for EDID-based display verification after dock/undock events.
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_edid.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_edid.h |  5 +++
>   2 files changed, 96 insertions(+)
>
> diff --git a/lib/igt_edid.c b/lib/igt_edid.c
> index c68ccf671..e7fcbf0b9 100644
> --- a/lib/igt_edid.c
> +++ b/lib/igt_edid.c
> @@ -249,6 +249,97 @@ void edid_get_monitor_name(const struct edid *edid, char *name, size_t name_size
>   	name[0] = '\0';
>   }
>   
> +/**
> + * edid_get_serial_string:
> + * @edid: EDID structure
> + * @serial: buffer to write serial string
> + * @serial_size: size of serial buffer; must be > 1
> + *
> + * Extract the serial string from EDID descriptor block type 0xFF.
> + * The descriptor payload is a 13-byte fixed-width field; trailing
> + * whitespace is stripped and the result is NUL-terminated.
> + * @serial is left empty when no 0xFF descriptor is found.
> + */
> +void edid_get_serial_string(const struct edid *edid,
> +			    char *serial, size_t serial_size)
We are trying to get the timings so rather than a generic name 
serial_string, can this be replaced with get_detailed_timings ?
> +{
> +	size_t copy_len, i, n;
> +
> +	igt_assert(edid);
> +	igt_assert(serial);
> +	igt_assert(serial_size > 1);
> +	serial[0] = '\0';
> +
> +	for (i = 0; i < DETAILED_TIMINGS_LEN; i++) {
> +		const uint8_t *d = (const uint8_t *)&edid->detailed_timings[i];
> +
> +		if (d[0] != 0x00 || d[1] != 0x00 || d[2] != 0x00)
> +			continue;
> +
> +		if (d[3] != EDID_DETAIL_MONITOR_SERIAL || d[4] != 0x00)
> +			continue;
> +
> +		/* Descriptor string payload is 13 bytes starting at d[5] */
> +		copy_len = serial_size - 1 < 13 ? serial_size - 1 : 13;
> +		memcpy(serial, &d[5], copy_len);
Can strncpy() be used instead?
> +		serial[copy_len] = '\0';
> +
> +		for (n = strlen(serial);
> +		     n > 0 && isspace((unsigned char)serial[n - 1]); n--)
> +			serial[n - 1] = '\0';
> +
> +		return;
> +	}
> +}
> +
> +/**
> + * edid_get_serial_number:
> + * @edid: EDID structure
> + *
> + * Extract the 32-bit serial number from the EDID base block header
> + * (bytes 12–15, the manufacturer/product section).  This is different
> + * from the ASCII serial string in descriptor block 0xFF.
> + *
> + * Returns: 32-bit serial number (little-endian), 0 if absent.
> + */
> +uint32_t edid_get_serial_number(const struct edid *edid)
> +{
> +	return (uint32_t)edid->serial[0] |
> +	       ((uint32_t)edid->serial[1] << 8) |
> +	       ((uint32_t)edid->serial[2] << 16) |
> +	       ((uint32_t)edid->serial[3] << 24);
> +}
> +
> +/**
> + * edid_get_any_serial:
No description added?

Thanks and Regards,
Arun R Murthy
--------------------
> + * @edid: EDID structure
> + * @serial: buffer to write serial string
> + * @serial_size: size of serial buffer; must be > 1
> + *
> + * Convenience helper that tries to extract a serial identifier from EDID.
> + * First tries the ASCII serial string descriptor (0xFF). If that is empty,
> + * falls back to the 32-bit header serial number formatted as 8-char hex.
> + * If neither source provides a usable serial (no 0xFF descriptor and the
> + * header serial is 0), @serial is left empty.
> + */
> +void edid_get_any_serial(const struct edid *edid,
> +			 char *serial, size_t serial_size)
> +{
> +	uint32_t serial_num;
> +
> +	igt_assert(edid);
> +	igt_assert(serial);
> +	igt_assert(serial_size > 1);
> +
> +	edid_get_serial_string(edid, serial, serial_size);
> +	if (serial[0])
> +		return;
> +
> +	serial_num = edid_get_serial_number(edid);
> +	if (serial_num != 0)
> +		snprintf(serial, serial_size, "%08X", serial_num);
> +}
> +
>   static void edid_set_mfg(struct edid *edid, const char mfg[static 3])
>   {
>   	edid->mfg_id[0] = (mfg[0] - '@') << 2 | (mfg[1] - '@') >> 3;
> diff --git a/lib/igt_edid.h b/lib/igt_edid.h
> index be0ccf529..d9e396065 100644
> --- a/lib/igt_edid.h
> +++ b/lib/igt_edid.h
> @@ -457,5 +457,10 @@ void *dispid_block_tiled(void *ptr,
>   			 int hsize, int vsize,
>   			 const char *topology_id);
>   void edid_get_monitor_name(const struct edid *edid, char *name, size_t name_size);
> +void edid_get_serial_string(const struct edid *edid,
> +			    char *serial, size_t serial_size);
> +uint32_t edid_get_serial_number(const struct edid *edid);
> +void edid_get_any_serial(const struct edid *edid,
> +			 char *serial, size_t serial_size);
>   
>   #endif
