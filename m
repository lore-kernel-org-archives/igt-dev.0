Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD17DFC6172
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 23:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7816D10E095;
	Fri, 13 Sep 2024 23:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCsSRKuq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3341910E095
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 23:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726270374; x=1757806374;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nwVMgFqMBTqF3wH0mEmpsbQ3hD5OSr6r5QQQrQGKGFg=;
 b=cCsSRKuqjmgTt6UhJLHqtnyY0T964nN55w7mOQR/KjesXmZMShRbB0uj
 vSI0HufOlh8pWRDsHsc4Mu3PARzcISJNxBQt1CTk09O4dApjLJmr1gJ7W
 6u+nk6bC+aSdaiHTf7NBSeW7itaDEBIs1o7OhYAG3GYFrIZDQ02aa1M9v
 kyeO10Sb9sM19bRo3dGOxrfyObC5ajTTr5552NolqvR3xFvSkYz+TPM9c
 GZMq0DBVYuJ1yqmoiH2uWZFSw7BioqBSwqnhRSGPmLbuv/KZ1UipKEwec
 bZAblRCKJe16AlwCmcvYdMd5J98BH7z3+EjcbiMV+OnOtYd6oz8vcc6jZ g==;
X-CSE-ConnectionGUID: /Zw/skqxTvy1S+YeU9yt+g==
X-CSE-MsgGUID: WHIt3MHxTiGGsqg0UDV/Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="13520978"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="13520978"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 16:32:54 -0700
X-CSE-ConnectionGUID: u6cn9Pn2TW+aLfiBWey5GQ==
X-CSE-MsgGUID: 027zxs89RkCI8kgaxvkpBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="99090564"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 16:32:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 16:32:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 16:32:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 16:32:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hp4rz3sVVxvay3rYbc3z5rG5dQs4LxAgaAQZ1nHCL6L6xs0y+wu04joSDMNBgrJyZVU6hc3j5QkaSAPhHlktqtNIw5ADjfCoRe6RLBkZjhG1wwRCcaesVAhcRiV4yOZz7pZ26qqngRHrKa6A+W7piRY/i2eUV/zPNd4YE8Lcl1RnEqvfSnc3ypUBX/SweZ7DBtYMYnD+IzY77Uk83lzPyUUaUvGeXNlzn5tXC+cGmJqzZHxPcL8TUB/uPhelPEBAKzZH3B09s0tionK3UbVZWi0lTuGPooB1KQkPeYFSojPcNl+aDOwEyGlyESy9YbUUtEeMsg5LYaXZ4xs4Q2J5+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMOkdmeH0GXampNhVB+CL1bDVrQFEpgbcbdEr56IZVo=;
 b=uNAu4Fmy+0ci/pPytObmed+KudLtUrvQ5KdWYeNwq/dpWInVqXgaLIM8tY8K5Qeo5I7qDVrLroLS6qhL0uScBS4LRDO/U6z7D1RMnKCFlD5F40q59eECJS6tBJwZnGtFtCBTt1cwEFgFpUQ5g+P5FNPChYLeH9R30tWi+QxTpGeUpv3l9eWxVoZ8V0TV2dhVlADVO7CliYLXsJiQPFSG0DUq+oJE8MVyU8QENWzm21nGVi1PGwlpTPM56JJ+spFTeZZdsKi4D9SU/FUu/L4HuHUwkcPBv8bF2mrBCZ6aQKbgv9AnC4F/p/ok+4u3AzjJ5uj7VQ743Rk7Jc0G2derLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6227.namprd11.prod.outlook.com (2603:10b6:a03:45a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Fri, 13 Sep
 2024 23:32:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 23:32:50 +0000
Date: Fri, 13 Sep 2024 18:32:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Bommu, Krishnaiah"
 <krishnaiah.bommu@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_kmod: Rewrite xe unload logic
Message-ID: <3xowxymv3vmgkinowgfjowzufy5g4wxkmnahg6uaeuppq522qt@bbu4cgikvtmb>
References: <20240913221555.569699-1-lucas.demarchi@intel.com>
 <CH0PR11MB5444D08AEF41B953365B6011E5652@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444D08AEF41B953365B6011E5652@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0227.namprd04.prod.outlook.com
 (2603:10b6:303:87::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: b787230d-56e7-46a6-5e62-08dcd44c6177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9Y21b14OvKFT49T33PKQ55wzxFDXMWKAULAi1IOzZsFsfKWKB9RBSt+yTTdj?=
 =?us-ascii?Q?tU2sU37W8E9cLvzYwhJYFi1AMP/LMtpnqS9twoFnvcbxMgkSQyWA5x1ZRkDv?=
 =?us-ascii?Q?9tzLRRPnnyDJ0eGJMlB8yTX3fbI5XDcZ1g5dGcwoXzcaYYvw5W51ARM2lgOZ?=
 =?us-ascii?Q?nddEwksEFhuF1w0Mkvv3ZMBAmenYzwM/78sVBceZ9QutSB4D2/+qPCXRAtTT?=
 =?us-ascii?Q?Ge5MIcOKbGE+F2ZBb/ZJ0QSHZgut1/LGF68j8X8panko3O54gXEryFxiZ1bV?=
 =?us-ascii?Q?bF/Vm9rSn3DPGG650y3iXDJoGdyu9/nXkgTIPsu/jum3Mc5XdnmRYYBQGyLa?=
 =?us-ascii?Q?4SUFC31SqW5cStaK4xaN2Mea80RtUKDkZts4xRVcpzPTUmXQcJXDjVitk2Xx?=
 =?us-ascii?Q?9YysHKFtH04Xrv3GkaoTpr6BuS2xjtkW5Hq/aJcFKTN9K311/25yz4+0u5Nu?=
 =?us-ascii?Q?ZQOXaeVU9oHPaVwwxd7g7p5SmGxZcEqfhpJttt2eYE8/EM62meQiHTgB2xIT?=
 =?us-ascii?Q?JR5UW0CW2T9UOc2+XRfzPQQ+x2hM2A4KCIprYPBI0+Qwp7LXd60HMnjEIJBk?=
 =?us-ascii?Q?t61z4kSgfxCwjhdRaXQKLrbcsOXOCJHUjQKnWbqdaLHPQJcwIha1QXsFNkGc?=
 =?us-ascii?Q?6/DbV4hxRacf8TNxhp6SZQyD97oTNca0WbwnXjpbBwmTc7qI68IkA+8/BrJI?=
 =?us-ascii?Q?JF/3dOSegHBDdR9+dkHGPKogGDPmLlQhTnJEBmDLWQUvB1YtKBxqZyBLmbZn?=
 =?us-ascii?Q?d0IB8Cj4fBRsLPzdHrdL77FuUr9AOqpI/0DbIw6tdSc8UarPhNmg5SKvlDa+?=
 =?us-ascii?Q?c7qrU4A6EJGS36EaBj3alirOV+e6P4ANwxZ2Q36wzT6b2h4o/23DXMNcBXry?=
 =?us-ascii?Q?2+YerT8pm4bIdaglY+H8QfoGHLduqlhGjatk8OLDsRa+WGH+76AjM4ccLgVp?=
 =?us-ascii?Q?UPjvnkoqkXKg+boPTV/Kg9EHwUuEfJJxdAB/lvyv7clK+NvsCYtabDISvJiH?=
 =?us-ascii?Q?FrBmxFOTz9hgbszL9xX5CdDI+eW1FPGQ5/GJ+Mf02PcUkQDycfPHbxuwipQh?=
 =?us-ascii?Q?0dB1mcLogJpbVaf0hY54dqAZxzKLLmIzM/MHJYgt54h2X8AZ89FFM/qcCQXs?=
 =?us-ascii?Q?ZBz5DfyK0wgKjhRQOoj5Wo5fWopmMZp8hdH9CAQI5bDV5dDuO47GhhHCCJuF?=
 =?us-ascii?Q?QWPHQmcuJ0TqbaX2lmXm0EO8EUu82ws9VrJ9MffRncfsNai9/CF6kb0pToGj?=
 =?us-ascii?Q?IStuufo+TWE7JrCtgcNEY1SJXN18AIrtgwTiFIziGkHaSfloQKujF3heV+dX?=
 =?us-ascii?Q?AgU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xWjgwj5e0vb0f/98MeyMrjYyNt7t9VGdX8g+jdLsKDVpfC74SjMj1ESqnLTO?=
 =?us-ascii?Q?/00mXVNAOUeFzapPwnVLSHWjYRaevnNidG52RQwteKfCva6yLo7Xsyxqj6jN?=
 =?us-ascii?Q?0mOcmPYip5c7jmMQEup+FGzBGnEePbMRy2jp2iAlbOe3fGC4/u+1BhYwB/nG?=
 =?us-ascii?Q?2pJNuHWaXBUL1eMV2mR/u2cNKIy1itt0g+7Rks/D1HyK1WMg+QsYHJPcLGY5?=
 =?us-ascii?Q?SMp8r/DNXBYmkboAh94KMt77YaNMPZ6IeumSCr0Tqj7XGilWYyUCOJb33aGK?=
 =?us-ascii?Q?RDB971/4UHsJB1lcsQgzwfFVOp6/EBIIkF77yT/vZFuAfn9grS17/LCGdFZq?=
 =?us-ascii?Q?4N2ltzS34tjpS3T7573KQ+bvG1+zae2f3axCChgiHQ7JMJ3uEKFhuwt+RKY0?=
 =?us-ascii?Q?CEKLh8X2JqKuM3tnELfMoOC+N5MneotJm92TyWcP/7UsgGgP+e2HUxR81l4m?=
 =?us-ascii?Q?25EhqBQBUpN+AqxBQ4U3GGVUMVOw7+jVAQle5SsGniH7Oa70J+icIsFE7F84?=
 =?us-ascii?Q?uXTeY6A72fwCEuIrPlvn9p502baD/JIFd7sXrudoAFL42Q1BLnSaR8fxIdll?=
 =?us-ascii?Q?NwC7u6niTwZNgOCL18TUf+ytwGlUgdzzSOEpJKe7mDnCYXJin5EjUI/TBeN/?=
 =?us-ascii?Q?66Uh+t9uVQkpqW/21Ru4Z3+QK+7CsMl7ShohdyxDbxfQcgrMKa5D5qBkFpNA?=
 =?us-ascii?Q?dw5dSs7Aws5ubcc346HBTTrQVm/SJW6NwnkjDwM2yQMbkiFC0M/X1cumEXXJ?=
 =?us-ascii?Q?fvUpazf0gAeXR8cO47WlBwT9Vvyu6XKPnRbzAcgKFCV4PMQoLMOJ6pupwrjk?=
 =?us-ascii?Q?ot42EQA98Be1MFEwDfBcWL4+mmdJXVVF6QS0penIMOnQRJF5E6Qv5OEpt9Kt?=
 =?us-ascii?Q?biYh05qUulJnA6If9yQZLzz2v7+OqK5kQu+pbgTpIQA1azBeUqK1ohcv93wh?=
 =?us-ascii?Q?Vo7URFAFGHwYaAwxkefbw2Or/MhBGMkK+ulNAMRQ2vlz/PMhO+XeAt2qydzw?=
 =?us-ascii?Q?6gJCDVWsBx075lUjhLYCmY84znScX0OdOQ/qTE59d/6NyMM8B5TYjhmpBqb9?=
 =?us-ascii?Q?FpcLaIQwWZWd7zpt0nWDWSVbcDvIFMgE5DR4wmFuy6VCpwQYWwED4W3tcsFO?=
 =?us-ascii?Q?PnM1umvw+i2I6+TKG3bVxzzZ3aomBLfTzT6OpoV+Q2/4HId3FKZmCgnqLql0?=
 =?us-ascii?Q?MLEs0kfqDfbVIbyUVgmMmAy1Uil9lhETwEkxCxbP/rPWjpUvvaxJt45vg4nW?=
 =?us-ascii?Q?3RLfkQ4+vOFM32gBB6jHcJi3KBC/eyp/az16Fm+bAMLb0hkdGtupCoIpJX5S?=
 =?us-ascii?Q?7jGDJCRI5Pj1X6gTm7YpZZJXYppAS3OAgS+dJOKp5YWAsxdf4oA6fSnSa9vp?=
 =?us-ascii?Q?S3K2OJPGQBFDEbTBoqoZV876Hzp/Ox08ZqtT2RNHNZ6yttfOScMcb3QOrCK6?=
 =?us-ascii?Q?lBhScS0UlSw2cFh6QIyqk4ZPNjYc8kV/761MkshMUQ3Nh0zKhPaHL5zUUfaX?=
 =?us-ascii?Q?cY+WKP7yFubhcHMLRKuA3g8WC2vJsN/+Wa5d9HaSBXt0Lw4gyJm2kxVtKSbm?=
 =?us-ascii?Q?c0s2kAkRjjpZYd26z2EgWil5OvWpxd+sH6Ab1JSXy9mn3U3xzeEx2rh9PBua?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b787230d-56e7-46a6-5e62-08dcd44c6177
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 23:32:50.0007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojwciPWSU3kWKOAbAfrM/JVKV8xw15hZDtb3DWKdk3Z1RyKW4Ifu8BBI3q4kFVTQeuZmQAhtnyZKHEmitJ2uffTD0BU5NX+cVxwF8m4iR+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6227
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

On Fri, Sep 13, 2024 at 05:47:47PM GMT, Cavitt, Jonathan wrote:
>-----Original Message-----
>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas De Marchi
>Sent: Friday, September 13, 2024 3:14 PM
>To: igt-dev@lists.freedesktop.org
>Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
>Subject: [PATCH i-g-t] lib/igt_kmod: Rewrite xe unload logic
>>
>> Stop trying to unload possibly-dependent modules. Loading a module and
>> probing a module are 2 different things, although the Linux kernel will
>> by default probe devices when a module is loaded (for pci, configurable
>> in /sys/bus/pci/drivers_autoprobe).
>>
>> For the unloading part we can simplify: instead of trying to unload
>> the modules directly (which may complain that module is already in use)
>> we just unplug the HW first.  For each possible device bound.
>>
>> This will be come part of libkmod in future, but we don't need to wait:
>
>s/be come/become
>
>> we can implement it in igt too as it's straightforward.
>>
>> For now this only switches the unload path for xe, but if it works well,
>> we can switch others in future too.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2362
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Some minor nits below, but otherwise:
>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>
>> ---
>>
>> This works for me for the test above that was failing, but not thouroughly
>> tested with the rest of the tests that may trigger module load/unload.
>> Tested on BMG and DG2. YMMV :)
>>
>>  lib/igt_kmod.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>>  lib/igt_kmod.h |  5 +----
>>  2 files changed, 48 insertions(+), 4 deletions(-)
>>
>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> index 464c0dcf4..1868fdbf7 100644
>> --- a/lib/igt_kmod.c
>> +++ b/lib/igt_kmod.c
>> @@ -697,6 +697,53 @@ igt_intel_driver_unload(const char *driver)
>>  	return 0;
>>  }
>>
>> +static int unbind_xe(void)
>
>Nit: It might be better to rename this function to something like xe_unbind
>or xe_unbind_helper instead.

