Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FFD103A9A0
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 07:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEC910E94A;
	Thu, 26 Mar 2026 07:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7Eb1hdj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018B910E94A
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 07:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774509181; x=1806045181;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9VlC9ZMeeZBCwJVNaKtlNhro1jz/TEewfVQEk2V6wjk=;
 b=L7Eb1hdjuNSf3DKCvAAhGViCzBv6DO+ozyzXoWwqTf3HP2hr8N8pRhqR
 ijjn+2i7pzkpzsk7mQ5u2Pie5TcgXoBUH5fwALCOSn6B4gaa3Jl79Wg3V
 Yjrz+2WrgoCmQRC+nBgDknkw3M1vqwp7acBM4xpGznlsHKNreG545Sl99
 bU4ncjEQE54OgQkHhZlsZUg4GKMWdemULrHtDYvLr2t8YM0uD9c2KQIUL
 BN+cJF0Y7iJL54LKKfkH3nNa9Q6fkVDOFJH99iJ8r8r5IDQrGGfQcN0zy
 KvSSpd5nBZp0sh9h7/WQ+lUUu5Skw836bdJ+9jIa6LBfmD1hVcboZuYrL g==;
X-CSE-ConnectionGUID: N2GrcME3TJiIq8y/OEgiJA==
X-CSE-MsgGUID: YtKmalGqRw2b0y88JUrVEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86251035"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="86251035"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:13:00 -0700
X-CSE-ConnectionGUID: VxUWt7w3Qhe8XJZXhYBh+g==
X-CSE-MsgGUID: ofm/6M9eTCOmsxyc+uBTIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="262837069"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:13:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 00:12:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 00:12:59 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 00:12:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7bZZFdqAIqPqj9lLqcgfMoQRX8YTbtIFLXA6RDxJH7NAQk771TAQMnh1kHQWYKnGXnDCsNdT6FtzSXdtzl65qaKxbZcwa78VfiJgsUuDXlU8cWP5KCiNMW2/JleyDheUJrYODxPPOP8VrnFvnRRs0L6hgwgtx80dxVgJWMMbrat7GzAeiE8R+Nq3jRZj3ZyuunZRGTJ7nKvfQNsKrLhvpMbSP+cWS432o81jiCAWwzoj3g1KjKA0UvPswXIPY2gnrWJSJ5Ew2D2wIKRfzGMVwZj/gnGIfc1WyxH/kqYWFQOR8a6YFC8VdCoKLN5bG/cdQtKY5IvuS3usUCx/HkcXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhby8F4MoSazvekj5U39CL4YPXw3zm2KbwsWqpFeDWI=;
 b=Ljy3yMht8434bT5t8IYeV9j46JqdT+JcJLv+O2UpkrCcblKNisEpZ3GW2JFA0l2E+6BnXvKwVvsS7/Yz8ae1v7nOYS2RZS7nvvQqJhLtKXG/L+PbGzjlvoMY5+trnXgjd1sLrFw06+XxpkrJevvJ2v1cIknQRy9nhJbEnx6yfYYQpKwBJDZGA78x7TWTA8ldPpdGdqIoKhxTEl39tmqz7akist9mOO9W08UBTvua9mKeJZP618OawWUe1yXhVZY5uQKUvg8JvxBPHBB2GAOvqyWBPGVykeDK8atPK0syXP0po0oIJTz0ATemJgX0ciLlemmMc6L0gisNP6it99AaDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MN0PR11MB6301.namprd11.prod.outlook.com (2603:10b6:208:3c3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:12:56 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9769.006; Thu, 26 Mar 2026
 07:12:53 +0000
Message-ID: <374b755a-f834-4daf-9b3e-36d171c030c2@intel.com>
Date: Thu, 26 Mar 2026 12:42:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] kms/feature_discovery: Add VRR capability
 subtest per output
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <mohammed.bilal@intel.com>, <sowmiya.s@intel.com>
References: <20260121001324.118542-1-ramanaidu.naladala@intel.com>
 <20260320064342.772014-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260320064342.772014-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::15) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|MN0PR11MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: 3213ed85-0880-4049-9745-08de8b0718e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: RWktipH80JUepYxzu/LUZXN31iOBhamw01mSsISyA+DF/U2FybYovabteoQrT/8ZXkhhSqsS7ZMpgC5cGMG++mV4MuXG1Li7L6qH84U/8DAXHdMUdegwtwY9SubHptZiKsBJ2c3I5jhwk3YohVKh4UKCKPnxJUD5pSzqnZJ7u3efuE1vAs28Prh2EbkXQ9kzF6e3OfQWcopZKv+yscmzPbtbjk3hrRgSYDcaL4XUJ45Ndjx6MLa+hTS3kVil3JNpWQbHJ7b3irsU2DybuwGsl8wXKobC4vDvDYjNRuvGR173PDyODWcIPsVEw5+gn+YoMQCsXy3VT5A41chN8WROkE2I74P9kGhXmEWXTs+bP1KrBKwQI0Wva20OWQLw0Phq3hOvIdNFSDzvUkbfhsBrNLbLhqZyc0+n4Xg7Z92PrSpVTMpamzZxmvWs/2WsivnlaaeT/OFEl5CoM6tTq7qzBS2qJNOc7djv4HEAsBAdObAMVaqk2SNLso6+RG+Yc7ElC9gtahgqfOb0ZsUQ7B1d8VRDk3/ueqqYHoBxVdnO/les0d+klv2glIDk9zZpywV4MojfXzas/XR7C/y0uJ3LtpnzdvKma+QV7IowF+z/ZRbHx3oeqWR3EZqVXF+uCJp8YgkXnp3zZkD59ilhsjXsD58lIkNQ5+C7uZKDOXhHMGVIRgM9SnCOxbg0ukfkQSRtsNICbTHhjAYglN+xTN0JFrLuRo53ey28v/yMM0ktNwY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXFSOFo1MnpjaTF0SGEwT0JuN1ZLeFV6TkFoNGhBU1U5Z1FRRUF3clNORE5E?=
 =?utf-8?B?bGUrOUYzYjlnZ0FqZW9UbUdHWmZvODduQXlyUkc2RmRYZklSNXFxRnRhT0xR?=
 =?utf-8?B?UFJDNjZrWDJLZEdkT0lwdVNSakx4UCtqQjhnbmJUR3liQVd6UHcwMEZIMVQv?=
 =?utf-8?B?MUNKV1hmSVY2dmdJL3lINXZvWDZqYmJVOE5vVUZvY1NNZkJuRzNIa2cyOHdS?=
 =?utf-8?B?S21SVzVadVp4ZlB6S0QxV1pMbFQvZVpmNEc5RnlheUNBS0R2WE1wSU41UVBD?=
 =?utf-8?B?c2NhVjd6T0ZERmxPY1RnWklBY3NIL042YlVwT0IzclV2NnVYdHhyaU4rL2xo?=
 =?utf-8?B?YUVNeFlXamNleHFPbTZkNXpzMHNUbDNNOVpCcC9qcSt4TDFhYUNFZTF4Wjlj?=
 =?utf-8?B?QkkwNXUvVlNsK0E4V0w0a3l5WC93QUNyZmlSQURjSEZCTGZiV1ExMDBJMUdX?=
 =?utf-8?B?YlczVlVrcHAwMGx5U2N5TUZsY3o5RHpOdEZTVzMydHNkTkFtVkZnRFBRZlV0?=
 =?utf-8?B?SzdQenNKd09CMWtMRUZkay91M0g5aFBjNWp1U1JmQ25LMVpGUVIwMDFHR3ZD?=
 =?utf-8?B?UVZXd0ZMbWY4TytBaS9SWDFOVlVHdEVReGdsUVE3MmJnYTMySnp3WGJiOG8w?=
 =?utf-8?B?MHQ4emViWmgxLzhlVyt0NnJqanNRRmdiV2ZzTEVSaTZ4QUg2Z0xwd28yM0FD?=
 =?utf-8?B?MFQ1MStKRmk3OHhIcGJoUkhEQnluakpsOWJGOUNJVVFkWkdpUFJTQ2dkSjhY?=
 =?utf-8?B?K3ZBMVNtbTdQY01acXlCQXE1dWkyRlh2SUV6Z3I4d2Q0dWM2d2IxQ2xXYmI2?=
 =?utf-8?B?dUF6dkJsbDRrb1RDaVdtYWdHT0JSMldnbXRPdXZHaFBTSkdWakNCcWlZeFh0?=
 =?utf-8?B?NW5kZUVtNHpvNGRIU0NaRm5sMmgxTnEzejR1NVRKOGFFU2VHZ3diOW9JbzUv?=
 =?utf-8?B?akU3TzgzU3crazJHbzMwSG00NWNOSHVmQVh4bGxuZkFzWWR4cFMxK1BJL3FE?=
 =?utf-8?B?NlRieWxzNTRNKzR6NjJrUWFlRU5BZVg1M2FaVEdyY2VjYzZyMENlZjYvNmc2?=
 =?utf-8?B?Yk83V2VkM3NFcFpXTW9XMWNZTlJIOXNXeFJ6bFRmNUlNcjNyVWxIOURld3Zv?=
 =?utf-8?B?Z0NTWWo1MWJTWm1ZbE1Rb3dHT3RXLytENGZ0TnIyeTJHR1F5bXpPL0lZMXE3?=
 =?utf-8?B?eVR4QkJVQy9hL3IyS3BYMTJCQVlsZWZXWkZWVGRCMFErQWVXUzRJM01DbGZK?=
 =?utf-8?B?YXN1Q2c0RERlM0hUYVNzd3VUeUpzVTdLaHpLWWxMUElFUGR2Y2lLcWZvWkNa?=
 =?utf-8?B?azhhVHBPSGRyd1RlSUk1bUhrMXdQTmhPVXpiWEtRVDlOb3lUaXJxMFpraldj?=
 =?utf-8?B?cmx2amY4QkpCYmdFV1IxWTVnbjl0VWNBQkF1YVVKR0tzdjM1anhkYzdlUUpC?=
 =?utf-8?B?K0wycTBuZVdaT1VBUElNS1dHaytrY0tRL054dlRWcUVXdWJUMjFaMVJ5Z1J2?=
 =?utf-8?B?SHMwMTR5RWx6ZG9uRDcvanl6QTFrUVVSOTlFYXRUSFpXVXZnNk0vMld1bHox?=
 =?utf-8?B?N1kzVHAvUUJTVXIvdXJoU2ZYOWJyMEI2N1lvOWFabW9TWDFRanVwRzcybk04?=
 =?utf-8?B?OGJPZDhBZ2xXRCtzTGRibk5HdEVrakR5NVdlTzZKRThkL2ZhODg5SCs3Q2VR?=
 =?utf-8?B?UTJZQzRjV2NhNEhNY0pmUkFSUnVISVRiQm9ZTlRrZE1aTUx0aytGMEFnajNL?=
 =?utf-8?B?TDlENUlFcWkrWEdCYkNvVk9zeFZ3clZHRGZRUm1ac2luL2pCTnhxUVBIV28v?=
 =?utf-8?B?dFRGU1FYYTUzOURYdktaUFYwdVRYSm5sYlU3RVRYTXJkU2RrbzR6YkJvTllD?=
 =?utf-8?B?NmlERzN1V0kreDVqbWZ5a2FKUlc2WWhHS3I4b0pxNHBaNUpKSEs4Njh1M04y?=
 =?utf-8?B?SHVUdWxidFZ6Y051Rk5JWWFLVjZNc2JHc1paRDNUbWdnYU1laDZUdUYwUStq?=
 =?utf-8?B?RUQ3aUx6a1ZBdTNjM2tlNGU1RWVwMW9lTUlySzVkV002K3V5TVNLZTlxbmNh?=
 =?utf-8?B?eU9VV21lbXV0Q0dGMUxJUnpQOVgzRkRDZDdmLzRGOEFZNG9ibGk1MThkUkF4?=
 =?utf-8?B?Y2twSHMrSEZXTDVwQUtKVFViYWFBelpIaDdpM2NrNy93TGdRazJGanFSa1VW?=
 =?utf-8?B?MFBNOUFlYUI4SmlwdFdBZjRYTC9GZDJIKzV3ZFE1QVRJaXkyMWZvVDJZMzdS?=
 =?utf-8?B?dWlQVHYvQ0EzTk9hb0QvQlZtZmlDTnpwSlZ4dTdHckRjT2hzVXFBajVTTVhB?=
 =?utf-8?B?dG5BZG1NVElldlZtTGZxcERTU1VrWTNJSGpKRndpaWVzbUxsYWR4QT09?=
