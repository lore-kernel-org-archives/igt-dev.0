Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006BCCD6E4A
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 05:47:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C024113862;
	Tue,  2 Jun 2026 05:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6yWGL3C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB059113860
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 05:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780379221; x=1811915221;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jKICMCKb/q9lcJYwAJXwnwlPCuPh5tBdZXq3Gut1/8Q=;
 b=a6yWGL3CvPts75cW8W+pTD/hgdYRlUP7FMg5GhuWgtNB7jAcAW7WYdOA
 QhROcKLFcv6OSWa9tSFCHtaQD1YzGA04sKYRGqo988fqFPWm+qWngHosD
 N8CF+yrY7BR7m0uSEp1btl09RTXO6PFRY6/RTbVTBqGW0Lv2ZdbckN8hV
 XVnTVj6BGTFQYiqxUYDBWst7gNa2TziFaXKvkIAgaT850bux+Jx7Giq9H
 OtoUBGkzUs6DLRATDf+VSywFCwWG1DGWq6GyoDYB8HV/axkxKg2RO4joN
 XbBHoDj+4qrUuBsU73PT/U4GfehdWvD/qFf8qMNwJslM8JlYsjL4SZsV+ Q==;
X-CSE-ConnectionGUID: FgB4be1rQZ+su8f4MFi6Dw==
X-CSE-MsgGUID: BdEznkZzSeO751URPwa9AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81184466"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="81184466"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 22:47:00 -0700
X-CSE-ConnectionGUID: jK+Ic/a6R5S9H92EahDrDw==
X-CSE-MsgGUID: wBe6RcdQSVy/WvqrTqxNxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="274069461"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 22:47:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 22:46:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 22:46:59 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 22:46:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M361b1s4FW3QK7Pc8FwgInuGJ5SLHmj8OA5kCxUqmpQVisMc7iM8Pii1od64t03qYfpUK86rBVXSqt+1gij0ufKzvrbytRFdprFoH+WORZsQ6XF+SLJdPF+DUZprTm2ZaQSGEgtWN9U3DamHkdQaQs+HAjWZZPH1pf5Z2+cCW3arRYGanh4640i1Vwbruc63nkGZse0qruLDFCrJtTdfA+P2kVLJY4J9MP2+Txl8HK+gyPmi4iO3NrTUZnikxmaNzE+4VS/RdL34IhfxzFnoA85u1xvSSZ+We5ZAuKFXsGv7kK7x7v2ofJIMuU9I+ApFvOTRGpVRbZ2xn9+T5ws7MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hccRQqE6seqzpcMTxKTzcJA3DXl+bnXhIq/HhU4aYxg=;
 b=T37zi3WW4VVMK/0wq4FP+auEF+V3Z80yO339xlMNH8MEiNekmqlOCc+sHdMLPSDNBWs5uKWcN/xnXjVZV+cv5LfBc+vyjRJl7qsgzEtz6DpjG3hwnmbXMadwHHrcGkN23sTP8B3NaFNaesvkupLoHoopqgNFUxJMaepwo4SuL3EK9xEalRxrYmcW7tFMBH815M1eMe80odR0c8e1BoylQxVYMIdknqKublQuJ3PMxyUlQmcsB6kwTocgjFzBL82vtgjvFyG66n626/47pdIgUk/QjlyphFa6ibPAVmnH95v9IerUqegKLBn8586N1DigBAabPQh1MRTXZYdWCmzEcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by MN0PR11MB6255.namprd11.prod.outlook.com (2603:10b6:208:3c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 05:46:51 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0071.011; Tue, 2 Jun 2026
 05:46:51 +0000
Message-ID: <d5ef84a1-e8f2-4d92-8815-416607d1f627@intel.com>
Date: Tue, 2 Jun 2026 11:16:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 0/3] tests/intel/kms_pipe_stress: fix plane setup
 and cursor handling
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <ramanaidu.naladala@intel.com>
References: <20260527071940.3285269-1-sowmiya.s@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260527071940.3285269-1-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::19) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|MN0PR11MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 0092f458-a783-4e8e-b161-08dec06a5849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: KjoYHW7E/paCR9K9zOJNPvWByOt7EhSdDXUt4sMYjhVzSIHnjN+W+86xxer1B+QcoAHn9t6RCiA6xSlyhwovS9i0Ej0FdB4X2Tr6Tvkr15MxSjIkHoJTSXyLc1+rjryLKQ4mJfPCmdAXd27oqLzT7i6eXwLwuwlGg36NHtU6ayxblGpyvyfhmAADkqCgYNEjZDCDipYUA25r12QSreCXOiFdXE0a2LoHSxi/51f15fNjSYLIgomQX40C6/P08OCXsmGS+fHbD28yrAorRGlut/hqvrdFcn7Sz04iArw1rUHF2sEbdYFzVLYvspra38hMVam8R/kCLXFTIqVU2fyxG/v2voo8RlAcbZ3xstHYLPquR0B+YmuycjMy4ymDKIZ60xdS4OtDUR1Y3wQKGaNuYnUX9xFd7+aUASHnPe0rtyAnlsQDFMSuKVjBbtseyr4W0wasDNECgr0JS8MmU2bGaduiOwlUFYvHwcRe1q0yhfOviTZib1+HOI4fNpQiFibH48LFb13/rE2vyjz+M2mk0TegFLMi9OFU3e0UrREYoID6GbuIlS/aTRBa2PjX/bwK6MWMUT/jseGYMN+ycUIhkM9K6KNssYGD/elvuGQS4PVEqubANMt4kcD3w/JXVUdBhsEEtcwDd/JZ31lN4UwrFikGLo5IzN7Ug2r4Gs8u4a8+FVOkeXa3kVjPzTzv045U24BOFC8CHk7+YMtM54MJWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEQzV08xWHY1T2cvQkp6a0NGODZubXB1S1JmK1Z4bWF6UEMxcm9rSjQ3ZndE?=
 =?utf-8?B?TXo5WVBwejhRdUh0VG93R1g0UnVUaWZyTFpnV2YzY1J0QlphcGd0ZEp0Qm8v?=
 =?utf-8?B?ZzhmRjFiM2Q1ZzJlamtmd3FyNjc0Nk9aZUE4UnJ6akp5QTdQZ1AyeFFIS2R6?=
 =?utf-8?B?c1BQRnZzaTMwOHpLNWtqVHdqR0cxSXUyVUFQN24zbEl2ZlowRXFLWDUzQUpY?=
 =?utf-8?B?ZGQyOGNzTlQxQ1JCbUlienBhdTIrMjc1UDAybHlGTncxV1F1Qkdyb2h0dDdS?=
 =?utf-8?B?L0tkZ0pjTzlNdlFHbTV4NGlDUlNOTWpTTmhBd2xqRVBwYkNuWFUwWmVMR2Vy?=
 =?utf-8?B?ei9reGE5UjIwTDV1RTFWODhUcmE4WTdSYmw3TW1ubXhtd1JCOWJuM3lEQWF1?=
 =?utf-8?B?dmtOTm1SRmlKUFJtWXFBWlZsMmtrcDlTQzYrUW1EbkRwRVhYeHpBNjNBcDg4?=
 =?utf-8?B?UnZHT2V5cWEzaHdaaWc2VEdlM1hhS1lMT2hkTzJNZFFhNTB1djBhY21GRGNu?=
 =?utf-8?B?dEV2MTVFUUFEZkZRYUp2ZkdOUFlYRGVOREZTV05nejkwblhHVzU5VjUwcllL?=
 =?utf-8?B?SFN1SUxxQlVjK09CY3R5MzRoZWZwS3ZmZkZyYUpKSXd3VjZ0U2JwQ0plVGlM?=
 =?utf-8?B?MDVRMk5taGxyWTVDWHFtVEN4VjdXQ0NVQjVhTk0rLzB2Q3lJNUlxNFhxTkV6?=
 =?utf-8?B?S0k2M3dxWnN3b1hZbWRMMWhNZUdPSC9sb2lOMUF4cFh4ZWk4dlJ2SmZkZnNV?=
 =?utf-8?B?T21UbERNNHFiT2Z6SE9CdmVUbWNXdENGYnJnVzJYV3ZyZ2hUaUx0ZHIxaGlB?=
 =?utf-8?B?TlR0ZTZ1dVpJMUYyNE9NV1ZUTG1NRHpLdTg5bkFIVE85Uzd2cU5haFVjNnFG?=
 =?utf-8?B?VUQ1cWtXWHdDM3ZORlNLRm9uYlg4Ky9PcGZxMjN3MnJHZTdKbHdLSmpJYk9J?=
 =?utf-8?B?bnlXbDgxQjRpUytOdmVPK0E3bzJkWCtFamxRRVBiREx6dENGYjVRUFFPM2NG?=
 =?utf-8?B?WU4ycUNaY2N5WDR3Z29NZS9JQ05IL25uRFN1VHZRcmxyMEoxeHRMaGpEbDB4?=
 =?utf-8?B?aDRiOWZWZUxmUDRLZTRxMk93MEdCRFNUUmR6bTY4MmxWRlFFaFZVMjNVSDJW?=
 =?utf-8?B?S29tcFJ2VlY5WFBJaUJMMXUzYkJIYUZVOFNFa3dvMlFNOFdKcDBOZk5TZW5S?=
 =?utf-8?B?Sm16M1ppMWF5UTlzRVp2aVk4MTZWOWxBVzFFUHRmNHhwaVRxejNoc1R5cDlN?=
 =?utf-8?B?eUVxdTVmUHFzT3ZvMHB3ZzJSWjFTUnFqcVdvU2FLRUxvM0UvK3dDNWwyRGt4?=
 =?utf-8?B?eUNBaGFZTEI2OGF1NTlmdlJlcEc1UnJkNHBNaGwyeHFSRW8yTkVVUXJ6TGRU?=
 =?utf-8?B?UHdpMXNDVTA2b2dyUWYyaG9QVWxqTjlFczFzckJQL0o4VXdZY0czODZxSjhp?=
 =?utf-8?B?SUVZR3lxaitIdHY1YkZwa3Vpazd2V25iWndXQ0lmSjNxR05RYzJYN2NjdlZB?=
 =?utf-8?B?WmYzZ0NwZXgrZHdtVzNrS0d1dXN6WGxCdVo0ZlVER0JWQ2E0b0FDeGZpejdx?=
 =?utf-8?B?WjllT3VkdEp5TTA0NGwxcHJQdVNQNDN6Tjhva3V3UGJwcFVSVGxLMUE4YU1H?=
 =?utf-8?B?T1IrRXVSaEVsWTF5eFU2WklNenphbEFRQ1B4SUozSXltT1B3WTJPUlljcWFz?=
 =?utf-8?B?cklRQzhoeE80eGprQmYyeVl0dzBxTkVTNU5LbzhDZmgvOGtMU05qVHlIVGVl?=
 =?utf-8?B?ZG5qajJGQ1lRZ2dvNmlxV1JodmE2anAxQmxHWWEyQ2dNd280R3pjMFQzd1VX?=
 =?utf-8?B?dWNEenJ1Y2lMeEp0Y21UajJ1ZFRYM1VWdVV4M2tVOU5uenJuZ1JGbTV3cGJ1?=
 =?utf-8?B?SDVGQjJwa1N1ay8rd2ZDSUw4YmJ3N0JOMHJLUms2Y2xrVzZVQkZwU2FLbE1u?=
 =?utf-8?B?cG4yM015Kzc4Vk5oRHZJODd0QnlSNTlqWHUvNm16OWRtT1hNbld4enRMYkpn?=
 =?utf-8?B?WERtYVJ5aXNpb2Y0Q2dUYUY5dm5lQnowZHNJaGlTZEFsQ0pjUHZtL05GRlB5?=
 =?utf-8?B?THJOVUxBMjJLSzRQdUEyMmI5aEdkV21aNEN5UzcyNjhxS3MzbHg2bTdTMFNH?=
 =?utf-8?B?R2szOGJkV1dGelR2bjV5UGFqYXFXc0p4R2lQZWNOdGVoTVRKaGZEeEtiVlZw?=
 =?utf-8?B?QjM2V0xBT0p4SEttbVUzOXhwazg4RnJxa1lmcUcxNlpodkd5T1daVVl2SEZ1?=
 =?utf-8?B?STRUN3JzV2tuY1duZmtiV2lvUjNTSndtWDZmT3AyTW1iSVpaaW5uVm1KV3FK?=
 =?utf-8?B?alk5RnhlMUZudmQvMzVOMXROZGlTWldhWW12eVNlNk10bnNaaHFJQT09?=
