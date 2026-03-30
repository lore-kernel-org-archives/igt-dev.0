Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3137EFF494B
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 07:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C3510E349;
	Mon, 30 Mar 2026 07:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RU774yMW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B4A10E349
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 07:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774854831; x=1806390831;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dV2mmx9u9nik91ku7ApOzroDsfcGmD21Cns6A6R3fQk=;
 b=RU774yMW4qMSEDSkAz4nhOAx3AD+YB6aZn0PAuj2cc7nMKZJtROOeV3D
 UwrIqr+4L/QkiSddfz+PmyQcfjc6/az3Vd3pz6cfRSPC/nWXX4W8PmZkW
 XFTFcmWF5Zu3qc0VQfGN/KUDFhQvqO2306g1GxzX0gUBldF9Zak+8i/Va
 x+zHOfyZEP2GcqCUfn1lg1TKTCWgPLNH3J71X8yaOsKmu3FfMrBYYIep1
 IEcZRjzS70wHE5rXtdXrUIOR5Nxa+3zLfFhBOHHV2eagPa1OOkGXqBNIY
 w0sbqDZoH+ciu8TkMR6RD1urq6kHE76iNTWZ22w7oGzqbWwrCccfVetGu w==;
X-CSE-ConnectionGUID: Ee+QoQZISBuMrM8QFlcXag==
X-CSE-MsgGUID: IiRKkl+kTwiYOl7Owt0Gkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86458163"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="86458163"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:13:48 -0700
X-CSE-ConnectionGUID: Y9bb7FTPRBmLdlZDMYIfYA==
X-CSE-MsgGUID: Gcs8Jr3QQnWWlDscwmcFMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="227586079"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:13:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 00:13:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 00:13:47 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 00:13:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUUjNBnKnpg4JKdS1HIR4M3QDH1K7HGje0K710fhHtfZQgcwVq8qN4A9AargNEi8YtMXxqoerkLVUMPRGH/xZf9LAdHmv8Sm9UCMqnGdlopdyR92JuONQvJmrMz7bLGrnym1nwjnzoB/ZUBGhLiz4MpsnPcA0PX02w4BKK1t7/+yJwB+FedLUOoUk7rSFtIoebWJe9L0MzG+Fc+7G9sLwUwDZKkl9H4LxlYHskrdoYsCGZpGp4kGAKjOQZebsGTiK702EEwZD1eXjpxQmJ753YbtmVK2DD6f2y1Cth3d/lvb+HvXOs2gXXMcG+br2zHNVSTz5SsoFJZAWaCj2w50aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJlyvfqmiQ9sAKE8WVuwieRYnhUZIvkK4vmK9fBBcI4=;
 b=Rl6OfxN58RFIMXIrOfX1vHmRCLFACS0kq5YuSaGwjnUHZ/SWNQqFKkk8MwYV0Jv7oTmclnjeyuR1Yipc4FrlphDchfqbDtwdzdP2iJ+9VkHS+H4i9FtNA0LrKZcWQmePA8N9HflM6l6xoN9JFs0EDe/XuS9LjzobIwAxHSQF5Ew3DMg2r3+Fe6GulzILe5b9Gew9K5vHVyUp1tNBAYTEeyXHC00uZ1UG1EazcSJlLWVMujNabpb+3rqgXkQ6GpveKNY093RnLYwAVhzpEBNLVjLWcwrUNMDlfC/7t17qZY4lgwJ38x2YhVjQziNJ7/Zn2YxXDuiewZ5hHE1G4LWf+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MN0PR11MB6112.namprd11.prod.outlook.com (2603:10b6:208:3cc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 07:13:43 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 07:13:42 +0000
Message-ID: <5466a965-a3c7-401c-b36b-0f2c5e5a226c@intel.com>
Date: Mon, 30 Mar 2026 12:43:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 5/5] intel-ci: Add *-planes-random chamelium test
 to Xe blocklist
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>, "S, Sowmiya"
 <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20260326090417.864673-1-sowmiya.s@intel.com>
 <20260326090417.864673-6-sowmiya.s@intel.com>
 <0fd0f19a-3f33-4d89-8b50-2be59b3a1cd1@intel.com>
 <LV2PR11MB604535A1FEA4837234C0C9218154A@LV2PR11MB6045.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <LV2PR11MB604535A1FEA4837234C0C9218154A@LV2PR11MB6045.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0012.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::25) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|MN0PR11MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: a2663852-3980-49cc-9092-08de8e2bdff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: KQDVHJZsXrv1elGB0vaNefn1t+pm77LUOgQxuIAuLhRjLUSRMZQ+ggNAWwQ9zOFRdxMvl/Mf85BV2IUXDuLyUet+/9/hQxP38pMSLRSFiMw0/El/t+ebdBWJ/orCDaMN3PKqvK31xhbKeLjUWBayRHiSWxQfXGTqtyWjsyVWTOC63KRj/wH6DqaExz2UXnoD+6rVALhSH6MxnKHzBpO/ht8/aM1f/B8p/T5Giinja+oCw2gT5N7MI2L4T4h0owVQ/KMZdUtHGnqq07hIacDC+glW2rdBRJG40mP3foZnMxJzUNfsudmsfTUYzvTlC6MoEjdD21NxEJaT7MFKT9+lVmrM/HkZy56BBJPYOAJZ+JC6JL6NqG8ZTCdcaWaAFjZzqO9KT5oDJpWY5OsseVANRuNjCbMvJgdKE2E53QP+aHmYITih34ciPOwd6t084FgSJ3VGxt9MuEilKXVQQF/SvEmKg4286zOt7ztuYzfDeZszGv2dVyQWlxU/XCsMK7c09LACICQTa/S0/YuJiMqW1qFU0LUYw2fka1825cMXWATmjd/M4NKgeZ2aBb/Ox0bIbMRiRgKEnQwqvcaoFd+L48HT1CNHiBFNu7JQoojuC4psX6qo/kkFCilPVhFXlqgHBdp+1HLGW7Ix2eLI6fnQJjIvIGqOgL2BNQRTmmMjaNxoSWILN0cBoFTjadZlXg3Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzhrSGpwVG01UVdGSGZQRXgrZzdqRGJ6SE03ZHIvcGRQVkVtOWNlZmlCVFdq?=
 =?utf-8?B?M2hGSEEvcHp5K0xZWDZXU1drWElkc1k5MFhiMC82bExCTXdnRlJhQlU0QVk2?=
 =?utf-8?B?bUJvR2dKZUx5RnFORGFQczJ6aUl0Y3Q5TmluREYvZnRsK2V6dXB2Z3FsOGor?=
 =?utf-8?B?V01zV3NIME42Z2ZzdEo3ak1kTFNZU2ZuMGNMNTcxcCs2WFpHem9DOVBWL3hr?=
 =?utf-8?B?QnBWWEFNK3Z6aXM5RW1JTU8wRWxmZEZ5UXJleDM0S3VXQ0RvYVRyU29tQ0FK?=
 =?utf-8?B?TVhxOHFKdkRrQ1dYaWFrVERUNm1DcVhVb1I5T01VSDI0TlVoRFB5djIxQ05y?=
 =?utf-8?B?WXVIS1Vqbkc4K1dUK1gyakthY2NHZnBuWFJSZnZsdHcrNGtqTEg0bkVRUVdm?=
 =?utf-8?B?RDlaMzJwemxZKzgyenM0bVM2VHdDb0lJc2lMMFRpQzN2Smwyd3k2WXdGbDZF?=
 =?utf-8?B?Z3J1Vnp6TW53bWJQdmk1TklWeVRlQkhNZ0pyZ1dmeG1FUHppZXNnWnNhVHVB?=
 =?utf-8?B?YVVoQ1pGUGZvZFFXNmkvQ0laWEo1RmUzVmsrcVZZSlFyUmMzMHV2YlhSTDA5?=
 =?utf-8?B?VmUxRko0Z1V2UE9xS2hacC9nWFNpUzlKdUc2UWJ4WGVWeFhPckprZ2w1UFJP?=
 =?utf-8?B?TGxFS1JzUXI0dWV3MGlYbFRQcktKTm1Ddm1Ud3ZlSWZDMU1kbDFXZHNUeE82?=
 =?utf-8?B?QzdHK3A2MHpHN25xOUxKdVpBQ0JJQ29ZV2d6ajNWdm1RcGlwMFZ2K29yUmZv?=
 =?utf-8?B?NzRkbThmTzE4UGJNdmQxQVZyUWFjNzZxTFZ0YUU3bnBsWFM0VjZzelpPU0xi?=
 =?utf-8?B?NkROa1UwblkzZlA1dGVVTXRxczZFZnVWR1QrUVlBSmZxVnFEQ21oZ01CM2Jp?=
 =?utf-8?B?S1B0cEhvejVzL0c0cHdNRjc0OHMyUHZMaUpQVitrSUI2dVBJR1RNWEtIMTVG?=
 =?utf-8?B?eHdHTk9KZHNhOWVqVmJBS3dwVWllTnVnQVhiTDhGUUVoS0JtZGdNaUc3NExF?=
 =?utf-8?B?M0ZkMzBwZ1c5eUZ4UzJIc0d3Y1hHOG9KbFF3RDNjaGlaU2hzeTVrQ3pGbDgw?=
 =?utf-8?B?Nmw4Zm5waG9hYng5MTQwUmhFbEcvbHBKdXJ3bmk3em9xVjdoRE85b0VtZ0R1?=
 =?utf-8?B?MjhlNTZTL0RZcVBVMjl3SERlQUNPanNMNFBFa3c5L1QrcWo2Y2VtMVBDRnFi?=
 =?utf-8?B?Um4rZndZMXc5MWhHSlB6aldUT2JRd29SSDc2SUdndUFtUk5ISzkwVkZCU1BD?=
 =?utf-8?B?SFFGVnFORDRISVNNWDM4M0wxQjIrOHVaQmtJeU0xOUtiZk5YZUhrcHFoOUFp?=
 =?utf-8?B?YzZ0YjhucTU4enZRT3kreXFoVU93cXN5WHJ2WVZ5TFhHV0xiZFNmZW1YM3M5?=
 =?utf-8?B?UWhVTUF4ZDRrdW1ab25rMEo5Z3B1ZGFWdGlwWG9FQWNHM0MxRFZPWUs5U1lz?=
 =?utf-8?B?UThlNTNRVE84TUNZTEpvYWgydHBPNnB3c25idGpSNlF5MHUvTHFMM0ZiR3Rh?=
 =?utf-8?B?WDMzU2JxTUYzaTJqQ0ZkRDBSSWJVU0tmd25SYXg3T1ZSUGxvblgvM0F2dUZD?=
 =?utf-8?B?RGRJQ3pmaFRQUTJBZit3Z29sNkJEVytRYkttcEtua2R0R2pNUDc1Y2U2MVJJ?=
 =?utf-8?B?UUNSbmp2RW5uYmkvVUZpNDdjcFZtWkZTd3RqTTRpbndDNDZXNU5GME9xS0x5?=
 =?utf-8?B?OU92NnU0VUpKTWtxMEVFYTRRK1I3UjNQeU1XMGFoM2dWeHFtbXJaVlRBS2ov?=
 =?utf-8?B?YlVvaHlQdHdQSHpGY1pFSTVtOG4vdGtaenNBbmF3RHVFSUdra2t6KzJoQTlx?=
 =?utf-8?B?R0FSRE5UNzRqbkxDYXV0c09veG5GdStwdXFCUVNLRmRtdVhuWENhV2Y2THpI?=
 =?utf-8?B?dmh6WENlVDc3TVVjZ1B4OWJ2ejVVU1U0RzV4YThIS0w0YytvbXVqbXl1Z2tu?=
 =?utf-8?B?b1o4VWQ5WXpMSnJybHBKenJmSHBqdHh2aFZNdkJGTEdjUmh2a2ZGS3lnTCtZ?=
 =?utf-8?B?NTNxZjBvd0dMdFhQR2NNMUxuS2xiZ1VsWVpBTjBsWGNDdGhpek4yNUxzQkNI?=
 =?utf-8?B?TkhIMFpoNGpRaDFiVU5OZGx6WlJIQkhsOGE0OENPRk1hdVpGbzJMbkRtMlVS?=
 =?utf-8?B?WG5WUGgzdVF2Ly81VEJLQkxGZ3BLL0xRa1NHUDJCRHQ5Tzd1MkRKeU1TUWpG?=
 =?utf-8?B?RFRmU2I0VWlGTXR5ZUt6a01nQ2FDU3FHeFpWYUczdGtvYnpXZlBnMU45OStq?=
 =?utf-8?B?M1JUZGx4U3Zqay9DTDU5KzdOc2lKNDk2VFBJOGZTSmI3cyt2Zmc4WTYzZjM5?=
 =?utf-8?B?b3hwd2FZSENvd3k4MWlYczNMUm5TakNzdEtGNGgxUXJObEdxOGRPQT09?=