X-Exchange-RoutingPolicyChecked: dUSyiTPUDBFei892HgZkwD8RYgYJsRgfVH+Ib8tHW6Bdg78PtUgYW5tevXKz0sYJ5NpRz4koun/CpKnXSFEuBsWraxQJqn16bYSEbVzKojrggHnCEPSwenO2RQ12VUZMb2e6lL13R5eZkt7LqHRPWSyMCTxuBJxuueoX8N7gSv18+RfECjhcC8EKZRJll47cTT2Sztd5loEk4Aa2bEcLCwFYw5Ekbd1I7W0eZ2MB/g6g1x6a9BkDYM4XdwD5NReZJ7hsZPaENT4gS2s9j2p5gwXrYTGgE8RTMRVVyFyCIFUvN8vBfwVS87hwBfjnd1xX0Wgq2zeg6eWcmoXuFTiWtw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3213ed85-0880-4049-9745-08de8b0718e1
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:12:53.3407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UL9xBOFLDis7M7eHk17zsj/+cp6Dkn/sw5QMTygGITKOtjKJnU2D8OCnZJBPY4xJrqQJgLLjz9Q/dQAzFp5C1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6301
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

Hi Ramanaidu

On 20-03-2026 12:13 pm, Naladala Ramanaidu wrote:
> Add a dynamic "vrr" subtest that checks vrr capability on each
> connected output, skipping if the driver or output lacks VRR
> support.
>
> v2: Address review comments. (Bilal, Sowmiya)
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_feature_discovery.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
> index 28ec89c55..7b197b848 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -60,6 +60,10 @@
>    * Description: Make sure that we have eDP panel with PSR2 support.
>    * Mega feature: PSR
>    *
> + * SUBTEST: vrr
> + * Description: Make sure that we have VRR support on output.
> + * Mega feature: Adaptive Sync
> + *
>    * SUBTEST: dp-mst
>    * Description: Make sure that we have DP-MST configuration.
>    *
> @@ -157,6 +161,21 @@ int igt_main() {
>   			igt_require(psr_sink_support(fd, debugfs_fd, PSR_MODE_2, NULL));
>   		}
>   
> +		igt_describe("Make sure that we have VRR support on output.");
> +		igt_subtest_with_dynamic("vrr") {
> +			igt_output_t *output;
> +
> +			igt_skip_on_f(!igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE),
o/p is uninitialized here.
> +				      "Driver does not support VRR.\n");
This doesn't look right. Can you check if we have some CAP reg to tell 
driver's capability to support VRR.
> +
> +			for_each_connected_output(&display, output) {
> +				igt_dynamic_f("%s", output->name)
> +					if (!igt_output_get_prop(output,
> +								 IGT_CONNECTOR_VRR_CAPABLE))
> +						igt_skip("VRR not supported on this output.\n");

Instead of igt_skip we should have igt_require(). Please check how other 
feature discovery tests are written.

Follow same pattern.

> +			}
> +		}
> +
>   		igt_describe("Make sure that we have DP-MST configuration.");
>   		igt_subtest("dp-mst") {
>   			struct kmstest_connector_config config;
