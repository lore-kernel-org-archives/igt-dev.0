Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6540CA5FD2
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 10:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3960A10E11D;
	Thu,  1 Oct 2026 10:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N83zOwBy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF46C10E11D
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 10:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790852047; x=1822388047;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QOevYFSOJrmhMUVJ0Ixlbz4nZAeffZlYC2hBEouJGh8=;
 b=N83zOwByCrYycCgM7reYMWgPnC8H/oNHBNz5LgyOdv1NWHKBgaM0i3NO
 LEfBYuBwJen0lz8hro00O9h6x2essG5hlaoOcvesOuAhp30EgAYmMulpb
 5eYKtuueRAWlAIc+2mdCXMTato645UfGDWd/JJai9zjKtPfiEd63Jasac
 XrlTp+hEViyQ/rvbeacJzIKRbS2DcMn1ZfbcDuRoFK6VaqMTrgznbJ5wd
 j5tCeE3MawCA2/mc9y6xqG03XZNWcvcNO2IXcjxYHOw5F0I5LIBZoTQcz
 hGJMKFWmOlxpNKHbq015NT1ZUTrwvRqY+Do/f2x5bE0CwI/7A9lkJk4q0 g==;
X-CSE-ConnectionGUID: 8plEvtuGSKCs6JXbKicApQ==
X-CSE-MsgGUID: cxDV9knQSyya5rVbTktxPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="113391404"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="113391404"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 03:54:07 -0700
X-CSE-ConnectionGUID: CDLZfTxMT12m/OaARStGkw==
X-CSE-MsgGUID: 5zIj8uwzQxaQVqEvG3HPzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="275082378"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 03:54:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 03:54:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 03:54:06 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 03:54:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgJt4bE90TviswdFuqXryWQky3ARxFW4x+ilH5lTCje7T/ILXDLTv8jXSeeXc6+QKAhg8joxZ3D6+pgXgKFzFYFhpHX9/xLzMTpZtZCxdkaSb2t0cs7JUsWPBr9wiunZjiqO5DIYwTDzzZ7SFGhdSmHyJQ//MH//L9WXgVUyuyT70m1m1P+ltcRF3iETKvtXQMbuinpcjUKkg4+ocRQ3xSK58PwtVhMg9otR7SrzflJBNlW7zplyiw5I4pgDEk3F/HoiZAjzoddFxHCq7KJyV4h9AJXG6wdS3pgCF7P/8hcX08wM0MpwdQApV5StdUthUGuDTEm05viX9FljZPbiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4eXdeTaAYFsbnccG5sQq5R+VlEoxSxN6pBIRdVz16M=;
 b=MY6SeG/tMrULT+gUwxtuk4MLfHR48Efnari//tG/tRfuPO6IH/SY77BKoZsr20obWRlzkQe4Ptqf064P9P36VInLYcvCfwOmXYodD9jbyr8zZ8FkdIstEAU8tOHXNFQDk/MAkQxW+/9dx1S8bUPe3uh3YH89aclfRRbzxmjzdRXoTQCMVvG84YiS+Agtd39u1N1sstH7Nqlt6XRKw4sc3tq+FMZx5CBdRYXttgtYMCNHrGe/utyboFYXTAE5jXp2rZYyW8V7J/wjx57Akji2PR9ZxClvfOxQ71O2EvCmw6Y4sQZT8qppgnLQ1glDUbdpcgzcIqjQs0/CY9PZPKl58w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CY5PR11MB6260.namprd11.prod.outlook.com (2603:10b6:930:23::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Thu, 1 Oct
 2026 10:53:59 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 10:53:59 +0000
Message-ID: <38ab3aa9-48e8-4493-acb2-5c7b4de5e7a4@intel.com>
Date: Thu, 1 Oct 2026 16:23:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4] tests/intel/xe_ras: Add test for GPU health
 indicator
To: "Tauro, Riana" <riana.tauro@intel.com>, Soham Purkait
 <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>,
 <badal.nilawar@intel.com>, <kamil.konieczny@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>
CC: <anshuman.gupta@intel.com>, <jari.tahvanainen@intel.com>,
 <ramadevi.gandi@intel.com>
