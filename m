Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E74FCF34AB
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 12:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC3B10E5D9;
	Wed, 19 Nov 2025 12:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FsyelNKr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BE610E5D9
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763556983; x=1795092983;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+58ZIRkaOk3nLhXlaHRy3vseqBNJbHTU6PJhjQD+yPY=;
 b=FsyelNKrJa6kqqL7fF3zcvV1ZfzVsCobnXJ4c8FeBneUTQWSOBntCwjR
 V8ddK3z7CZltRGWjd32ybKwPizJtn2fuyO+VENoYEYru9Y8fkVf5zBwF4
 EZgKC2VO/pPXHEO1O/LMtehpdbyTWModUBcqSzMFkq1YhHCofuLpC++/k
 bTUnuyhgWQbdMfOL133LQwncEJlIZ8I1CzlBoN9t/EmA1aHJWYTmCjGjj
 tYVxkcYPIaEX6I2YkVAy3lvOenG9mndG6RKrWAW0Pn/QoqjFoBrynNFci
 zT0IqUtJr35LoXiXUQx86pL9fXa8gEJB43injdbzTkag2gN/Ou/BBurxU w==;
X-CSE-ConnectionGUID: vjMhZcDOQnq3npzQKE+k0w==
X-CSE-MsgGUID: LKGpeMazS+q/NBp98OFUIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65687216"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="65687216"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 04:56:23 -0800
X-CSE-ConnectionGUID: LfgBj53RQ2a6zRIsxxYdMw==
X-CSE-MsgGUID: eSmgYXRDSP+MMksKEMZd0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="195355829"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 04:56:22 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 04:56:22 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 04:56:22 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 04:56:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/9LPkaNMUwFGvJdvQH3sF03+goYQ2r1Hy0agCKk7Zqmllv3k2qid4FCvm4X4MZoS10tJNfnZo/lqVY4KgM9fLhLQRSKnV7QFwKgG6G0h1/fny1pZpEqLPSVBMNsqArwIbBqvq628H1ZBBfKZIFn9tTxXvWyy13pHLiLj6bG5aHsoRVIsQdNX9AosYKIMFHhNE4WB7N8f8YuLNfKP8a4fHGRbQVVp9XC3VXihJXFnb5sfhkcmuM2q/S9HZg5RBQXhtu70uy2e75FUc63yaA+UNcgUt0T6RWsLwLTfFUVpj99PL/cirRf76GTjTThPfc+HGNi6cuRm6jQoUxlS58fmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9m+G2b6OMtBkCiaJv89XruRdEpEOnemJHu7q4lmTFA=;
 b=FFZmdTX0qsiOedN2MluYvLWJpPwcOhTWyQi6VMBAY6tZxOknzjvh1+ptesYVDCoS6XRRmGeUNNIytpJZlCV+xNGTMqKFVtE0XeS209tMjrz3wdScGsmSJswlx8nQr3fqHAer7ohjpPz234SPiHaHJsrJi4zz3AErRRJmsJzYK++Zv6OBra2lONxgCYirri86Mm4EEk9qULu7+blyUBd+tqhBjgdh7BZ1MsgZP7VFhMWC5G94InM7k38liZbMf0ZAkKRo1Fof/jDNE07QmgPdh1xgx0AhLDvjJJJ8pNgOMPDCOib/gDL4SLLX3+28Swdv0+E1DEHYMnxmnynTvLoQcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SJ2PR11MB8449.namprd11.prod.outlook.com (2603:10b6:a03:56f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 12:56:20 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 12:56:19 +0000
Date: Wed, 19 Nov 2025 18:26:13 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: "Wang, X" <x.wang@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Dugast,
 Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH 2/2] lib/xe_spin: Fix mocs index field in mem_copy for
 Xe2 platforms
