Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0254C8303C
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 08:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867CA10E266;
	Fri, 11 Jul 2025 08:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRNuVHMp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F12210E266
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 08:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752221904; x=1783757904;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/lMK2aoVwi0t/zoqvLLNSt1X7+jssvZdfZ70qB6LpoE=;
 b=cRNuVHMpV5LN/d4RoxjmgiOnAP/kOMTQTffLAMu3hVw9yFacGipYq/w/
 aZibX4p+haQumMh/r1YMw/CCXk0vJDjphkcm/DWNWSQVAgLoxVetmOXo/
 vcv6gLrQu03lbkv3OdcJuLW0W4s3MQOF3M4q3qoBj4/A9Lah7bXGzN47R
 LWGHZ9DXnDjGRf3Lfhz8ohek0IY9XW1CU6rB42zSpBcWlvkYod/wrw5So
 xZpQgu5R38UN0KYuDIPHkwLqPnF4OXGdfzXqmGJPip4d3VZEcahodlzmE
 aOXooiYDcxTnGNheiEBfXtJhkgCYNnnooipBElI7cLHa6IDnLMK1RxXM0 Q==;
X-CSE-ConnectionGUID: KV88rcuLRGWfJFlKWd6adQ==
X-CSE-MsgGUID: mVhyl8TnQbK3eGPv2KZ9/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54453362"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="54453362"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 01:18:23 -0700
X-CSE-ConnectionGUID: VGD2Zv2KR5Kr2au+WKfbLQ==
X-CSE-MsgGUID: d4zMEg+xTJmrfLFl3PS8zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="187297148"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 01:18:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 01:18:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 01:18:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.88)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 01:18:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMnejBewiGg66hOYodkZrv8q0LgZYshOKS2U4uPpusvMpAZbh15IvgHA3roMBq6z8N2e1dVKHBh9h6MaQ79Okblg4NopB/NnDoq/q5otVcfFkpWRn0pbVkHhejaTm5SwXfZWir0RivJA9WTk7xSR68d3vR6y5b+PXqDaeR91AW+JRmxkZZl51cQEeaGzkQHgqoTinhqeF7qFpXX9j5eSMnqvO6AGy/nVwJOMTRCSrrMjq808Wrp2p1Umh1EcgasGrTyLE48xOxERtPubm+53FiUTHgb7bfsusB2+DZBqnvS1WGCbiPzDDxkJ7PcZJeeVq6ORV1PXnCKc9C13CbSWbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHgqMPoaXphwxnjvvmhQw9Lr9T2JMnjZPfGyYD/EwaQ=;
 b=QsvkASDFvRkI5JZ1MWQydRTfBFA6N0gOp4bylM5PNEWQ/lSJbQZ4jnTqQ7PQfK27WUC0wrBQDjLOAOt+zgZLSIvupV5x95yJjc/GuHRjvyWa2XX4qUuo+lMwIYJSSJ+iFDoF/wrJqLUHZbQgI8OErJqphi05Hser6Ci4XOdxz6UiOfPzhnUljk2hgVPCfaTdXlKUAX/JtH862qz5SidHtCQIZyzsZHlwQNI0Xr08lKVypN3L/zF1uG5FWBx1lB/ASMsas3HzCDbvMcS8KVPYXVrWX+V3wFwAXuc/WqDLf4/PiZEHB+XM6+46q9HWyhukSsVP6/0eROO6lLbu8qSXJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by MW4PR11MB7079.namprd11.prod.outlook.com
 (2603:10b6:303:22b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 11 Jul
 2025 08:18:07 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc%7]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 08:18:07 +0000
