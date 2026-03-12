Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DFFFED2D1
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 05:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE0510E077;
	Thu, 12 Mar 2026 05:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hqE5fhZC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8205010E077
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 05:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773294083; x=1804830083;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=A4Hh8t04LXm6K8UgT5XtxQGW0QNCy3339O9JEDIw0hI=;
 b=hqE5fhZC0Cmf5uvQ1aMrulUDwzACDzWQ/Lppp6/QcQF4FlHfqt8w0bG+
 yognEuIpsiVKEHgLkBHzuFN0hAL5EYt/hqb8Sk/jbxp3YVpGyNa9vbU1E
 2EQ1qXwQuZbYNwG3ABm5qHGn2RftCvhPmyGT5xC0+qkQLynR3KQ5/jlal
 gusQQpPr8SfZXwtTltiIox0pcZjzwBooQivKdXTtyE2PklZVbzm4hTCmG
 FMq7i7xacN/oBHbM+W+v29h6FICK9P80gZDU3keA3zEHYg5Kgr8/llqki
 1GQl2LcTD3/7S6oCLsvGjaox8onuVAU9dI3aEldWvvV8XpmcXdC/Ck2LI g==;
X-CSE-ConnectionGUID: D7snFqgJQuSWNqrFnrWAbQ==
X-CSE-MsgGUID: dIApHCxjSpSUKryCve7aPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="73393471"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="73393471"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 22:41:22 -0700
X-CSE-ConnectionGUID: dMRcfAwkRJaSKeJAWXmCmA==
X-CSE-MsgGUID: 5R5FwKkVSfiLMJYgWh1PTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="216868526"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 22:41:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 22:41:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 22:41:21 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 22:41:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQ2rqGAVYgC1Sp+Pi4yGfUwsNZ6KxtlyRdpU5VF/lfrit7ms9Sp58wqafHvtaYlCgEWwV4GrwgdlFlF1E1pJaVgudXfc+hgHXBVnzkoAq4M8SJVFQ9GGKJCbHeg6G6X4MlqELCWvyKywlgdptcScA40HLs4gM+efhRt/q07zYA2et4N4Sw3j+wihNkTu/RIfSjV82XqbYhe8SU6Kni4dNEHGHSnDUwnKcy/OlOOr840yc0/28YlL+2kjlb8NmSEhd9EkLlvuzbJibSr3J+jAs43PDDFSbOgAfYv3XZlypP20fgs1aiBU5iFJL+MbgGDfV7gRjZfG4ysAmP2q9Wrr7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A48UIMBfZds3OGcrTTY3FaPoHBwsd8xU2bcMyg6/oQs=;
 b=UI27aXTClZgrDSVKH9fmCGez/XTA2gdb4Agbm69lhedFtP7pd5vZeEDoa0B8Na8IEMr7Zp+S2lvlpeVe6AAHHocTeL5RYmkO9P7nLP7qC1mzdkG9sXnk5u2M1ojKGfMDBgtRigStwbhFxpDhQPim/keDpJKYewfFRgcLZtvR+QaXkfYY6bGf38wGDe257dBkcIv6moCmRP/vTcJO27fwI0JSISyBqZMSsBSYAM+pnIxkQi0OKh1wfVZmoFYJYUdSucAmQQNf8ime9dTRfr6RRuOcA2cdQe4H7tF05mNgv4kAqEd6soNzahZhqM4L9mWhLFBWNKP7XUI744voF3wt/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA4PR11MB9179.namprd11.prod.outlook.com (2603:10b6:208:560::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 05:41:19 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 05:41:19 +0000
Message-ID: <03600ab4-6417-44be-a9a0-5f3fbe945f7f@intel.com>
Date: Thu, 12 Mar 2026 11:11:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Blocklist BMG specific modifiers on
 NVL/PTL
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260311120300.577179-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260311120300.577179-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA4PR11MB9179:EE_
X-MS-Office365-Filtering-Correlation-Id: 659c37ac-7f5a-4f25-28be-08de7ff9fbda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8ggWihpxr2OQ+DYTbFWgNZeoar0Y1RyKWLJAkkGl2X9zvO1j9AijvRVZGxaKXUWVjtJNuCtSTuEBflAIxjt8p/dqxEAX8sJRu8bevEbj6n76Uqh2BFXTljo+ROppRAkoiLTCRWivStQmdPRSQvqqmEFSG0fc0bPr17U6nOGADeQ0TKNg0Bk6J05hbY2l38XcL6B41TnSnLOXX8ZvnHvNx7LwBD3TyWuU9aFTMNLvvaempwwCvD3XLjTbdqag6rZeNn+xt7I/wyj28We+KJmZ8K3dZMa4dr6xvHOm1nrS5wc8VXsKwk1dBZHBKNx09T15FWtr4KkGkC2lLMfJtRfDfYh0scmigEUOZ37UnIFa3KFNqnvZfSOt4rdoN5BiGN3r2gO3VZDGFuxpIdLf170rZ2A7yN/8uQnHX6Bel84ue0MXNwIn9Ndev+Hj1Q/tx3zc8oXu40WPnPwB+gjVCNRuRopb2UHZywfLEmE45IO7HYkBx4324LrOwkIXU1782lCqr3rvin3BXlo/uGsZjtLaYEoI5k2qxzsrv89ta8oWWBH6I27Mo2NJLApz7I6srum7H5PRb+UI2ovSc2DbabshC9z0aYJRI5Jg1vAXWv/SAhdgkmXZ6oSeesJKOrmbFmNp1VNfXhhQCTLyZ+IxkMXhj0klGCY92uP0E38VDca6PX7ijvLAU3skQzLZBthoj/zWJMYZTT7ygu4PfZ06YcFAR5XgL8CejFdy9CsddukqpYc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TC9QSFFqMkpTdDdKa3I4NklRR0VNbk1Vblptb25VMENYYTdIZmhvbmptYjNp?=
 =?utf-8?B?OFQ0OWxsNGtmUndTQVIvaFY0QWJiRFZ3TlQ2cDBZVGYxTUljbys4ZmpoV2p5?=
 =?utf-8?B?eWVPSnZtWTJxdVZqVW1va2c2eDkrbm51QlNxSFd6cy9FVXMyL2Y4bnBnNncy?=
 =?utf-8?B?L0tqZ1JZS0YxS2VNUzJ6UVl5V2FFM0RKenFnUFk3bXEyTUhFc2QrdldCQjI4?=
 =?utf-8?B?dm93WmtxK2JkeFpOYk5zVE96L3ZaaFFETGcyUjY2d1E1WnI1ZmJiay9ZL0lK?=
 =?utf-8?B?TUhBQy9Qd0pBM3krUmo1MkxTQko4RFRuZ0xVYVU5UnFRZlordFBlZG01NDdi?=
 =?utf-8?B?YmtaTWFyejFJeWFtanBFUjJpZHVNZXQ4UGhGeHVqUE42N01Fc2pNS01leXIr?=
 =?utf-8?B?ZklYNDBTRk1IRURDbmtITXY1YlJUWWV4ck5HKzdkYjcrSyszQ1RRMUx6N3V2?=
 =?utf-8?B?VUpER0pCbVBQV1htSkgrMHlzT01iU2FpV0hERUZnRm1HRGJaWndRSVhTNkFE?=
 =?utf-8?B?TmNDK2NXMzBBaHY1OTZuU1hEREdLbXpVZElKQithOHNKa2Y1RTJ5TzV6TytO?=
 =?utf-8?B?cGZyMnFDWGdJZ2dxanVXM1k0dWk0Qmgyb0tsTDAwOU5kNkxvZGNRbG9CYnZs?=
 =?utf-8?B?SGJKTXFpc1ltL3BoRWlFN2tHalVKblhEVndBc2lxLzdob29DZWIvbmp5TlpF?=
 =?utf-8?B?anU4aFlCY1k0dlNORTBJSlhLNG1KYjRKQnpWejJ1LzVsL0cwaUpoblljNDkr?=
 =?utf-8?B?WjlabkE0WmpDcDlTT0NxcWxLM3RKZG4rMkl3LzV0cGxRRjkrZGplQXBuOTZk?=
 =?utf-8?B?WVAxTUdCVWFuTkkyNU91Q1FxbEl6TWRzNDRXNVNLMEFHZ2JJd2V2ekRWenpl?=
 =?utf-8?B?cFY3VW1NTG9hcHR5YzY2S0RObHpLdWp0dWU4Zkx4NURMOXZTampmNHpJRXNC?=
 =?utf-8?B?alVPZmFFUHpOMHhaUEpaU290bExtNDlVemdkaEphN0NCKzlraXhsQU40aDJx?=
 =?utf-8?B?NEl1c0l6ZEs2RXhhbnZZMHNuMXJzalp3T3Azblg2SUk4alphb3R2djJodEk0?=
 =?utf-8?B?NkUrUC9TaWxva29jb3lBWVkzcXdyRnpZdk1jRmh6R3B5NTJOdDdwa0xkcURR?=
 =?utf-8?B?eWV3VDdDdzA4RjZRaFA0NXdHaDltQmo4RUVhTXZLeGErdyt0anErZ1RuWTZp?=
 =?utf-8?B?L2xwV2FBWndsYTIvcGVVVXV4QTg3Zmt2ZzViOWp2bHUzTVBETkd0UDFYMVRY?=
 =?utf-8?B?REs5NHFuMXoreWR1bDVCODFVaW9rQkh1Nm9sVk0yMHVCVUV0b0t2aElMclNZ?=
 =?utf-8?B?RkFoVGFqYWxMT3QyMDB2aU1PTFZNdEZSTm1oRGlKUjhvSjhDVnpoTThMbzBs?=
 =?utf-8?B?S0ErQ3QwQkZNUXRaN1RxdTh1c0NySkNBNG50TFlaeTZRRFVRZm5ZOGFoWThR?=
 =?utf-8?B?NHgyTVZCTzZzbkhQTFZYVExmK1lrVi9IdHIvWjZlRmRMb1VpNk82UUgwK0Nq?=
 =?utf-8?B?NkY0bUJJT2Y5THVWRm11K3JGeUhDL3RDUEloMndVWVpkaEM2S0RZMWlWaEY0?=
 =?utf-8?B?QlN1OWtsS2g5STNpWjMxSmZXOWlFK1B0Y3BLM3RlcEg0M05vSitjeEdXUVF6?=
 =?utf-8?B?T0JvaENVQ2JYOUdadmhEN2ZQczg1VEthaFF1Q2t2OTV0MDNkby9XOUdVVUFV?=
 =?utf-8?B?VmFuUEpWN2RIVGpCL2J1UDlMWDI3K09kTi9lRDJJT243UlBkMmZCRmYzcUcr?=
 =?utf-8?B?Q0J0emNhTEVkb1hFYVh4dFZvN1d6eHFnM2RqWTBjQ1RFKzQ4TE5ac0JVRVps?=
 =?utf-8?B?SnJRN2phUjkwdDlNdDRYOTFMSTFiTVByd3cyR1pLM1ZHNW91akt3T2FrZ250?=
 =?utf-8?B?cWpBK3BNeFIzQ2FXeTROSno4SWUrOCtHMGxCMTErSXhlMVJDb3kwNEs3NW1P?=
 =?utf-8?B?QW5XaVFxNEx3RHM2SFY3UVpEMTRJMUNZcDY5akwvdjNHY1QwV0ZxRWN1aXZp?=
 =?utf-8?B?NVpSMmYwUzJOcUFBWHQzNnk3Y2R6RmczSlRpUjNxYklFN2NxRDhBcXFkb1ov?=
 =?utf-8?B?WG8rdGl6cjIweVI2RUdXVFlhSVNTbVc0MG1tYnVGd3l2S2lGbWdLemVyZExY?=
 =?utf-8?B?UFZXOUlvVEJrZjYrVnE0NU5vYThEM0RHa2xxWFd0VG1mekV3MGN5cG9KMDVt?=
 =?utf-8?B?VkNNTW9wcWlYV1gxUlV5ek01SnhjZU1yZmxlUWt0TURncVR0amN6Mml1TW9u?=
 =?utf-8?B?NGw3c1l1aVRHR3hKNHVGU3BwSkFJYnYrWVVUOWxRL2FINDN0b245OC9SWEhF?=
 =?utf-8?B?MEY1dXEyL3Z2TEpNT3c0NEp6c0ZvOTkrcGtXUkIwcFpDQWJDNVU1dz09?=
X-Exchange-RoutingPolicyChecked: e0GfdUBO97s8MNPAQEZt1Lz+D5Ars6bZcVTW6zByG1A/7bCoUPrGC/D/nEu+WjbrHYc5iLThaJ/cJkf2WW2+cfsvIvGgF8K2r2wlxxJ2o6h/T+sjRQYoNuJ0esVGkLHfVQkATkwSOZ0IFGchOso4H/qj+kmI6PzRHrlw/8+hOES88vtMVJzn7jn7Xmca+yg672RdbS3uNZuzuE0vEiQOdPKdKj1mKvS0qF7ogK3wAQ7FW1BCIMaMsQJ8iD4FzrkbCWkvpVsX4A6Nnkyc+4td3uiWqSIOfATWKc9qD+03RaDojB+VBaH8V3/jKSesPCvXkXXMHHYjKTZMcbEJHNxuvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 659c37ac-7f5a-4f25-28be-08de7ff9fbda
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 05:41:19.4440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwNgqiDuzMEwHcZl34NxrAOQdjqMpJXgiZBH3YOmhdVZ/XoT/mhpVxa8EPsQT+4nNr9y2HEqW1QcdDfDP5jtsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9179
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

On 3/11/2026 5:33 PM, Swati Sharma wrote:
> The 4-tiled BMG CCS modifier is not supported on NVL/PTL platforms,
> making these skips expected. Blocklist to avoid CI noise.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel-ci/xe.nvl.display.blocklist.txt | 3 +--
>   tests/intel-ci/xe.ptl.display.blocklist.txt | 7 ++-----
>   2 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-ci/xe.nvl.display.blocklist.txt
> index 15ad4345a..814e79928 100644
> --- a/tests/intel-ci/xe.nvl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
> @@ -63,8 +63,7 @@ igt@kms_scaling_modes@scaling-mode-none
>   igt@kms_ccs@.*-dg2-.*
>   igt@kms_ccs@.*-mtl-.*
>   igt@kms_flip_scaled_crc@.*dg2rcccs.*
> -igt@kms_ccs@.*4-tiled-bmg-ccs
> -igt@kms_plane@pixel-format.*(mtl|dg2).*
> +igt@kms_plane@pixel-format.*(mtl|dg2|bmg).*
>   ##############################################################################
>   # Valid skip: Valid for display ver < 13
>   ##############################################################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index aaf7eb1ef..9b192d67c 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -67,12 +67,12 @@ igt@kms_writeback@.*
>   ##############################################################################
>   igt@kms_scaling_modes@scaling-mode-none
>   ##############################################################################
> -# Valid skip: DG2 & MTL specific
> +# Valid skip: DG2 & MTL & BMG specific
>   ##############################################################################
>   igt@kms_ccs@.*-dg2-.*
>   igt@kms_ccs@.*-mtl-.*
>   igt@kms_flip_scaled_crc@.*dg2rcccs.*
> -igt@kms_plane@pixel-format.*(mtl|dg2).*
> +igt@kms_plane@pixel-format.*(mtl|dg2|bmg).*
>   ##############################################################################
>   # Valid skip: Valid for display ver < 13
>   ##############################################################################
> @@ -123,9 +123,6 @@ igt@kms_bw@linear-tiling-.*-display.*
>   ##############################################################################
>   igt@kms_getfb@getfb2-accept-ccs
>   ##############################################################################
> -# BMG modifiers are valid skips for PTL
> -##############################################################################
> -igt@kms_ccs@.*4-tiled-bmg-ccs

This is removed and not added anywhere above. May be can be clubbed 
under the one section "DG2/MTL/BMG"?

Thanks and Regards,
Karthik.B.S
>   ##############################################################################
>   # Expected fail on current CI config
>   ##############################################################################