yeah, maybe... but if this does work, then we can probably convert the
rest and then this would be just unbind_xe(const char *module) or so

>
>> +{
>> +	struct dirent *de;
>> +	DIR *dir;
>> +
>> +	dir = opendir("/sys/module/xe/drivers/pci:xe/");

in `kmod unbind` I actually start from /sys/module/<module>/drivers/
because there I have to take care of several types of buses. Looking
again in igt, I guess I could type something common that would take care
of snd_hda_intel. Or maybe we don't even need that anymore after making
sure we go through the unbind path rather than simply rmmod.

I'm also not sure why we are removing the drm module in some places.
It seems unneeded and we keep adding more complexity because of these
additional stuff we do.... that whole pipewire / pulse thing can
actually be gone.

>> +
>> +	/* Module may be loaded, but without any device bound */
>> +	if (!dir)
>> +		return 0;
>> +
>> +	while ((de = readdir(dir))) {
>> +		int devfd;
>> +		bool ret;
>> +
>> +		if (de->d_type != DT_LNK || !isdigit(de->d_name[0]))
>> +			continue;
>> +
>> +		devfd = openat(dirfd(dir), de->d_name, O_RDONLY | O_CLOEXEC);
>> +		igt_assert(devfd >= 0);
>> +
>> +		ret = igt_sysfs_set(devfd, "power/control", "auto");
>> +		igt_assert(ret);
>> +
>> +		ret = igt_sysfs_set(devfd, "driver/unbind", de->d_name);
>> +		igt_assert(ret);
>> +
>> +		close(devfd);
>> +		errno = 0;
>> +	}
>> +
>> +	igt_assert_eq(errno, 0);
>> +
>> +        return 0;
>> +}
>> +
>> +int igt_xe_driver_unload(void)
>> +{
>> +	unbind_xe();
>> +
>> +	igt_kmod_unload("xe");
>> +	if (igt_kmod_is_loaded("xe"))
>> +		return IGT_EXIT_FAILURE;
>
>Nit: This is a pretty significant departure from the current implementation
>that uses igt_intel_driver_unload.  Specifically, it seems to carry a lot less
>"baggage", which I think is a good thing.  But we should also be careful
>nothing important went missing from the old implementation, just in case.
>-Jonathan Cavitt


honestly I wasn't expecting this would even pass BAT. It did, which was
a nice surprise.

thanks
Lucas De Marchi

>
>> +
>> +	return IGT_EXIT_SUCCESS;
>> +}
>> +
>>  /**
>>   * igt_amdgpu_driver_load:
>>   * @opts: options to pass to amdgpu driver
>> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
>> index efb46da12..ee1719a8f 100644
>> --- a/lib/igt_kmod.h
>> +++ b/lib/igt_kmod.h
>> @@ -63,10 +63,7 @@ static inline int igt_xe_driver_load(const char *opts)
>>  }
>>
>>
>> -static inline int igt_xe_driver_unload(void)
>> -{
>> -	return igt_intel_driver_unload("xe");
>> -}
>> +int igt_xe_driver_unload(void);
>>
>>  int igt_amdgpu_driver_load(const char *opts);
>>  int igt_amdgpu_driver_unload(void);
>> --
>> 2.43.0
>>
>>