X-Exchange-RoutingPolicyChecked: H0fY28l1O3uZW2ixXH8A3TzELrdpjvoh4OH4FGMYLnFVmkffDY3tNaZlstIZhwPjKxbg+TFw4PsIqXRqla/dGp4PoYYTQIanZOhU2cFxB3BqBjlb3wG0UYSOiOAT9wrIp720+zgupTCLmJXZ3VAGCX4FR3U4xpkHUoRxdvbm3B8QtXJ4t6DNuF6zt6JZsVCLmeMlYFww/C0mG3wYqDefceE2eiDqz7E7J9kSSLWlBd04laW1sqkYWglyXqjMfzSBx46//dKEKds+BVq0yqf64eGl1KusBYUtvuHK5I/95sTc0wVNOvVplJy6vYA/2u8aCM41EJDWnTj3HKp+vO8eIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a2663852-3980-49cc-9092-08de8e2bdff2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 07:13:42.6641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNofRcUD7sDbH7sFUAt0DxzmOrRleuQpyAQ0S0b+mA2A/Y9TwYY+EG7VARaQ7ifzGbo+sQv8BfI9riePNsv7xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6112
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

Hi Bilal,

On 28-03-2026 08:31 am, Bilal, Mohammed wrote:
> Hi Swati,
>
> For this random plane, do you think this patch will help?
> https://patchwork.freedesktop.org/patch/712144/?series=163296&rev=1
Not exactly, I have given review comments on this patch.
>
> If so, we wouldn’t need to block this test in xe and could also unblock it in i915.
Until we have correct fix, we need to blocklist this test
>
> Thanks.
>
>> -----Original Message-----
>> From: Sharma, Swati2 <swati2.sharma@intel.com>
>> Sent: 26 March 2026 15:30
>> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
>> Cc: Bilal, Mohammed <mohammed.bilal@intel.com>
>> Subject: Re: [PATCH i-g-t v5 5/5] intel-ci: Add *-planes-random chamelium test to
>> Xe blocklist
>>
>> Hi Sowmiya
>>
>> Patch LGTM
>>
>> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>>
>> On 26-03-2026 02:34 pm, Sowmiya S wrote:
>>> From: Mohammed Bilal <mohammed.bilal@intel.com>
>>>
>>> Tests are exhaustive and pick random configurations, results are
>>> non-deterministic on each run.
>>>
>>> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
>>> ---
>>>    tests/intel-ci/xe.blocklist.txt | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>
>>> diff --git a/tests/intel-ci/xe.blocklist.txt
>>> b/tests/intel-ci/xe.blocklist.txt index 80a0ee904..80cc98608 100644
>>> --- a/tests/intel-ci/xe.blocklist.txt
>>> +++ b/tests/intel-ci/xe.blocklist.txt
>>> @@ -132,3 +132,14 @@ igt@kms_async_flips@async-flip-with-page-flip-
>> events-linear.*
>>>    # driver does not support VGA connector types.
>>>
>> #################################################################
>> #
>>>    igt@kms_chamelium.*@.*vga.*
>>> +###############################################
>>> +# Tends to generate invalid configurations # using CCS planes or
>>> +configurations that # exceed HW capabilities resulting in sporadic #
>>> +failure with -EINVAL.
>>> +#
>>> +# Maintaining extra constraints for Intel's HW # is too costly in
>>> +comparison to the value # provided.
>>> +###############################################
>>> +igt@kms_chamelium_frames@hdmi-.*-planes-random