Message-ID: <aR2-bUaoRjDBsO93@bvivekan-mobl1>
References: <20251118142522.3957318-4-balasubramani.vivekanandan@intel.com>
 <20251118142522.3957318-6-balasubramani.vivekanandan@intel.com>
 <SA3PR11MB8046AA5502D6CCE3930773A986D6A@SA3PR11MB8046.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <SA3PR11MB8046AA5502D6CCE3930773A986D6A@SA3PR11MB8046.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA5PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::19) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SJ2PR11MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ad1827-131c-4fa7-a674-08de276b08e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODAxUW5HYjJQaU9vZU1VTlIrcjMyZ1k2b29CTXZLYkNkN0VGZkphYjE2Nmwv?=
 =?utf-8?B?ZjZ3VllHKzlja2NkYmk4TmlUNFk5bTZnTEtNU2M2VFZ1WXh1V2hwMGZaMVYv?=
 =?utf-8?B?eXBnSEtFSlNiMlUxdFVidWFEMDNYb3IzdWtYQTZqV3N4Z2NoUzQwVlZ3bVNY?=
 =?utf-8?B?VUhmc2EwQUcyZWFZaDh4Y29DTHZ3SWZWbzNSUlVOVG1wLzE4aFV0aTdhZHdI?=
 =?utf-8?B?VjdHOUhBRlR0SDJsQVoyRG9GRWxGZ3N4dERCUUtpWldFcXQ3K2h6Ri9qNXdX?=
 =?utf-8?B?T1Q5dW14bWJSbTlEcTQrM0k3MjNWN2c4TWxYbUwvdlE4K2FINHFvbHl0QTRt?=
 =?utf-8?B?NnduSEdaNTJpamQvMWVFWjF0Z1JCNjNOUDg3blFZV2xvaTREd3dCSW1EWnhQ?=
 =?utf-8?B?TkJSZk5McjZFZUc3WjBRbkp0UzkzSkY0YXJvdGxCSlBDc1cvT01KMVAydUQ1?=
 =?utf-8?B?RWJrZy9yTENpdURYdW1RMnhIb2J2NWVNNS8vdnZDM1UwYkxuMEtkQjJvY3A4?=
 =?utf-8?B?MVQ0WXZ1Q3AwcW9aeFhWUUJRWWV6RitLMDN6T1ErRTlQL1BvODNUT09CUk5H?=
 =?utf-8?B?TDR2a05vTHdzOFNrc1V0eVZiQ2thZnd4Tkl5ekhteVBnaERQajE3cmZ2UEtr?=
 =?utf-8?B?RFBkaFA3eWIvQmRsMVpaRTd6VWgzck95bTFxbjh3ZXl1bU41RnZIYjg5Q0Nn?=
 =?utf-8?B?REVLTCtCNTNNRnpMRk9EeGRiaDVZc1VtM3VkeWlNd0trK0tZc3NXZytMQSt5?=
 =?utf-8?B?M2NzTkx3aVkyOHVJUXllaXhYU3lya2x1WG9qMkZSN1ZVb2hBdy90MUR1OWpt?=
 =?utf-8?B?dUsycklIS2NOTkJrM1Zvd0N2MVBJT2ZaSjVWOFFmM1QwRDB5a0pRd1l4V3Vz?=
 =?utf-8?B?eEZIU3VYTzF6K0FjLzZyRG5MK3ZRS3dCcm90WU9Wb2Zyb2JyUHZMclM4WEdq?=
 =?utf-8?B?dXIrd1dmOTVGbERKL2RQMkgyKzVOYXZMbjZhRXh2dTQrMWR4QzdLaEVhdEJz?=
 =?utf-8?B?UGRyam1YdjJBRGZRMmkxd3lvdjVwVWpNNmtPem5kTnB0alA4dHpLQUxmeHJp?=
 =?utf-8?B?cWlBUU9YbHRWWmk0eUxVVFMxUlQvbWFYMWUzR1o1SXBnNUt1eDFlNkRqaExp?=
 =?utf-8?B?RzJkY0VXdFhqaWYxVUFXVTg0bDlXZ0ZOUHVUUFNxakJuWjZBNE1iTkxidXpH?=
 =?utf-8?B?NWZ0eGpMaS82dGVnWGp0L2N2UVVYY281Mlk1ZGxtd2UxWmlBYW5OTCtvRmxO?=
 =?utf-8?B?WWdrQk81RU5RZUtWZ1UzejBGajhBV2h2Q241M1g5SW0wS0FsbWtkVmJrSlJh?=
 =?utf-8?B?VlRSMERYaGtvbmYzMUFQM3JjbFk5V0VBMVdqZi96RGkzN2picWJzZE5vY09M?=
 =?utf-8?B?aHMrV3RodFRUMENzNHlNZ3dLWElmVkhWcWJ6dVZQM3AwRVNRZUNxdy94WFNq?=
 =?utf-8?B?UnRjZm85YUtwUGc5MkJZZUw2Yk40UzRKZGlLY3pOVVkxTXVISFAvTU5ncXcz?=
 =?utf-8?B?NTIrVzVKRW9KU0VKY3JVeDlPM0dGUjk4M040ejk2UW16RkNZWEVBSnZpN0xN?=
 =?utf-8?B?S0dQN2FOejk1di9BZEJDa2kxcXkyWndLSTRyOElSckNER09EemIrS3dZeTVj?=
 =?utf-8?B?VUplMkpzMi9NZ29IYU9KZnZ6eUJoTkczWk9PSEJnNDN0dEI1SkFIWkxrZUZL?=
 =?utf-8?B?a28xUm94UXBOaFFtUEtJK0hteW1yd2VzMGF6NmlYUHBqaEJLaWVtL3NoRGly?=
 =?utf-8?B?WUtPOG9iZGV5enByVW5qei84UjhrR3pvRGpEV0EyL0VqMGkzazJBVGV4VFdu?=
 =?utf-8?B?V042Qk5Ya0p2b3RIV0s3WGs5WFhlMVZDL0JYWGVVWkRSbUhMamZJNHErTlIr?=
 =?utf-8?B?YTExZmVNS2xQRzdDRWlDSHU4akNVOEJJOGRXMDFXbTl6ZkZpTHoyZFN5WWhs?=
 =?utf-8?Q?wt4btWCC+nvTuOik0cqZlq178GfdJOxB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWtxRXhvVUJsSmJtYVJzU3VRSmw2RHEwZmRhMWlVOE1ib3Q5dlo4YmVySG1z?=
 =?utf-8?B?N2xYZDd6V3VOWXh5ZzJNRUxUQ0p1ejhNUEZaN1l3aTRWeGFtRWJWYWFHZEln?=
 =?utf-8?B?U040ejBHTTZTQ0ZXdVZJMTRBcW1XaU5VS05VRDRKZ2p1L0VvOXFoVmV0ajlp?=
 =?utf-8?B?aWJzREJTQzk5dHRDQnF2NTZ3U2FUNTI5UGZhV0dQekh0OVJ3MEhDQythNWpE?=
 =?utf-8?B?akxMcS9XU3dhZDl4QzVXZjVzdzJwVDRLaHJWMEU2QW1pRWhBaEZhU01BbElF?=
 =?utf-8?B?VGh2SlBJT3BIVi9TdU1rYk93UWNFSEYySWl6dkY1K0dKVDNHVWZnNjZVMTBy?=
 =?utf-8?B?bEpxSGFERk55azYvUklOck56SWNFTE55ZGR6U2M0dVFRc2plcDZZcFROeFZq?=
 =?utf-8?B?MElpOXltcUJpdUR0UlVsUEFuQUoyK0lRQWxFbnZSemwyck8xNmt4UXVqby85?=
 =?utf-8?B?RmFuNkRyNkpJNWRyNkx6bTRDNmgzTDlRS3ZXUmQxZ1drU1laWThjZlE4L21r?=
 =?utf-8?B?OHdPTXNnNzY4QXpSY042aExIdnVkdVZmNlMreC9jQ0lwMnMxdHJtbmowQU5Z?=
 =?utf-8?B?NGxpYUVoVlZpZUVSRUJ4bFFsUTZjUit1K2hyTkF2bU01dE9Fd3JKVVRGa3lZ?=
 =?utf-8?B?S09NUXlKNDhkL3FCMHAwbGhxYmpkYWhqRll6bnZWMzZBZVVZaXR0ZTRVMXJD?=
 =?utf-8?B?cExoOVk0cFM0K1JvbkM4WEh2OXQ1ZFRxVkpqc3NVMmt0NU9yVWlUZkxhekkv?=
 =?utf-8?B?MnhRbE9zM1hUNFRaa21ocTV1VUpmdXZTU0ZWYVgrQUd1V3FLbWFhcUN0enlB?=
 =?utf-8?B?RUtxYUlRSGFmV0JabTdQaHg0RjM4a3NKd3dDZWZEZllHR0o1djdpTEluYlY4?=
 =?utf-8?B?Q21ZNHlUVk1vZVBDMVRHNlVFZG9rcXpETlZhM3dzUDladFptN2V5UnIvNkdZ?=
 =?utf-8?B?UDZybXM0cGYrYVQ1ZnRvSUxLbU5jK3ZTZW1PU0RWajkrblFGUTlVN2xzVU9y?=
 =?utf-8?B?ZWtQZG12Zkk1TzZHaXhBbmNVYlVGQkxBbFAvOHNrQ3p4c3JzdnN1b0xpVXc2?=
 =?utf-8?B?bW0rVGtmekVIOVNwUWc4WWROMGV2V1cvVHo3cEgwclduc2lTa3JoNW10OTUx?=
 =?utf-8?B?RlVUcGtnK3NSVGI1cEFrSnl2WDViL3R4RFpvMUV5VTFjOVdTUndyTVBJc204?=
 =?utf-8?B?MEZKc3Y5TUp0ZlkreklrVjlIVE80VFFuMjRIWWFaUms4U0gyLzdCYzZsTUhs?=
 =?utf-8?B?emltd1JqcXgrU2ptZW0wU1o1QXhhT2pRekw2Zi9tYzFjVmVpWkxBRktqS1p3?=
 =?utf-8?B?YTRwMWhCVnp5cU9BNnp1c2ZZbUVleTNCWDRJRXVQWlpGaE95M1N4dXlOUml5?=
 =?utf-8?B?M2pJTnZYMU5TMk1TbGdVd0M4VDh1dVl5Nm5rcGV2UVQvZFBBUkJKbVFkWjMr?=
 =?utf-8?B?eElkcjN0b0YvWTNpek04U1YwZHBrQ0hGc3BZQ2hacEdFYjRMM0pZZzVNMUdF?=
 =?utf-8?B?NWYrSm1IYzhDeXhWQnlsZEUvLzE4amZKdTJpYmJHMC9aaWkwWXF2TUZJRXg2?=
 =?utf-8?B?WG9hUE0zUFhuL1BCbUYvMWhXVjE3bWw2NlpGTWlQS2NOSmxndlR6Z2dZUFE4?=
 =?utf-8?B?M01RalVzY0crbDJNMXY0UkJYM0pDYk9yN2ZBOWpyVjUwd0hBM2VhUGlBeklj?=
 =?utf-8?B?VmsybjVOZ1VrWUZLcjJ4SkFqRnlLbVBGTENoejV3L1VkazJ1ck5kRktxSlFN?=
 =?utf-8?B?eHJuUVUzMlBweXgvdmtIUUpEaEVqbjZsb0FxYTJxK0g4Mng5MnJSYTYvUkdh?=
 =?utf-8?B?UThiUXdObVBOaWt3RjZJMERyRWJvQVhjQWVZK09iTkRJZ0gzWXNlQ1NiMnVQ?=
 =?utf-8?B?Y0tVWTVQMXJSV0NmNG9KbGw4aUVrM0c1dTFEa2NMSnZqS09xZXNFWW5Za0Zu?=
 =?utf-8?B?bCt4a0s5SUp6MllzOWcycElBaTdQNHBUTXdBcUlGQ0lMS1N5aFVBU3cxakZn?=
 =?utf-8?B?dDRSVEtJZkg1QmxmbmtVeXpxWGo1clJVN0tJRVpZZTl5TGp2K2g2ZGhCK0xq?=
 =?utf-8?B?MEVENlhwZlhFTG5rbnNUTnMrS25lUWF4K3FCVzl1WkRTWmxzL2NzRWxVNU8w?=
 =?utf-8?B?dFN0NWlGekdWQ2J5S0V6eEJqMis2OHR5ZS8zckpydHF6QjFTRTg4eGFuME1r?=
 =?utf-8?Q?mcAcwOgwPDm33RAbW/Dx3ek=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ad1827-131c-4fa7-a674-08de276b08e0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 12:56:19.8798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNRGflFEubXF5R2pAOeBvyM5sTzGCI6y6rxzuG/GJT9milH/2gwOnEuV5speOjSvbiILqWFAEAc30ecmaYiKm1sxt8JjmFpuyTZWIOFr6M1lXqnkp8LEwDiU/+zLuoxS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8449
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