References: <20260915133234.2105121-2-soham.purkait@intel.com>
 <d8bf0a2d-c814-4642-a232-b39bdf9b9b8a@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <d8bf0a2d-c814-4642-a232-b39bdf9b9b8a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::10) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CY5PR11MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c20e3a9-d174-4dd4-e0ba-08df1faa4be1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|4143699003|6133799003|22082099003|18002099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: cweZG7mVQHtdKbvYoi26AoRHoxA5fCp049u+ktYSyztaJU6VAW1N4+HBrWShbQ43drKxkhrdjee5udcGZkSQkmJQi6TPHRYT6rEtsAW9m0fWPf6QaY6lOLPXOuphsse68A2ojCjl5qrG1gBmefCEL6DCNzwVkD8/2oy+uYMruQea7hHIFV/3pnGdsoJkMXJdvxgjPZNFYk5o3OVBkrMIyiK+rZj4vuaHbJ6VnLzWFDhBrdKgjjBNaXisBrEqcGauORsEGxsZrjSc5kNxEFwR5jMufUpjo68ofn2uqjmcO61HNTgYxiBcdxxDIMhUg0yedodyhNKmHSGw4QxSGVHVYkIDzJ2Ut1AvIdUYrG755oa5i16CP/+qjBP6tM+dSVUntYPNCrM9ZWi4ARxkk/uOk9Je0eoz3BSTHLziDVw4YjzXZzCHBxJs3/UKMYYCFaga4FpwZZxY2oDuhplrI1gu7kWAst9Upsur5kn7FQ32jVdvtp2P4X7FCPAdGuaiWCZ3FZzuQETEqyiJxWCxWonTZ1rTYgXmcG1lNvEQI5ohdtPGxem5BOebFt8zOuTqkk8xGLXF92YoEKNQeaqIABHllIXWGzi59lHZ9o2dEGV80B3kEJ8IrXffFTrVMeKTaV1j9v5yUd0uGs7lrtemjg9SXIpCRP95ydxIOYEVFLrnPi4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFFXU3NYcVJKQW9tOHlXaE5KVHNKVlY2TDFQdWFoL0M0VHdOVy85TWUxak9x?=
 =?utf-8?B?ZDhHNUY5TTlDU3BUM3JYNXNKeDdyWWluVjRvWjdFUGNJYy9EQy8ybDlIUWxB?=
 =?utf-8?B?ZS9kWTFneUdvL1VrVHFOWTlXTTREYWhReStrSFZ5M2ZadG96MTVUQk1iZzdW?=
 =?utf-8?B?NnVkQlNncEhDd2tOR1NxeHJnUHBWQlR2aFJwVjFYTTYxTnQrdkZ6RkFuQzRM?=
 =?utf-8?B?L2Jqc1dkL1oyejJSZy9WeDBPSUxPcTBSODg1R0pvMXozWTVKVS9VK1Q1bXRE?=
 =?utf-8?B?VHpVbHFQUU5MTnNRbTBpQS9iTXhNbFY1K2pHMlUzT3RuRlpZcC9lc1U4SEdj?=
 =?utf-8?B?SmVvd0NBU2s0L2FHSDQ4Tmg5RlhOYXJwZU1KWUwySVZlbTBVVGpjNngrRDR4?=
 =?utf-8?B?TlNwN0tSODV6ejFxWm9qazZGWDhUczBVdHZZUW91THdXeFpJVDFOdE9oMWs2?=
 =?utf-8?B?cXF3SS9jOVlOajF4TkdVMmtXNkdCazFyd3VUSU9HamhwSW9VSkxlbndVS0hi?=
 =?utf-8?B?d3BsazhMMnV0TGdiZ0FLSXk3RXhnbGFvUE1XbGhRNEpJdHNOZlQyc3hpdDg5?=
 =?utf-8?B?ZmdNZmFpM2JJeWxFRWsxTmRGWGI4dlJNdlA1TENldUpmb2h1NXVDUnBwM2M2?=
 =?utf-8?B?bE5HcStxeU54aUlYc1BORVcrQTlCVm02Sm4yOG9YYWJuK3BaM25LRTlxbVg0?=
 =?utf-8?B?YXVVbFVITW1sNUZvKzV1aVZIT05kVldlbFk2dGp1aGRLNzJxdHprZVpDMU4w?=
 =?utf-8?B?ampwK29UUENVbHFVKys0Q2ozVEduOG9LQ2FET2dLMWdCWFExZ2x3dzBkSDlN?=
 =?utf-8?B?cjdyaGJLM3lzc05CNHRXMmlFTXNlWnZlNjRmT25HR0hjT1lUTUdNRkJ2UWhH?=
 =?utf-8?B?ekJxc3hhcmhHb0pQUVNMOFlTQ3prQjZEMm5YVjZOSVFGOVZHNXZob2dmVnY5?=
 =?utf-8?B?Zlo2RUpQVmFhUTZBL1VEU3pOS1lTT0lPYmlab3FIL3Y1QjBLZ0lLc0FBa2NC?=
 =?utf-8?B?VDIrdEs4QWJvU1RTWm0wZHo0L2V3TkIrWm1IWUR5MDV6bHVRaHF1aitIeHJm?=
 =?utf-8?B?U2JBWmYzWi9BZFdhMUk5ZU04K3NDQ3dWOTJvNzM0QkJ6OWo3L0svdzZsWEhp?=
 =?utf-8?B?TzhST3cxR3lXVjJ3QjlrM1MzU2N2YWpSbDQrVG56enJCNmNZZmNEcGJzM1FB?=
 =?utf-8?B?ZE9sYVRhbmxtQlhZcms1cWtYTnpxM1VIZitNb242YjFMaHYxMmUzZEc3YmpU?=
 =?utf-8?B?bEQ2bnFjbmdrTFRWU2Ewd2UxRXFRTTlQSkhGUmIrTE5VWHJhaFVzcCtYTU9a?=
 =?utf-8?B?VzNBUEVrTTN6NWJlWHljT3ZVSjU3ODUvZU41TWhTOXdVWkRtbU9SeCtVQUNs?=
 =?utf-8?B?NWMvdnUrb0ZFS1YvODdISTFmZTk3SGdrNnRYVkMrbG56cUZxaW5nUUZZOXFH?=
 =?utf-8?B?eWFESjRsUjltV3dDUDE3WDRHZzVDalVHYnRtY2o4S0hBaWtLN2hVb0EvYVZ2?=
 =?utf-8?B?Tlk5NHV6MXk2Z0ZnblRmY1huM2RzWmFuL2p0b0l4S0VVZVRUNGhrQ3oybzZp?=
 =?utf-8?B?VUpZOGp2Mml1TmlvbG02bkZhdlFsQU1MMTZhYTVmZXVGMytsb0tDb0JyTTdP?=
 =?utf-8?B?SmlpVXVORVg2NGJzSkVFRXMwODlqR1Y3aWorMFdKMnFzVHNBQWw0Qm1kQkRF?=
 =?utf-8?B?RTAxeVdxNjZqVUI5TkkxUTNkdExIWHZBOVdvZVU2bWIwVGpWekc3cjNra3Zm?=
 =?utf-8?B?VEJ2SjNXVlF5N1JHWDlodDJxcVQ5ZUppcTdjZWtiZEVETzZTeWlOa1ZIUmxP?=
 =?utf-8?B?QmF1VGVJdnV3QlIySEJYdHk5R3diVnZhV2U1M3FIQndCL3NIZ2JrZ3U4OHBk?=
 =?utf-8?B?cFZzbk1xdHFhS1lSUnVnb0ZJdE9aRU1pMVV1OUI4NUkrT1QvTExCQ3BBYlFZ?=
 =?utf-8?B?SkVPM3h1Ym81bm9yTzQ3azJUangzeEJDUTh1MklzTmorRncyd2ZMMTB3bG5i?=
 =?utf-8?B?elNOMHFBNnFJTTZwSEc5YS9Qd1F0YmhlR1dCYURTSlVzZ0pSOEEvOWRmcTFW?=
 =?utf-8?B?L3ZzWGFhTjh6WndxbjlSaHN0emFxdy9hODQ5K25xblFpT2pnaHlIVDZGeFNt?=
 =?utf-8?B?bGFuOTJ0NDJYQUlBRzZKRjJJTUtiMWRZb1l5OSt2TVlxanJ2VTlvUExQd3cz?=
 =?utf-8?B?QXlhWlpuVnJUOVBTWWhKVDZkT0Fkdk1ZVjJ3RTFMSVVuUmVrQjdCS05HZkR3?=
 =?utf-8?B?aGlHMVF6SzJmdGNVT2pSdU1SRkdUWUFVd2RjL2VYUE9oWW5QQm5lK2pXZkdt?=
 =?utf-8?B?MHFGTWd3WWlTS01WY09JQUk0MzZtRlhDWk1oWTd6RElqVlBWaGRMdz09?=