Message-ID: <16279ed4-ada4-4e65-b4f6-db074ec73b8c@intel.com>
Date: Fri, 11 Jul 2025 10:18:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] lib/svga/vm_basic_types: fix musl libs
 compilation
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <zlice555@gmail.com>
References: <20250710190017.167735-1-kamil.konieczny@linux.intel.com>
 <20250710190017.167735-3-kamil.konieczny@linux.intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250710190017.167735-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::15) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|MW4PR11MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: fcb20473-e537-42ae-b384-08ddc053771f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHBiays4N0hTT2xXazRENTZHS01WRWQvQzh5cG8vQXRQUnkrc25JNFQ4V09C?=
 =?utf-8?B?UzFiaW5hYzRxUHdqZmJ1YlIva1IzZ1ZxNFNuYnpZM2ZYUFRuK1dxSHgvWExx?=
 =?utf-8?B?V2FiNDVEamxERG1xaVdBL0kxKzBBbktaVWhpeU5TZmQzK1ZZeUVoWlhjdFhB?=
 =?utf-8?B?TGpPMW1jL0lJSUUxYkhwTVZSbVpSSUlxVFpWUGwxQW5nczNJVzlveThHYVU1?=
 =?utf-8?B?WU5QampoOU1mWmFEN2tSNVl3QjJpSkpIN0N4a3orM3ArME0zVlJGTG03MjNO?=
 =?utf-8?B?OWZYODBMdkJEdTJDWHhMeERkUDFjOHJzLy9RamtuRUVCNURZRjVjMVNENzQy?=
 =?utf-8?B?aEljbkdwcXRwUmxjTk1VYmZ4eDVITWtPU3RweDQ0bERCNUl2SDVFZUd2V0J2?=
 =?utf-8?B?VVFtaVBTVVNLVTZIRnZLNTcvL2gwalcyQ2gzRS9iazBWMFhjZUlrVWJWUUpW?=
 =?utf-8?B?VGlTYjFVY3dudkQvTkY2WTdnWjBSRmpjUzFXQTVIWUxmUldyb2dMRUVDdk9F?=
 =?utf-8?B?SGhWME1DN2lWWm4wTy9nZjlTSjFLUlI0ajVzU255enh1Q3k4SXB3QVQ1UXUz?=
 =?utf-8?B?anBVdXpWdVNJUWRnWWZKK2pqZTJRZkNMM1VXbFhzdGl6dnRCYWY4OVF2L2pz?=
 =?utf-8?B?dk5ZSHlybjA5VVI5V0hIdGxyWEg4V25mRXFkVnZUSkszYmE0S0FJL0VZR1gz?=
 =?utf-8?B?ZlMxbEFyZEpITUlvd2FHUmFsbndjdXZQenMwSzJQclZXWmp6dDcvelFSSkdI?=
 =?utf-8?B?bW1PNUh3VTZ3ZCtsTDREWEo1UmNqN0RsUkJNZzdIOGJaOEh2NVR2d0EvS3k4?=
 =?utf-8?B?ZkVSTlBaVTV0S3dIM1NEdzlRc0dYSk5ZTEROMkszbnZRK3NBZlQ1cklOQWtt?=
 =?utf-8?B?TkJhVi9nVHBRWWh3WnNHWHdobTFueE9uWTZGcEFyTmdSclFNbHFDZ1ZrbG9E?=
 =?utf-8?B?QzdpeEJFdU1US0liaFgvRGl0ZzYyeEhsNVpxNXdBdnc0MkcxUG10MXhScEo4?=
 =?utf-8?B?VXMrTWptaUlQQmdRZ3M3SXc4VmlCaFVTR1BuYXQrZTltaGpSSnNPWE8yQnZ2?=
 =?utf-8?B?TlNMODhNUzF2U3BHNm9ibXFWMVM2K0JpbUVsOThJTENlVTljT2NtZG9xS0lm?=
 =?utf-8?B?a2pKUmF3cU1CMzJzUUsvSmZPNlNCR3R2L0IxcUx5UDFkTTJQcmFIb2VUTWJN?=
 =?utf-8?B?bkdaNCtYdHh5cFVLdk1HYXRtSTJ1OGErVFNicW5meW5UZzJmR2xYSHBrNitx?=
 =?utf-8?B?ZmZ6YXE5OXNkWS9CL3JoWnR5cFhDWlhzOC9MT2VvZHhaL3ZOZ1NWRUJldnJG?=
 =?utf-8?B?REtXSTIwVDR3cXpPZEVJQU1FTW1paVovSlhobThYT1BhMDl2UmxOUWJrWnhw?=
 =?utf-8?B?djFmMDZkUDhzUUw0U1ExS05PTjRiOWs5ZGtETUgyaEozdEZqNVpRMWVTRXpi?=
 =?utf-8?B?VFRLNDNmVG04dzArNHRCdGtKc21ZSEtvdjlGR0Y4cW1jMnU1bEszQmpDWVk5?=
 =?utf-8?B?dGVUUzlPempmYlBRemE5aEhRd3JXckRSb0ZWZEZGd0ZNbHJUMHVWTmVld0xL?=
 =?utf-8?B?bllJWXRUYnJvYWoraHF3cStPYzgvclUyRUxmRlorSlZ2MUlxMW01cm9uZmNs?=
 =?utf-8?B?SmRteTNhMkFoaURKb25lVW9EOW5mbEdHcmw2N1hhczJtZEVReGN1OXhjSHVP?=
 =?utf-8?B?enpCdVZDVkQvWE1pZE0raG51dnI3cWFqUUE1VEg0RVFmWk1HSlZ4RGVnZE1i?=
 =?utf-8?B?NkR5am1laVQ1UU9sZHZsQXBRQ0VJRlRiM2xDajh4T3l1WGR0d3Bjd3BERmx3?=
 =?utf-8?Q?661sfc+uRWo6r6yhXMfdpu4Z1qUKuWuDK5z+w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2tpMzREaDJXRjBKTlNUZU95QnZHczh2NHZZbVh4dUNtckRtaW9vMk0ycEFW?=
 =?utf-8?B?a28xR3p5Y2Q0cEQ0ZUIwUU5DSFdBc2tiY25iUWY5dzU5SkhJNDVTQ0VRNXNi?=
 =?utf-8?B?V0o5dkJiNHJTYjRZME14YmVYWENvaU5Pc0NPbU1La1hOZURRa3djTHZMSi9G?=
 =?utf-8?B?OVVmQ0c5VjZxVkR6eXNJMkhldDQxaW4rL0lPWHhKZWdFRkhGMThrV21UcEh0?=
 =?utf-8?B?VGlYYjJyajF3YkhpQmNsblY1YURDZ0I1cmozLzZuazJ5SUc4aTJhVVhKTWV1?=
 =?utf-8?B?U2Vhb3NhT1VEb1plU1I3Y1RTQmIweEFCOUhUZkh4WWFSTkZyVDYyK1h5cjgy?=
 =?utf-8?B?SUlNZElxMGd2RXFlQVFzcGZVQy9YSlBTbWJiVThSbEpyTjdkSlIyZFc1NXJv?=
 =?utf-8?B?TGxrR1dhbXI2SkVIbGtZLzRnOUVNRC9IMW1JNHpJRXBlV2JmSDByVW1LaUN2?=
 =?utf-8?B?c0gvZE1vNFErRUl4NnpSc2NiNnFFdWlnMnEyRHU2cGdOVGJBanRaRE0vVTlx?=
 =?utf-8?B?Q3ZJeDFWT2kxT0s3dzFrWWxTKzVJWkQ1ZU5zbUt3SGM3K1h3MDJZeTQ0eEQw?=
 =?utf-8?B?RmhhWHZJQUxuZ1JSYUVETTdYTnp6QWpmaUhtU1pIdnJFUGNoTXNuZEFDRmJv?=
 =?utf-8?B?b2V2WVc4WnRBV2M0aE5VaGw5YWxobUg0YXpyVFB2NS9nUG9TQTByc0hNM283?=
 =?utf-8?B?NDlpMHdlT01DQVMvUHFFcCtVN2gzYjZPMk9VQkh6bEZGM0xvZEVkc1FBaG9u?=
 =?utf-8?B?bHNDOEEzcitDNjhwRG4wTWRTS1VzZDU2engzQlZZODhhZmNTeSs1UnBLd0xH?=
 =?utf-8?B?MEI2dE5oeEZTV1hFSSs2TGFsNzJCVldEdGEybWY4emhmdmRRRDJTZVVyWHNG?=
 =?utf-8?B?bWdaZ2ZybmdhNjhORkdaTi9LbEcxVUFzTForQXhyTXlLWkdxbnRsRnBtbnJq?=
 =?utf-8?B?Vmh0MU5vK3hmYmF2M1c2bFQ2YkJlQzNJT1JQWEszeWVLUDNod1RyK1Z3RzZE?=
 =?utf-8?B?MmZweVpKcXZvK0NwTVJQOHVVMUllWUViMFM0VzUyWmlDZzdEZWZyOU1JZ3E2?=
 =?utf-8?B?djlmMWtJMWxjL3FqUDZWSDVlN3ZhT1d0aTMxTzJIN1ZxU0ZKdGhzVW42eito?=
 =?utf-8?B?WjJtOXBkQU41T1NwejREanp5ak4zMlRzaVpQYjUwY0F3bHpmV2RLZ0xTdkp5?=
 =?utf-8?B?cGlSR2dnRllrVDh2cVF2SnE1VlkzZWNIdUhwZ0EzQXhZRmRyR3RYemhXS2Vt?=
 =?utf-8?B?SVZiNnJnYTFWd2hEUWN3Rm9NSjhIWXJaMTRwVElvY0Rld2prdWQwOGgxTzFl?=
 =?utf-8?B?Mjl5TlhOMHFVZWttZDJhN0cvUFQwc2s0a2wrQklCZDBqUFdhWHczeFZ4OFZp?=
 =?utf-8?B?aXBza092cGNLUjIrVXN4RnB3SE5FQnY0NGkwaWpSdGxneDRSUWJBU3M0blBL?=
 =?utf-8?B?NDh3MHpSN2ZXckJ1M1hQT2UwMlhyY3kvdWxsWmRMcUNWR2k1dnBGcTZrWmwy?=
 =?utf-8?B?QU11TnlML0RENXNnNUVzaDl0V2luQzA0OWNmUkdZc0dzTThUNnZvRlFlQUJG?=
 =?utf-8?B?TU1rRXc0N2dqMlVaa0hLZGpqRFFWa25XYjNrZG0rdGpEZ3dCWlV1RWRTUmVx?=
 =?utf-8?B?Y3ErYVp2U2ZadFZFUWF6bUdmeVJBOW44Zzl4aSt2djd4eHpXcEJRWjdTcmxN?=
 =?utf-8?B?dmszZzJ1cklnYXRvK2wvK1hKdWErWkpDM2wxWGNnSkw4bkcvWE1CZkw2TUI4?=
 =?utf-8?B?QkFlOFQvTGNMVFhkMXhzbVhKMVlxeGtJdzFZdCtFTmY3aFZwRGNzNGZYRGdI?=
 =?utf-8?B?eHk4MHJ5ZDNCVWw5dVJ3RHI1MXFVZ29nNzdOL0dBZmg3WFB6Q21pSlBPZnB3?=
 =?utf-8?B?emtaOVdQVVc2V3M0c04rSklhQjhCQ05jdGVyZDQxSDQ0NldXRHVVazIzcWhH?=
 =?utf-8?B?YUUzQ3ZDSWpTMmMwdk9vaUJJZlNHWnZBSE1uN3NYV0thZUd1UTVaN2FHdzAv?=
 =?utf-8?B?dkhkZjlFVGZhNzZzMWcwaFFON21tZlQ2ZTdEb1YvUGxsRDFFdWxZZEp2MlNH?=
 =?utf-8?B?RWJaSEtGSnRHSUxwTDFEMEl3WHFyV20ybjl3bXFobFBFdCtnM25jK1VxZ0dt?=
 =?utf-8?Q?pJYXfrdPGA4WeMijMbIq1Gigp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb20473-e537-42ae-b384-08ddc053771f
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 08:18:07.0613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NP6WROIsU1rmMq1G7uFelDyx3Czz4zPqnqFYcZiTkl/XT0tJrjdvCoYEBFsWEEtKwQSgTauQnZ+Y4UFF0ArCvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7079
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