On 18.11.2025 23:24, Wang, X wrote:
> 
> 
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Balasubramani Vivekanandan
> > Sent: Tuesday, November 18, 2025 06:25
> > To: igt-dev@lists.freedesktop.org
> > Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Dugast,
> > Francois <francois.dugast@intel.com>; Vivekanandan, Balasubramani
> > <balasubramani.vivekanandan@intel.com>
> > Subject: [PATCH 2/2] lib/xe_spin: Fix mocs index field in mem_copy for Xe2
> > platforms
> > 
> > The source and destination mocs index fields has changed in the MEM_COPY
> > instruction in platforms after Xe2. So we need to check for the IP version
> > before placing the mocs index in the instruction.
> > 
> > Signed-off-by: Balasubramani Vivekanandan
> > <balasubramani.vivekanandan@intel.com>
> > ---
> >  lib/intel_blt.h  |  4 +++-
> >  lib/xe/xe_spin.c | 11 +++++++++--
> >  2 files changed, 12 insertions(+), 3 deletions(-)
> > 
> > diff --git a/lib/intel_blt.h b/lib/intel_blt.h index 54a096c03..2fae045bc
> > 100644
> > --- a/lib/intel_blt.h
> > +++ b/lib/intel_blt.h
> > @@ -53,7 +53,9 @@
> >  #include "intel_cmds_info.h"
> > 
> >  #define CCS_RATIO(fd) (intel_gen(intel_get_drm_devid(fd)) >= 20 ? 512 :
> > 256)
> > -#define XE2_MEM_COPY_MOCS_SHIFT                     25
> > +#define GEN12_MEM_COPY_MOCS_SHIFT		25
> > +#define XE2_MEM_COPY_SRC_MOCS_SHIFT		28
> > +#define XE2_MEM_COPY_DST_MOCS_SHIFT		3
> > 
> >  enum blt_color_depth {
> >  	CD_8bit,
> > diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c index 72b13ef42..1b12ce991
> > 100644
> > --- a/lib/xe/xe_spin.c
> > +++ b/lib/xe/xe_spin.c
> > @@ -54,6 +54,7 @@ void xe_spin_init(struct xe_spin *spin, struct
> > xe_spin_opts *opts)
> >  	uint64_t pad_addr = opts->addr + offsetof(struct xe_spin, pad);
> >  	uint64_t timestamp_addr = opts->addr + offsetof(struct xe_spin,
> > timestamp);
> >  	int b = 0;
> > +	uint32_t devid;
> > 
> >  	spin->start = 0;
> >  	spin->end = 0xffffffff;
> > @@ -163,8 +164,14 @@ void xe_spin_init(struct xe_spin *spin, struct
> > xe_spin_opts *opts)
> >  		spin->batch[b++] = opts->mem_copy->src_offset << 32;
> >  		spin->batch[b++] = opts->mem_copy->dst_offset;
> >  		spin->batch[b++] = opts->mem_copy->dst_offset << 32;
> > -		spin->batch[b++] = opts->mem_copy->src->mocs_index <<
> > XE2_MEM_COPY_MOCS_SHIFT |
> > -				   opts->mem_copy->dst->mocs_index;
> > +
> > +		devid = intel_get_drm_devid(opts->mem_copy->fd);
> > +		if (intel_graphics_ver(devid) >= IP_VER(20, 0))
> 
> NIT: could we use the existing helper intel_gen() ? 
>  if (intel_gen(intel_get_drm_devid(opts->mem_copy->fd)) >= 20)

Both intel_gen() and intel_graphics_ver() are both checking for
graphics_ver. intel_gen() was created for legacy platforms where the
graphics IPs where identified by a generation.
Modern platforms has a separate version for each of its IPs like GT,
Media, Display. So I would suggest in any future code, we check for the
IP_VER instead of generation.

Regards,
Bala

> 
> - Xin
> 
> > +			spin->batch[b++] = opts->mem_copy->src-
> > >mocs_index << XE2_MEM_COPY_SRC_MOCS_SHIFT |
> > +					   opts->mem_copy->dst->mocs_index
> > << XE2_MEM_COPY_DST_MOCS_SHIFT;
> > +		else
> > +			spin->batch[b++] = opts->mem_copy->src-
> > >mocs_index << GEN12_MEM_COPY_MOCS_SHIFT |
> > +					   opts->mem_copy->dst-
> > >mocs_index;
> >  	}
> > 
> >  	spin->batch[b++] = MI_COND_BATCH_BUFFER_END |
> > MI_DO_COMPARE | 2;
> > --
> > 2.43.0
> 
