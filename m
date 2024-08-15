Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD64CC3DA7F
	for <igt-dev@archiver.kernel.org>; Thu, 15 Aug 2024 17:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B2610E47F;
	Thu, 15 Aug 2024 17:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBK538Zr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE97D10E47F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Aug 2024 17:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723742739; x=1755278739;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OYhGmrYoMowN7jXl7jVjIjlNE7pnrFrSbUWtk+6uHUs=;
 b=FBK538ZrJxjlz4yFsfqBgf2CD5I/G9M3sUjW6QtQ2MJN9NNBaVvI+cgw
 iwgeUimrjpVnEAzjrCDfMUrs3rF8/S8PTQSxeX5XwpoMtn7ytUhiRPcD3
 7Gzk7I38nQWCh7O8/tlaCAF731M6CBqxWREklYC4MMlObcxdV3J0kHY/H
 M0S6ENqfIRQGmnLuyB3uWxwBCa6Mgg5Zo6mV8CtZDymapo7VzP86qDY4L
 RQzhkgFTgbUesf2jPR5qpD4FKKy5KXS20UzIIgY33RMGYKJ4em8luNeV7
 4aXn/UNDGeD8q9NMs5PiGafyt6aB/90qnPOQBlvk2k9Kg6iWqFspzePCQ g==;