X-Exchange-RoutingPolicyChecked: XYd2qGYECfl+J/tezZg/hqERAZtkLczBHA4RypmzuAhwqXJs0hWwNytu5SXBMHwvYz5h+jf5TM31OAlA/NYStR3z4Pd94rOiWqnRUimjJiViwD/ngD+FcbEXvuPcW9+PHY4H2ZxXYgYhw6QXwtYLX6lj5FCFq117FliZEBNOT/SpE3YJwdMfwkM+3eiBvr4nWI5L3XB8bFVbAc5pZd+I46HqN64mdvrH/VxEp6JHmcipEFAYG4LHy/IDsJ5tQ0PjhzOsN8ZVdw5WPnU2K+c3tm2Sfd9jLjVNjCwagX8wxhZoIXVX/hAsZJpgila5vFNHxNjZtOHQE84B85VmUphydA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0092f458-a783-4e8e-b161-08dec06a5849
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 05:46:51.5206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCKEX7/GtHkh2L2xRP1WOmhGiTN1QR9lXQ85dqrCivPFt2KjhCvQ1WMJ3TiGnUUGDC1tqPMKeKyGkAMwi3OVng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6255
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

Hi Sowmiya

On 27-05-2026 12:49 pm, Sowmiya S wrote:
> This series fixes three bugs in kms_pipe_stress that prevented overlay
> and cursor planes from being exercised on Intel Xe2 hardware.
>
> The root cause was an inverted condition that caused the plane setup
> loop to be skipped entirely on every successful mode commit (patch 1).
> Once that was fixed, two further issues became visible: the plane
> source crop was not initialized correctly, causing the hardware
> downscale limit to be exceeded when the destination size was reduced
> (patch 2); and the cursor framebuffer was created with the overlay
> format and modifier, which the cursor hardware does not support --
> only ARGB8888 with a linear modifier is accepted (patch 3).
>
> With these three fixes, both stress-xrgb8888-untiled and
> stress-xrgb8888-4tiled subtests complete successfully on Nova Lake
> with and without MST displays.
>
> *** BLURB HERE ***
Please remove this ^^
>
> Sowmiya S (3):
>    tests/intel/kms_pipe_stress: fix inverted condition skipping plane
>      setup
>    tests/intel/kms_pipe_stress: fix plane source crop and separate cursor
>      loop
>    tests/intel/kms_pipe_stress: use ARGB8888/LINEAR for cursor
>      framebuffer
>
>   tests/intel/kms_pipe_stress.c | 116 +++++++++++++++++++++-------------
>   1 file changed, 71 insertions(+), 45 deletions(-)
>