W dniu 10.07.2025 o 21:00, Kamil Konieczny pisze:
> Fix gcc compilation on Void Linux with musl C libs, where
> PAGE_SIZE is already defined.
>
> Reported-by: zlice <zlice555@gmail.com>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/179
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   lib/svga/vm_basic_types.h | 10 +++++++++-


lib/svga contains generated headers, ie if, for some reason, it will be regenerated this will need to be re-applied.

Maybe it would be better to create some top-level libc-compat.h 
containing fixes for different variants of libc, like in Linux kernel, 
then include it either from headers, either from command line, whatever 
suits better.

Morever almost the same code is in lib/svga/vm_basic_types.h


Regards

Andrzej


>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/lib/svga/vm_basic_types.h b/lib/svga/vm_basic_types.h
> index 8fec5b665..ea10a683c 100644
> --- a/lib/svga/vm_basic_types.h
> +++ b/lib/svga/vm_basic_types.h
> @@ -27,7 +27,15 @@
>   #define VM_BASIC_TYPES_H
>   
>   #define PAGE_SHIFT 12
> -#define PAGE_SIZE (1 << PAGE_SHIFT)
> +
> +#ifndef PAGE_SIZE
> +# define PAGE_SIZE (1 << PAGE_SHIFT)
> +#else
> +# if PAGE_SIZE != 4096
> +#  error "Unexpected PAGE_SIZE"
> +# endif
> +#endif
> +
>   #define PAGE_MASK (~(PAGE_SIZE - 1))
>   #define PAGE_ALIGN(addr) (((addr) + PAGE_SIZE - 1) & PAGE_MASK)
>   