X-CSE-ConnectionGUID: tzimCVXdSZq32B7KPaaJrA==
X-CSE-MsgGUID: bDvrpusZQCmkaZBqLS+mbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22183439"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="22183439"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 10:25:38 -0700
X-CSE-ConnectionGUID: 7tAHjX/MT6W5CCAovog+yQ==
X-CSE-MsgGUID: YAishdm5SNKXTV0sG0ZpEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="82616331"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 10:25:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 10:25:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 10:25:38 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 10:25:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdVVs04J2+BdW0GnzpS2F/+ka+QuIU1Li2e9ZsN/b2SNhKaxcSaMICr/DIKG+kf/yrhowZp8Un7iJOWHYYJi9LB4g/ApdmASwdDrHqqhrelSx0Y+67USjxll/y2kt7BeDbMft4aGq8rujlHaUA+N/L/jXAIEWRo7LW2ScuNwqonpQ/WesrPz3yEgkv7g82XhTNZv4/nv3dHXit61Yt67kUob0szIAQuWEfYuB2o4qIkm5HRaunNoh0sdiAJQ2BDY6ckeL/RAXtVDQKnOv2dsvYPy5AtYePOCUp7gEFK+qVkV3aDZg+lUwcgYRXeYVqZeKS1y2s59ELkcBMx56bqB4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gf+fOoNxhrRVZ2cG3/R7jqH1UAIGGv3X8gWZtCNdFtI=;
 b=r4LE7z/yM0Pl0NBckoM5/OVxGgWtM/UrvvAbEmIMVAc8rFuD3PzqQd6jhsdYPlNJIc+k33b9M81PX0/fTjoKnYQdHz8KPoABL3Nuo5E6eYxegySiPRxNJmMOSvOSqNVXbJcYHohSIyeSm3S5nVhR+id7NN43aVZ5quOEMlFTkH05YDRv3NrbHr9ZG4+X+/CkDjGn8cIiaMoSOzO+CQA9/H4R1OSL2v8V19Kek1lKHxIyCiEXYB5FTNR74zzG6NFaK2gYPXgKgDE+HUMJnp0sGiYBTP26glVL6kKXfVLj9JtlKDX7kEl/RvjUdgr74jO9SiinF6YITpcpgchf3LOYwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6249.namprd11.prod.outlook.com (2603:10b6:a03:45a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 17:25:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 17:25:35 +0000
Date: Thu, 15 Aug 2024 12:25:31 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_kmod: Unload/Reload the mei Modules Before
 Unloading/Reloading the i915/xe Driver
Message-ID: <nko5zjbdfw272zgf2di4yzeptujglamsxkryjvicdperonsnqw@ggnhjda4trwj>
References: <20240815130423.7686-1-krishnaiah.bommu@intel.com>
 <hg3qro3dxili6n3dggarg75abttxeuzsqkibzviogpdvmylq4u@qan2mer3fh3l>
 <a7cca758-ae66-42a6-be4f-c935d2fab785@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7cca758-ae66-42a6-be4f-c935d2fab785@intel.com>
X-ClientProxiedBy: SJ0PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: afd81922-5d81-4cbb-59cb-08dcbd4f4604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wMiCW1nhMEpMG/nIMVJDM3mz7wssGjQn3f7DVbRhoQWtFy2A551V8ieECH?=
 =?iso-8859-1?Q?OJ+paTC3DXiEBa0RJhzixeb2+IhHBe1BaqeQbWr4zDGdvKiAJejTr2kmyD?=
 =?iso-8859-1?Q?AvEFMaSUiEObFfV3UADXF+tN4vom/D7JrT32diFcGrlMY2zeCu4AVSS+wl?=
 =?iso-8859-1?Q?KV/Y2FHsGVJCn8jRtCYXKlvcq+Qw2OmcePJkYWZLaCdFCsO/Yv2g4PJa3I?=
 =?iso-8859-1?Q?HIS/Pzm4R6VMhupkF0I85cJYfi1P/+hByNFXLjy6G6NI8BAhrHweMi7ikE?=
 =?iso-8859-1?Q?EwIBIghLMWz/fuenRrHivek55eai23kOpjU03fhSdRU11zP0iPO3N0SsLV?=
 =?iso-8859-1?Q?kYCLC28POTZXgqrRSSv8OVjXL3ZWE9NsAy27QGdftxbP2PCo3V+EpeyIEm?=
 =?iso-8859-1?Q?xiAGLAIju7fabUqA6sGmbLvJlB/PNMQ0ci2rsZQBA0B7xPwq4bTBn56zea?=
 =?iso-8859-1?Q?KimfzDiKvxUGcGSAvePpvYhu1dvzc/PQsb5PcEgC3fbjaq0idTpNHvhyf6?=
 =?iso-8859-1?Q?WomZYy5RZrddbst7T9KNFrtTdKiz09SImQnTY0K4dtGMEAHujLQe5Cb8br?=
 =?iso-8859-1?Q?ojia8m6gUITTOjTsv0M+zKVKCYKpOQAoAMayzpixlU77NLb5vV7TNLzF4v?=
 =?iso-8859-1?Q?WA4Tb9m9hieMzxR0plTb2XK+vBUC8mdz1Lo3kE3TF2J/C/3VpOz5rVff2N?=
 =?iso-8859-1?Q?+xngpBczq35qt5aI+Taxy+oZMGsMM49I0qCfdYMtJJP3cuPfGqdNqon1ar?=
 =?iso-8859-1?Q?+dxiwsyTpqVpYgscvvkCBEmybrn+RICV3Gffo8/w/iM9eFxd0rkVYR7s0k?=
 =?iso-8859-1?Q?inrRMnxITC31rkKAQPaVwZDbGUcXp/r92J6ZeRIZdSBBCAEqiUWab/XpJY?=
 =?iso-8859-1?Q?cIOtHwcFLe0Do/eoW4HIZT0KZyta6FFOFX3MdRBGUG9eja/yi/FsQjnGjU?=
 =?iso-8859-1?Q?tSENSQo/Oh28A3FfsdvhCG9FM/tzsMM/hYbHK37dFjHkbQpA77vFJ+5g2f?=
 =?iso-8859-1?Q?TC5AGmBYbdD3f6Lt0o96IxVNzYELi9ECVreqWhlFSCawQZt5DZLZRVGAzG?=
 =?iso-8859-1?Q?DpxO6iRol3zTM/NPPkuMSnMkEd1sHKO6lSIXYgx9puInAD+0kT6wkEghcy?=
 =?iso-8859-1?Q?kWawF7RyZID5WYjx7GpGm5+HWpFNTEbr5c/4/NwDt6ypSdy4EOZmXB2XHg?=
 =?iso-8859-1?Q?FhbJoxbW6sBOKS44BpkmX8LvJSTu06ttHEeeA9R7FgwgVD6LudZ+Au9ai6?=
 =?iso-8859-1?Q?7FnjwRLrs4eSpacwVN/jK1t7speiIeInTj1hMZblDr3BIonYBS94tUFhzf?=
 =?iso-8859-1?Q?i4BxGiQUhpo1tZeOKT1Z57G1by3WsbtQ+msq7lrqaTYy8Mw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2lJtK8JbAmy0B/vAYu9CHbtPKgSe0UUjTw8dQXIEEHsQDZbSgqc8ViWs/B?=
 =?iso-8859-1?Q?PBnIJmOO4XujpN6xg+gdQ8JppEPMUofa/S7Wa1wMsYnbjf8c61Z0NhvlV0?=
 =?iso-8859-1?Q?DCV7jaNGu97/7V9ufHL9owghKVHz192U4f5t3cEE7vXK+X0rIoAPcswL+R?=
 =?iso-8859-1?Q?6jiLdhtFeboGkQUGGoDEfX3XAjDc3OTv3usrfLnqdmVPCASwhHNXjC3vr5?=
 =?iso-8859-1?Q?QhJoth+YlRYDOVd63QeF/vxunFlBdViLNyO+Oo8ETlK2rbXSbwNzZ9/Kgr?=
 =?iso-8859-1?Q?MF00U4w7UVuMC39YpmbpcnulrGdr3CUYGrvBViqd3rr//J7BmJ2LwLfdCL?=
 =?iso-8859-1?Q?WRLljhb6Yj88L/KBE17GHszj0zSo7x2MwHNBnguvRbthq5lxy4HAFkXq6Q?=
 =?iso-8859-1?Q?OAlOYun6gd8XmviG+XRWgADjNUquqb+bQmc6FgpIfp0ihuFCyhH9Dvxn9W?=
 =?iso-8859-1?Q?un2cdqyW+zF86kTjTLbPqV6hsPk6Inen6Vy8k+vtOWB11ZmD90lMjzTyw1?=
 =?iso-8859-1?Q?1TYFdrc7/9FLuBIX63xGlcm3mmlMUfCk9onkFw7XjyEC/DtQkjnWi1YCUk?=
 =?iso-8859-1?Q?USAAHDR4jn52/AcL1FXPgr6iV1nD0ryoRTuAqtKC2+lc4o4I03IR73CVc3?=
 =?iso-8859-1?Q?Zg2XkCJWh1s4IVPvm7B/AG67/Y+NZktacIv4EMWbVP31hwWKHA96Y8IxDB?=
 =?iso-8859-1?Q?BAZ1xtdqxmA9rYj4IwcbJ/fD3OI2uOC20cK+/GBUWFZ3SVclOPdzzqKbHA?=
 =?iso-8859-1?Q?D1Nh1aHAc1+W0BiGuO0iadaLhRuT04G5PVN2AW5T/53n+aKzIx4K90JKrn?=
 =?iso-8859-1?Q?aOgRUHCjxMWRMkcLb8W4tG8ZaVpQ2hzAJ4xboTo1pMtVeuJzdvjvwDHOhZ?=
 =?iso-8859-1?Q?s4G8BCsoQKa5ccU1Agqw3S8vToz6ZnGYhN66IMbrYckj2eVB/kxwOdKJR3?=
 =?iso-8859-1?Q?Gsk9um0/n9519lpV8Wsk52bju00BU1/H0GE96PTxE7bB9xZc/jvmp3Gy2h?=
 =?iso-8859-1?Q?IH1MMk//eOekfDjBR/HJ7B1nopTByNgJ7M2tHqv+YQGiD/hlfThRJvihDa?=
 =?iso-8859-1?Q?5Zix6dNcdOYzQk4ZxtFOPyMP3aw/S+3f8qMSLL1ed2PxinjHfDpNa+tvbe?=
 =?iso-8859-1?Q?OAaOUniV1o3AlQAevYLVDKonxY5oZRIdvM/PD5UQU0wiO5jCRBl+CUE3qc?=
 =?iso-8859-1?Q?hxQTvWuIQ0d81Qcjm2yNp1rgzpvLenMtuW4JeZuN6T0XF33aaARgWpQJIR?=
 =?iso-8859-1?Q?DcbFdNCvi6jUbR/KuYMRU78oL8FgkBVBOEqHPmTm4uS4NLASSBb7LHR2eP?=
 =?iso-8859-1?Q?UiOgKqpmz3s8s93hTmDLZ5ZyMtePTzQJDjDJr1OMJUwT6EjNVrRlvMntQT?=
 =?iso-8859-1?Q?KxLT7zDvzs4EJzp3I/6CCzlbo1qyIISoQyG0bvCBH0XLa2fM6KSEnrkwau?=
 =?iso-8859-1?Q?LLopkhM56Qe9hNk/Xq16SwVNwGWiDCT5Km6d9DkViB9gSDvhaM83wZFaJs?=
 =?iso-8859-1?Q?AdW7cqGUELsLCtCyArn9wve3HVhY7iWh8khATwWYNTAY/T7wFD992B9JdM?=
 =?iso-8859-1?Q?ypLq072eB+QACg80mbUv+P1zILZMXsYLcbebOqH3MzdSw9B+KeAPAe5sAl?=
 =?iso-8859-1?Q?1n5n4fOOPepAfwxEijMSvd4FeJPSjlG+ITGS6Bqyhvp6NsWB0uzSpfqw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afd81922-5d81-4cbb-59cb-08dcbd4f4604
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 17:25:35.6493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LiQX7sMV8o6VhI3Bth+NOlKf2Kmf7A7tyrIr+vE9Ym7WrP3VLJ4PLCWGGBGaMjOE6wVYkorUOxjXZKNyVXldmzrXp2sAGZBHKk3cc9zGg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6249
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

On Thu, Aug 15, 2024 at 09:57:08AM GMT, Daniele Ceraolo Spurio wrote:
>
>
>On 8/15/2024 8:20 AM, Lucas De Marchi wrote:
>>On Thu, Aug 15, 2024 at 06:34:23PM GMT, Bommu Krishnaiah wrote:
>>>To ensure stability and proper module management, this update introduces
>>>changes to the handling of MEI modules when loading or unloading
>>>the Intel i915 or Xe drivers.
>>>
>>>Key Changes:
>>>- Unload Order: The `mei_gsc_proxy` module is now unloaded before 
>>>`mei_gsc`,
>>>preventing potential failures during the unloading process.
>>>- Platform-Specific Handling: On platforms where the MEI hardware 
>>>is integrated
>>>with the graphics device (e.g., DG2/BMG), the MEI modules depend 
>>>on the i915/Xe driver.
>>>Conversely, on newer platforms like CLS, where MEI hardware is separate,
>>>this dependency does not exist. This update ensures that MEI modules are
>>>unloaded/reloaded in the correct order based on platform-specific 
>>>dependencies.
>>>
>>>These changes address the need for a more robust handling of MEI 
>>>modules across
>>>different hardware platforms, ensuring that the i915/Xe driver can be
>>>cleanly unloaded and reloaded without issues.
>>>
>>>Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>>>Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>---
>>>lib/igt_kmod.c | 38 ++++++++++++++++++++++++++++++++++++++
>>>1 file changed, 38 insertions(+)
>>>
>>>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>>>index 464c0dcf4..6ee2b7afe 100644
>>>--- a/lib/igt_kmod.c
>>>+++ b/lib/igt_kmod.c
>>>@@ -480,9 +480,29 @@ igt_intel_driver_load(const char *opts, const 
>>>char *driver)
>>>{
>>>    int ret;
>>>
>>>+    const char *mei[] = {
>>>+        /* mei_gsc uses an i915 aux dev and the other mei mods 
>>>depend on it */
>>>+        "mei_pxp",
>>>+        "mei_hdcp",
>>>+        "mei_gsc_proxy",
>>>+        "mei_gsc",
>>>+        NULL,
>>
>>all this manual approach we have for module unloading should be gone
>>IMO. Replace that with 1) unbind the driver; 2) unload the module.
>>There's no need afaict to keep tracking what the module uses.
>>
>>as for loading, why exactly do we have to do the kernels/depmod
>>manually?  If we have to do anything manually like that, it means
>>real users won't have that and we are actually missing the proper
>>integration. I typed something on the different types of
>>dependencies (harddep, softdep, weakdep):
>>https://politreco.com/2024/08/linux-module-dependencies/
>
>The mei modules are a bit of an issue because they change behavior 
>between integrated and discrete. In integrated, they're loaded on the 
>CPU MEI device (the CSME) and so they're completely independent from 
>i915/xe and we don't need to unload/load them them to unload/load 
>i915/xe. On discrete however the MEI device is a child device on the 
>graphics card, so the mei modules depend on i915/xe and need to be 
>removed before the graphics driver can be unloaded, but are then 
>auto-reloaded when the i915/xe is re-loaded. So for IGT we have 2 
>possible solutions:
>
>1) only unload mei modules if we're on discrete, in which case they 
>will correctly auto-reload when we re-export the child device.
>2) always unload mei modules before unloading i915/xe, but then we 
>need to manually re-load them because they're not going to be 
>auto-reloaded on integrated.
>
>I'm guessing that if we unplug i915/xe that's going to automatically 
>unplug the mei driver on the child device so maybe that does help in 
>avoiding the unload/reload flow?