X-Exchange-RoutingPolicyChecked: HPx0MBr7umJSfZ/qRyPlEbrbi9f03wQHBhLOcE7WEwmYmijQLuxUPYXGcGpdIfgPEG+rK1uX0PArLHS3AseTR1c0lQD/mztki3redkjIHtwKT9cAbVRaNEht00fGoIXNnaLJ0CCOB68dXRZjU1v1EUDFZiMbYdW71isCAzc9/Crd6Dh6kF5F4kbCu98kQj63y4LFsg2ggXNWglYfglClXAuA3RjmsnHg7kh+xFjZI/O88GVPBD2QdYTB67egNe8iFOvpfYjuTrNbtTTNt/XujrucBg0ziPsKSPYM/8Od6IBNrh3tw2t5VZqYHl87S/LXrDh5jiD6mn5HzmSCcCXncg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c20e3a9-d174-4dd4-e0ba-08df1faa4be1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 10:53:59.1902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +nQ65BxIgh1WIKuVvWtCZD21RBddGzuVoA62272WVvv0YMXtsPzPULNwtpKdHsO7f5AZjbV0o1voY84DCgLmRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6260
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


On 30-09-2026 10:21, Tauro, Riana wrote:
>
> On 15-09-2026 19:02, Soham Purkait wrote:
>> Add a new Xe RAS test exercising the gpu_health sysfs attribute
>> exposed by the Xe driver on platforms that provide the system
>> controller. The attribute reports and allows updating the GPU
>> health state.
>>
>> The gpu-health subtest validates each valid state by writing it
>> and reading the value back, and checks that invalid writes are
>> rejected with -EINVAL, guarding against regressions in the
>> implementation.
>>
>> v1:
>>   - Add platform-conditional skip and exit handler. (Anirban)
>>
>> v2:
>>   - Add dynamic subtests for each case. (Riana)
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> Reviewed-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/xe_ras.c | 146 +++++++++++++++++++++++++++++++++++++++++++
>>   tests/meson.build    |   1 +
>>   2 files changed, 147 insertions(+)
>>   create mode 100644 tests/intel/xe_ras.c
>>
>> diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
>> new file mode 100644
>> index 000000000..91233e72f
>> --- /dev/null
>> +++ b/tests/intel/xe_ras.c
>> @@ -0,0 +1,146 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <errno.h>
>> +#include <string.h>
>> +#include <unistd.h>
>> +
>> +#include "igt.h"
>> +#include "igt_sysfs.h"
>> +
>> +/**
>> + * TEST: Test Xe RAS (Reliability, Availability, Serviceability) 
>> functionality
>> + * Category: Core
>> + * Mega feature: RAS
>> + * Sub-category: RAS tests
>> + * Functionality: ras
>> + * Test category: Functional tests
>> + *
>> + * SUBTEST: gpu-health
>> + * Description: Verify the gpu_health sysfs attribute accepts each 
>> valid
>> + *        state (ok/warning/critical) and rejects invalid writes
>> + *        with -EINVAL.
> Provide a brief description. Don't we need description for each subtest.
>
> ++Karthik for Category check
category looks fine.

cc: Jari, Rama
>
>> + */
>> +
>> +IGT_TEST_DESCRIPTION("Tests for Xe RAS");
>> +
>> +#define GPU_HEALTH_ATTR    "device/gpu_health"
>> +
>> +static const char * const gpu_health_states[] = {
>> +    "ok",
>> +    "warning",
>> +    "critical",
>> +    "bogus",
> invalid?
>> +};
>> +
>> +#define GPU_HEALTH_VALID_STATE_COUNT (ARRAY_SIZE(gpu_health_states) 
>> - 1)
>> +
>> +static struct {
>> +    int sys_fd;
>> +    char *orig_health;
>> +} gpu_health_ctx = { .sys_fd = -1 };
>> +
>> +static void restore_gpu_health(int sig)
>> +{
>> +    if (gpu_health_ctx.sys_fd < 0)
>> +        return;
>> +
>> +    if (gpu_health_ctx.orig_health)
>> +        igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, 
>> gpu_health_ctx.orig_health);
>> +    close(gpu_health_ctx.sys_fd);
>> +    gpu_health_ctx.sys_fd = -1;
>> +    if (sig)
>> +        return;
> Why?
>> +    igt_info("Restored initial gpu_health to '%s'\n", 
>> gpu_health_ctx.orig_health);
>> +    free(gpu_health_ctx.orig_health);
>> +    gpu_health_ctx.orig_health = NULL;
>> +}
>> +
>> +static bool valid_gpu_health(const char *s)
>> +{
>> +    int i;
>> +
>> +    if (!s)
>> +        return false;
>> +
>> +    for (i = 0; i < GPU_HEALTH_VALID_STATE_COUNT; i++)
>> +        if (!strcmp(s, gpu_health_states[i]))
>> +            return true;
>> +
>> +    return false;
>> +}
>> +
>> +static void setup_gpu_health(int xe)
>> +{
>> +    gpu_health_ctx.sys_fd = igt_sysfs_open(xe);
>> +    igt_assert(gpu_health_ctx.sys_fd >= 0);
>> +
>> +    igt_skip_on_f(!igt_sysfs_has_attr(gpu_health_ctx.sys_fd, 
>> GPU_HEALTH_ATTR),
>> +              "gpu_health sysfs attribute not exposed by driver\n");
>> +
>> +    gpu_health_ctx.orig_health = 
>> igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
>> +    igt_assert_f(valid_gpu_health(gpu_health_ctx.orig_health),
>> +             "Unexpected initial gpu_health value: '%s'\n",
>> +             gpu_health_ctx.orig_health);
>> +    igt_info("Initial gpu_health: %s\n", gpu_health_ctx.orig_health);
>> +}
>> +
>> +static void test_gpu_health_state(const char *state)
>> +{
>> +    char *health;
>> +    int ret;
>> +
>> +    if (!valid_gpu_health(state)) {
>> +        ret = igt_sysfs_write(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR,
>> +                      state, strlen(state));
>> +        igt_assert_f(ret == -EINVAL,
>> +                 "Write of invalid value to %s returned %d, expected 
>> -EINVAL\n",
>> +                 GPU_HEALTH_ATTR, ret);
>> +        return;
>> +    }
>> +
>> +    igt_info("Setting gpu_health to '%s'\n", state);
>> +
>> +    igt_assert_f(igt_sysfs_set(gpu_health_ctx.sys_fd, 
>> GPU_HEALTH_ATTR, state),
>> +             "Failed to write '%s' to %s\n",
>> +             state, GPU_HEALTH_ATTR);
>> +
>> +    health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
>> +    igt_assert(health);
>> +    igt_assert_f(!strcmp(health, state),
>> +             "gpu_health readback mismatch: wrote '%s', read '%s'\n",
>> +             state, health);
>> +    igt_info("Verified gpu_health state readback for '%s' 
>> successfully\n",
>> +         state);
>> +    free(health);
>> +}
>> +
>> +int igt_main()
>> +{
>> +    int xe;
>> +    int state;
>> +
>> +    igt_fixture() {
>> +        xe = drm_open_driver(DRIVER_XE);
>> +        igt_install_exit_handler(restore_gpu_health);
> This should be inside igt_subtest
>> +    }
>> +
>> +    igt_subtest_with_dynamic("gpu-health") {
>> +        setup_gpu_health(xe);
>> +
>> +        for (state = 0; state < ARRAY_SIZE(gpu_health_states); 
>> state++) {
>> +            igt_dynamic_f("%s",
>> + valid_gpu_health(gpu_health_states[state]) ?
>> +                      gpu_health_states[state] : "invalid-input") {
>
> Why do we need valid check here?. This is anyway done in test_gpu_health
>
> Thanks
> Riana
>
>> + test_gpu_health_state(gpu_health_states[state]);
>> +            }
>> +        }
>> +
>> +        restore_gpu_health(0);
>> +    }
>> +
>> +    igt_fixture()
>> +        drm_close_driver(xe);
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 1ac89bab7..3c2d4fdda 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -333,6 +333,7 @@ intel_xe_progs = [
>>       'xe_prime_self_import',
>>       'xe_pxp',
>>       'xe_query',
>> +    'xe_ras',
>>       'xe_render_copy',
>>       'xe_vm',
>>       'xe_userptr_pressure',