yes. Just unbinding the driver should make it stop using it and if
that doesn't work we have something to fix outside of the CI infra.

for the loading part, *if we have no other means*, adding a
MODULE_SOFTDEP("pre: ...") would do it, although a weakdep +
request_module() if/when needed would be better (except that
weakdep is only available on 6.11 and kmod 33)

Lucas De Marchi

>
>Daniele
>
>>
>>Lucas De Marchi
>>
>>>+    };
>>>+
>>>    if (opts)
>>>        igt_info("Reloading %s with %s\n\n", driver, opts);
>>>
>>>+    for (const char **m = mei; *m; m++) {
>>>+        if (igt_kmod_is_loaded(*m))
>>>+            continue;
>>>+
>>>+        ret = igt_kmod_load(*m, NULL);
>>>+        if (ret) {
>>>+            igt_debug("Could not load %s\n", *m);
>>>+            return ret;
>>>+        }
>>>+    }
>>>+
>>>    ret = igt_kmod_load(driver, opts);
>>>    if (ret) {
>>>        igt_debug("Could not load %s\n", driver);
>>>@@ -620,9 +640,14 @@ int __igt_intel_driver_unload(char **who, 
>>>const char *driver)
>>>    const char *aux[] = {
>>>        /* gen5: ips uses symbol_get() so only a soft module 
>>>dependency */
>>>        "intel_ips",
>>>+        NULL,
>>>+    };
>>>+
>>>+    const char *mei[] = {
>>>        /* mei_gsc uses an i915 aux dev and the other mei mods 
>>>depend on it */
>>>        "mei_pxp",
>>>        "mei_hdcp",
>>>+        "mei_gsc_proxy",
>>>        "mei_gsc",
>>>        NULL,
>>>    };
>>>@@ -647,6 +672,19 @@ int __igt_intel_driver_unload(char **who, 
>>>const char *driver)
>>>        }
>>>    }
>>>
>>>+    for (const char **m = mei; *m; m++) {
>>>+        if (!igt_kmod_is_loaded(*m))
>>>+            continue;
>>>+
>>>+        ret = igt_kmod_unload(*m);
>>>+        if (ret) {
>>>+            if (who)
>>>+                *who = strdup_realloc(*who, *m);
>>>+
>>>+            return ret;
>>>+        }
>>>+    }
>>>+
>>>    if (igt_kmod_is_loaded(driver)) {
>>>        ret = igt_kmod_unload(driver);
>>>        if (ret) {
>>>-- 
>>>2.25.1
>>>
>
