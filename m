Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C478FC02194
	for <igt-dev@archiver.kernel.org>; Tue,  4 Feb 2025 14:02:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8227F10E5AE;
	Tue,  4 Feb 2025 14:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UwNvVsDk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CF810E652
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2025 14:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738677757; x=1770213757;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HOVySS1WfS0uC2IrVzCP80WVDFGCwIOqA/YzszEdNq0=;
 b=UwNvVsDkCF129xlK3Y+6vD2Lhi5NycZwiOX4VqLLselOBDSCLo/LiY/O
 Xg0yy45LNi7tYSSvCrhOxu9D0f3qh7hl1kMQZca9lWHn8ibUDC17v53R3
 kD95rmiES1aQGX6LlNfRgeQGW03IqCBoGc+o2Jgi3AkvobuUa7NCwuRsi
 JZZje8s6EGm1Nus4w3NRe8ORD7Vr8tNOlmvr9uj0DZz3or1Al7hcKi+BK
 lX6kz55iw54dYGTY6syMVyfC15rbzDBcxUkULxEsmOPy8QeGF1me5qhYq
 LXFsBVYw+g+S7fE6hMhw2VpIWSSYwMvqAA2sA21qs6YQeSP/Ywr8i59aX w==;
X-CSE-ConnectionGUID: L7YahIkcSse8YKqkRQrhUQ==
X-CSE-MsgGUID: slLTKcy0Ry2tucUp6aSWTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38415353"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="38415353"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 06:02:37 -0800
X-CSE-ConnectionGUID: rUuU/2L1TrGWKBx6paSrxQ==
X-CSE-MsgGUID: F3gE9wa9TgSLIxxr1z1Z2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114663429"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 06:02:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 06:02:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 06:02:36 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 06:01:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1ruyC42OC97xAgNkHUYtNICkIcgYUQBhwcOIlhutbor/E3UOJxI3iq+2IawxvJmd4H7LQpNB818LrOszg3u5v2l+QbxMukbtfKVyIGnlAsz/kl2r3vH31rQ0+FrW1wG03D5+RCWtW6vh3aihYe2GuJAl6Gwkl/3bPPMMemgDHolVmDQt11ydmmgGyFRC8ZIM1KvfqVmEcxCp1fdaJ3zRRHdmDkaYgl71Z/H2wvKy3rOJmhQPDd2k4bcTihogR8CzqOig/xfL7brNjoUYo85sO+5sVScPGqsNfyZD3m6zMHeUyG51egwOi15yABVoXIaWoKTBOpMS2P16qEMmsUZ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PL9pQt2Zf9Uuf8FaihRM84O5n94Z0JuOHVHS2xoVPcA=;
 b=miUnzG2OJFoSYPvOUyKYEYLFry/HApIzXepBtshMaV7moWbrWvQxJvh6rrvcFcf1DjNUCLImec8/D1Giyc5YBKkn71Lj4Cx8wcy8lrKbXg0A0mbbwjwRuPd+hSBBxia4wTGeBHxBVNrc+InxMio4oywXIDsvu8zD3e1o+qO8+RCVB4rOI8sTYMCMy9BRl0utrHKSw4eD/X+8fPLe3Q0Mx9KhPp4H5GjkHmJe4rgFfVocdJlZOTMWCz7giGkHe+K3n7UKZfTbGjLQzgzeNyuX2EJtRDz/WE/3NgwxGaz0bLgL1o73vFC/F3+37b1iIZ9D7I/FNZEGkphprkk/KHOroA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA1PR11MB8351.namprd11.prod.outlook.com (2603:10b6:806:384::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 14:01:53 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 14:01:53 +0000
Message-ID: <c510213b-ce8f-49ea-8bd6-12affa80186e@intel.com>
Date: Tue, 4 Feb 2025 19:31:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/5] tests/intel/kms_dp_linktraining: add tests for
 UHBR/NON-UHBR over SST/MST
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250203081241.659139-1-kunal1.joshi@intel.com>
 <20250203081241.659139-5-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250203081241.659139-5-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::13) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA1PR11MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a170d8f-1a1a-403f-3277-08dd45247a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWltSUM1OWh5a1hIOHBPcEk4MHZBOXRydS94MnA5SDh2azBDK0tmdjdaM1ZJ?=
 =?utf-8?B?aGNaa3RPRDFSWVR3UlRCMi8rS2NONnhWS0NudHZqVFd0ZitRUHNZVTNncTRo?=
 =?utf-8?B?TDJjRUJzVVNnWmJzcTNwZWh3VUY0N1NsNFVkN0h6VW13MTQxQk4wZ3BySndu?=
 =?utf-8?B?cHk2dzV6eEJIL1A4dGY2Z1pKNFNRWWdmRGRYam1pdDM0TEdoQ09OdTFHbjVQ?=
 =?utf-8?B?MmxTVjZET0dyaXA0akxPNW0vcUx0WjJES3kyMjFGbUhJenVmZTJGakVzZ1ZQ?=
 =?utf-8?B?blpyZFgxVzlQSnlBQVpqT1BsRnNLNlZGRFQ1eWN2RUVVa0FxQStabVRxeGkr?=
 =?utf-8?B?cjNGdGdOMXpjNk1aUFRqdHhjT2ZaTGN2QU1hVXZMYXF6TE1oM25tWElUT3Zw?=
 =?utf-8?B?Q0pUNEVjem5DNnV1L0QrL3Y2a0d0cE94Rmd5OFBqUWFLZ1dydWtRL214eFE2?=
 =?utf-8?B?c3ZWcFpnZGc0MEZOVXV2UHdpVUpQaTVwTWUzWlhIOTJHTTQyNmZmQklRd21J?=
 =?utf-8?B?MTZTZmtLTGZscUxVbzhxZzlRYXBUeEtVcnUwRWhyV2Q3WDhMSGZkZ3dMNEpS?=
 =?utf-8?B?U1Fvdk85VFdISzZrelY5QUFNdStsOTk3THBmN1YvLyt3VndJd0U5WmN1aWJa?=
 =?utf-8?B?QlB6dnVuUitpSi9LdHJQTFNJOE11czA1WUFhVDllWndnUkQ1M2E4MHYyWS9p?=
 =?utf-8?B?Qkw0V3ZHQlFCc3BFVjFldFc5V1ZySGNsYjhRZVJCV3NUU1JlSVdhT1FRaXF0?=
 =?utf-8?B?WUZiSzZSME1MdGtmbmFxSXNMWHRBbFk3YlVpR2NIcy9xZDdoTG1aamFnbVJM?=
 =?utf-8?B?Q0l3MHU1dnhlSXF3SmxNQkoxUFFjQmczWnRjSkgzTWplRWxXVmlsU1V4RnVh?=
 =?utf-8?B?cjRzdHVrSVpGOEpPSUV2ekwzVndvWVVSbThxdTZJVlltMTh5bFpLSkZsWExW?=
 =?utf-8?B?S0E4SWdYM0Nybnp5djcxTzk3Wk9sckNjQXM1dDdNY3BUTG5DaEtYODZRdVA4?=
 =?utf-8?B?RHdhb0NwY3czcjVLOVhWTkpIbEF6VDI3YTFreGtOYVQvcUxvVmZmZ29RbFFD?=
 =?utf-8?B?VmMvSUw1QkpKb3htVEZvZTRQUyszZjBRZmN0VFVNM082Ti8zR2NUM3dTL3E5?=
 =?utf-8?B?R0tsZDNoQlh3Z0NlQmx5V05ub0cxRCtHcEl3WVduelRnRkRObWZPM1RDMjVX?=
 =?utf-8?B?VEF0b2M4UFFwcEd4by9LWFJUVGJIb2ZqR2t5eWdQeEVITUhvUnBUVWduWUNY?=
 =?utf-8?B?cWlwNmREMjhDMGNnbzE5dTMra0xVaFJkMmRoRTg0SFJPemMwY0VFc2h2SXBL?=
 =?utf-8?B?WG9ZbHIwRzlNbU8zTFVERXJpYXNDakpDVkJqSmVOaWtIdlhhY1Z6RnB1ZTli?=
 =?utf-8?B?UzMxV1ZDQ0F4ejZlNVhobnBNL1JBSW85S3poZkxGNXVEN1RsU0pyWjlMYkU0?=
 =?utf-8?B?UUpOSjhEdDZHK1BqSlhlTlZBMktnNlI2OEhNcDVYZVpCbVAxQ3BPU3ZhQjc3?=
 =?utf-8?B?N2hrZ0hNRnFqVTZlV3Npbkw2SndINktZMmFaemJrVTc2MERQbElSZGRYWTBj?=
 =?utf-8?B?ZVQvaHU5VVJIeWlrSWlEQ2IxblRQbHk1WThlSnJhMFFteFFUREdoeFh5QUFF?=
 =?utf-8?B?OFRnTHk5T2pPbUY5N2FGdk1mOXRDdi9mMFgwZ3ZHYnhPbWpZdWtpWFFyTWxh?=
 =?utf-8?B?NEt3VlpMYVM0L0dJNUJYbXAyWG9LSXl1QWs4endaZWZpQTRlU2dUWWFCZWxB?=
 =?utf-8?B?clJFdlhZS08zQjlESXVrVDlpVVdpZ3FRQ2QrWTRwVzBRMDJYdmwya2dGOWNM?=
 =?utf-8?B?SXJGS0RBYjZKUGxhb24ra3dnZEJQcHppVzRLZVBPU1NhNC9aOXZDMERnMW9l?=
 =?utf-8?Q?vTOebtWjM0zUo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWltZTJXR2owMGczQ251THI4eEc5dWVQMlZDTG10SEdja0dNUVQ0dW0vK1JG?=
 =?utf-8?B?YjNmc0VFV0JXT1Z5OFBmR2ZWMnUrbU1pTXVFMzJUbjRPZk50Wk5QU3VFcEpX?=
 =?utf-8?B?ZDR4M1JtWlJjVXErVUNvbEpCRHZVekxXZ2FtaVI5UEw0eldqN2hxMFF0R3FE?=
 =?utf-8?B?dmJ4SlBsNWtZd2FKV2l2TldZSkZZSmtDbExRUHgxYXZPL0FmeWh2SitMUTZU?=
 =?utf-8?B?MnJUZ3d3WFJueldSNWhYanhGUlVhSktNUW5kY0xPL3BUTVpWZ1lqeUF6NEMy?=
 =?utf-8?B?TThMWmhuVHNIMCthZGJaMFpOQm5IK1Q4MWZEemtGcnR5dnRQWE5qWW1JRXdF?=
 =?utf-8?B?dHNTbjJFVTZjM1UvWlFzbTBJRUwvbm1xcnNXNXlqTE5ZZjB5NFZ1c3hsN0Zt?=
 =?utf-8?B?QXRhTmx6T0NhY01IdkY0MTdLeW5oa29ScUo0ZTZ2YXQzVVpUNy9vVmRTNnVM?=
 =?utf-8?B?M1hlbUozSFZQNkxWMWF1ZGE1U29JZFU0ZTdiNUM0Z01VUUpVSHo4SFc2NW01?=
 =?utf-8?B?NGtlQmVSMlNDQVYwbTd4S1pZSGI5M3MyVzlOTjQxQlhLMTFDTXVCQmx5N3gv?=
 =?utf-8?B?VE4zMCtXa04zU05iMmFJWVdjTUxVNE1LR2ZMOUE3bEVOazJNVU1jUzQyT25h?=
 =?utf-8?B?Z2FPNE1BNXk3MkgwQlRkTkJhbDZ6TEtNcXNWbGR4dXJGL3VoTTJVWXpGU21H?=
 =?utf-8?B?VVFaMmlQU1p0a3A0TC9HNWc4TE5UUFQ5cjhuRkJnanc1WnVncm0ya2h4SXZ1?=
 =?utf-8?B?WkJheXl4cS9MQnNrT1BTbk1qenlMVjlVclR5WGxXdERNbE5vM1IzSUNva3lS?=
 =?utf-8?B?TWEzRk5oY2h4SGxodXZ1b2tWQTc5RlVwS2hONDdvSFJ5OURyWnVJZzJhejhR?=
 =?utf-8?B?NlJ1NW9vSkNtMThhb1dkcm41WDFXRitXZlRlVjNicm1FWTB6OXBTcVhSWUE3?=
 =?utf-8?B?NnJUZ3lYTkNidXJhcjUrdDhLNmZHZ1ZPVUhMbnVENW9mSzZ1bTAxZ1NJTTk3?=
 =?utf-8?B?elJ1ZXpuMTB2K3FyRVpwa3JMc1pIcG8zYVNQTDFRNXh4QTBtQm9CYVdHQklk?=
 =?utf-8?B?ZXZtTWZ3cmFZNlovQjRFT0lkZUlrbS9TOUZmclVIMmorb2I5SStEbFNDUlZ6?=
 =?utf-8?B?enVtdHBIYVJWK1hGQVhtR2dzV0dvSThvZ29IR2RWMGJyVHI5L0MwZDR2OVFj?=
 =?utf-8?B?Y2JTMTM2UnZWTWx0VlFUUUpaRGdvUEI0clRJTnU4NVJodGFQL1h4bkx4cXh6?=
 =?utf-8?B?MG5VakFUeTNpcW5XTmFHUVJCN3VEVlp2WEc1NFg2cllndUNIZjVEN2dGODQx?=
 =?utf-8?B?ZmNlSjdVWXNrSWNEWnpjUm5QcGRHT2hJVUh4dTJhekxYdTRyS0VXdU52Ri9D?=
 =?utf-8?B?bm1qdmtRN0p5RkdLaVlnU2lrMXBMSG1ReE9zN3FGeHkzeXBIVzRvWGRoU1Bx?=
 =?utf-8?B?b2Y0ZUx4ais4UTc4UkU0TVR1elNuNXdjNHNSUXlKVjI5bFRXT0VmQnlxR2VT?=
 =?utf-8?B?cnFKTDJ2WHVHblNSeDBGaEFQRW9aWjBDWWI2L0hINTdVeVdUQXlQOGxIdmQv?=
 =?utf-8?B?Qjlla1BVb2hsNEFhY0Q0ZnE1TjNOT3hQU09WL3hMd3czTUY1Z2JyK0QzQUVo?=
 =?utf-8?B?NXdaNlpDN0tSNytacnNFRnZYOWx0YWNLWExaWm1nZTZGNWFWUGxFNWNBaHMx?=
 =?utf-8?B?emFBVlRaV0F4OWxLaDhadm1sMzA2c2tFVFJwUWZkVlpMM1haLzUvdVM4Q3ha?=
 =?utf-8?B?Z1VEZWE5T09uaVpOQ2pGWmNBamNFWE1IYlJqY0UzVGRKcUhmaDhPaEpyckdr?=
 =?utf-8?B?dmJpdDdOZ1A1RXVhQm5NMUt6WTQ3NDFiejd6TVlKNGtIMHVDZTgzS05ZK2RK?=
 =?utf-8?B?MXVGeW16TDNrM2hvV1NTcmQxK2RFaFhXUDFmZHFEOUZwVTZOdldTUi9sb3Vj?=
 =?utf-8?B?M09EVDV6TmJlS2R3SmNhZ2J0VTNXWjZuUTZWeXhqcU0ya2xMZXhZT24xSDlL?=
 =?utf-8?B?ODVWQUErVDA2MEZhUm5jbzB2ZTRnQnc4UGVzQVlWMi93d3dLVHVFd0tGTjNp?=
 =?utf-8?B?UURqdThwSGxXK3JQVk12aHNrRjJwcndhU3ZtUlE0VmdoQWlyNFFhU2loUXVp?=
 =?utf-8?B?VFNYYTZ5SjgvMUUwbU5tTjdXbTJuTTdFU1NHRVgva3plRWp4eGVXUWthNXhE?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a170d8f-1a1a-403f-3277-08dd45247a0e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 14:01:53.3554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+zerRBbJw/3S2PxncuAL3+Mqc2rh+DNJSo30hWhIDz+JxaAOd5giuLgbhl1jrBkQ0zdk6Trq1XEL15UHPNN7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8351
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

Hi Kunal,

Please find my review comments below.

On 03-02-2025 01:42 pm, Kunal Joshi wrote:
> Add new test subtests kms_dp_linktraining
typo : remove subtests
> to validate both UHBR and non-UHBR link rates over SST
> and MST configurations.
> Add four new subtests (uhbr-sst, uhbr-mst, non-uhbr-sst, non-uhbr-mst)
> to check if the link rates match the expected UHBR or NON-UHBR capability
> and whether the outputs are MST or SST.
>
> v2: Add definition for UHBR_LINK_RATE
> v3: Add failure criteria (Jani Nikula)
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_dp_linktraining.c | 372 ++++++++++++++++++++++++++++++
>   tests/meson.build                 |   4 +
>   2 files changed, 376 insertions(+)
>   create mode 100644 tests/intel/kms_dp_linktraining.c
>
> diff --git a/tests/intel/kms_dp_linktraining.c b/tests/intel/kms_dp_linktraining.c
> new file mode 100644
> index 000000000..6cedc47db
> --- /dev/null
> +++ b/tests/intel/kms_dp_linktraining.c
> @@ -0,0 +1,372 @@
> +// SPDX-License-Identifier: MIT
> +/**
> + * TEST: kms dp linktraining
> + * Category: Display
> + * Description: Test to validate link training on SST/MST with UHBR/NON_UHBR rates
> + * Driver requirement: i915, xe
> + * Functionality: linktraining
Should this be link_training ?
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
> +/**
> + * SUBTEST: uhbr-sst
> + * Description: Test we can drive UHBR rates over SST.
> + * Functionality: feature_discovery, uhbr, sst
This is not feature_discovery test anymore. Please remove.
Same implies to remaining subtests.
> + * Test category: functionality test
> + *
> + * SUBTEST: uhbr-mst
> + * Description: Test we can drive UHBR rates over MST.
> + * Functionality: feature_discovery, uhbr, mst
> + * Test category: functionality test
> + *
> + * SUBTEST: non-uhbr-sst
> + * Description: Test we can drive non-UHBR rates over SST.
> + * Functionality: feature_discovery, sst
> + * Test category: functionality test
> + *
> + * SUBTEST: non-uhbr-mst
> + * Description: Test we can drive non-UHBR rates over MST.
> + * Functionality: feature_discovery, mst
> + * Test category: functionality test
> + */
> +
> +#include "igt.h"
> +#include "igt_kms.h"
> +#include "intel/kms_joiner_helper.h"
> +#include "intel/kms_mst_helper.h"
> +
> +/*
> + * DP Spec defines 10, 13.5, and 20 Gbps as UHBR.
> + * Anything below that is considered NON-UHBR.
> + */
Shall we have some gen check since which intel platform UHBR is 
supported so that test can exit early?
> +#define UHBR_LINK_RATE	1000000
> +#define RETRAIN_COUNT	1
> +
> +typedef struct {
> +	int drm_fd;
> +	igt_display_t display;
> +	igt_output_t *output;
> +} data_t;
> +
> +/*
> + * check_condition_with_timeout - Polls check_fn until it returns 0
> + * or until 'timeout' seconds elapse.
> + */
> +static int check_condition_with_timeout(int drm_fd, igt_output_t *output,
> +		int (*check_fn)(int, igt_output_t *),
> +		double interval, double timeout)
Fix indentation.
> +{
> +	struct timespec start_time, current_time;
> +	double elapsed_time;
> +	int ret;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &start_time);
> +
> +	while (true) {
> +		ret = check_fn(drm_fd, output);
> +		if (ret == 0)
> +			return 0;
> +
> +		clock_gettime(CLOCK_MONOTONIC, &current_time);
> +		elapsed_time = (current_time.tv_sec - start_time.tv_sec) +
> +			(current_time.tv_nsec - start_time.tv_nsec) / 1e9;
> +		if (elapsed_time >= timeout)
> +			return -1;
> +
> +		usleep((useconds_t)(interval * 1e6));
> +	}
> +}
> +
> +/*
> + * assert_link_status_good - Verifies link-status == GOOD
> + * for either a single SST output or all MST outputs in the topology.
> + */
> +static void assert_link_status_good(data_t *data, bool mst)
> +{
> +	igt_output_t *outputs[IGT_MAX_PIPES];
> +	uint32_t link_status_prop_id;
> +	uint64_t link_status_value;
> +	drmModePropertyPtr link_status_prop;
> +	int count = 0;
> +	int i;
> +
> +	if (mst) {
> +		igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd,
> +					&data->display, data->output,
> +					outputs, &count),
> +				"Unable to find MST outputs\n");
> +
> +		for (i = 0; i < count; i++) {
> +			kmstest_get_property(data->drm_fd,
> +					outputs[i]->config.connector->connector_id,
> +					DRM_MODE_OBJECT_CONNECTOR,
> +					"link-status",
> +					&link_status_prop_id,
> +					&link_status_value,
> +					&link_status_prop);
> +
> +			igt_assert_eq(link_status_value,
> +					DRM_MODE_LINK_STATUS_GOOD);
> +		}
> +	} else {
> +		kmstest_get_property(data->drm_fd,
> +				data->output->config.connector->connector_id,
> +				DRM_MODE_OBJECT_CONNECTOR,
> +				"link-status",
> +				&link_status_prop_id,
> +				&link_status_value,
> +				&link_status_prop);
> +
> +		igt_assert_eq(link_status_value, DRM_MODE_LINK_STATUS_GOOD);
> +	}
> +}
> +
> +/*
> + * setup_planes_fbs - Create solid-color FBs and attach them to the primary plane.
> + */
> +static void setup_planes_fbs(data_t *data, igt_output_t *outs[],
> +		int count, drmModeModeInfo *modes[],
> +		struct igt_fb fbs[], struct igt_plane *planes[])
Fix indentation.
> +{
> +	int i;
> +
> +	for (i = 0; i < count; i++) {
> +		modes[i] = igt_output_get_mode(outs[i]);
> +		igt_info("Mode %dx%d@%d on output %s\n",
> +				modes[i]->hdisplay, modes[i]->vdisplay,
> +				modes[i]->vrefresh, igt_output_name(outs[i]));
> +
> +		planes[i] = igt_output_get_plane_type(outs[i],
> +				DRM_PLANE_TYPE_PRIMARY);
> +
> +		igt_create_color_fb(data->drm_fd, modes[i]->hdisplay,
> +				modes[i]->vdisplay,
> +				DRM_FORMAT_XRGB8888,
> +				DRM_FORMAT_MOD_LINEAR,
> +				0.0, 1.0, 0.0, &fbs[i]);
> +
> +		igt_plane_set_fb(planes[i], &fbs[i]);
> +	}
> +}
> +
> +/*
> + * fit_modes_in_bw - Tries atomic TEST_ONLY commit; if it fails, overrides
> + * output modes to fit bandwidth.
> + */
> +static bool fit_modes_in_bw(data_t *data)
> +{
> +	int ret;
> +
> +	ret = igt_display_try_commit_atomic(&data->display,
> +			DRM_MODE_ATOMIC_TEST_ONLY |
> +			DRM_MODE_ATOMIC_ALLOW_MODESET,
> +			NULL);
> +	if (ret != 0) {
> +		bool found;
> +
> +		found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
> +		igt_require_f(found, "No valid mode combo found for modeset\n");
> +	}
> +
> +	return true;
> +}
> +
> +static void do_modeset(data_t *data, bool mst)
> +{
> +	uint32_t master_pipes_mask = 0;
> +	uint32_t valid_pipes_mask = 0;
> +	uint32_t used_pipes_mask = 0;
> +	igt_output_t *outs[IGT_MAX_PIPES];
> +	drmModeModeInfo *modes[IGT_MAX_PIPES];
> +	struct igt_fb fbs[IGT_MAX_PIPES];
> +	struct igt_plane *planes[IGT_MAX_PIPES];
> +	int n_pipes = 0;
> +	int out_count = 0;
> +	int i;
> +
> +	for_each_pipe(&data->display, i) {
> +		valid_pipes_mask |= BIT(i);
> +		n_pipes++;
> +	}
> +
> +	if (mst) {
> +		igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd,
> +					&data->display,
> +					data->output, outs,
> +					&out_count),
> +				"Unable to find MST outputs\n");
> +	} else {
> +		outs[0] = data->output;
> +		out_count = 1;
> +	}
> +
> +	igt_assert_f(out_count > 0, "Require at least one output\n");
> +
> +	igt_set_all_master_pipes_for_platform(&data->display, &master_pipes_mask);
> +
> +	igt_assert_f(igt_assign_pipes_for_outputs(data->drm_fd,
> +				outs,
> +				out_count,
> +				n_pipes,
> +				&used_pipes_mask,
> +				master_pipes_mask,
> +				valid_pipes_mask),
> +			"Unable to assign pipes for outputs\n");
> +
> +	setup_planes_fbs(data, outs, out_count, modes, fbs, planes);
> +	fit_modes_in_bw(data);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +/*
> + * run_link_rate_test - Main link training routine. Expects the MST vs. SST check
> + * to be done beforehand. Returns true if tested at the correct rate.
> + */
> +static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
> +{
> +	int max_link_rate;
> +	int max_lane_count;
> +	int current_link_rate;
> +	bool is_uhbr_output;
> +	char rate_str[32];
> +	char lane_str[32];
> +
> +	igt_display_reset(&data->display);
> +	igt_reset_link_params(data->drm_fd, data->output);
> +
> +	/* Retrain at default/driver parameters */
> +	igt_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
> +	igt_assert_eq(check_condition_with_timeout(data->drm_fd, data->output,
> +		      igt_get_dp_pending_retrain, 1.0, 20.0), 0);
> +	assert_link_status_good(data, mst);
> +	do_modeset(data, mst);
> +
> +	/* FIXME : Driver may lie max link rate or max lane count */
> +	/* Read max_link_rate and max_lane_count */
> +	max_link_rate = igt_get_max_link_rate(data->drm_fd, data->output);
> +	max_lane_count = igt_get_max_lane_count(data->drm_fd, data->output);
> +
> +	/* Check sink supports uhbr or not */
> +	is_uhbr_output = (max_link_rate >= UHBR_LINK_RATE);
> +	if ((uhbr && !is_uhbr_output) || (!uhbr && is_uhbr_output)) {
> +		igt_info("Test expects %s, but output %s is %s.\n",
> +			 uhbr ? "UHBR" : "NON-UHBR",
> +			 data->output->name,
> +			 is_uhbr_output ? "UHBR" : "NON-UHBR");
> +		igt_info("----------------------------------------------------\n");
> +		return false;
> +	}
> +
> +	snprintf(rate_str, sizeof(rate_str), "%d", max_link_rate);
> +	snprintf(lane_str, sizeof(lane_str), "%d", max_lane_count);
> +	igt_info("Max link rate for %s is %s, lane count = %d\n",
> +		 data->output->name, rate_str, max_lane_count);
> +
> +	/* Force retrain at max link params */
> +	igt_set_link_params(data->drm_fd, data->output, rate_str, lane_str);
> +	igt_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
> +	igt_assert_eq(check_condition_with_timeout(data->drm_fd, data->output,
> +		      igt_get_dp_pending_retrain, 1.0, 20.0), 0);
> +	assert_link_status_good(data, mst);
> +
> +	current_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
> +	igt_info("Current link rate is %d\n", current_link_rate);
> +	igt_assert_f(current_link_rate == max_link_rate,
> +		     "Link training did not succeed at max link rate.\n");
> +	igt_assert_f(is_uhbr_output ?
> +		     current_link_rate >= UHBR_LINK_RATE :
> +		     current_link_rate < UHBR_LINK_RATE,
> +		     is_uhbr_output ? "Link training didn't happen at uhbr rates" :
> +		     "Link training didn't happen at non-uhbr rates");
> +	igt_info("----------------------------------------------------\n");
> +	return true;
> +}
> +
> +/*
> + * test_link_rate - Iterates over connected DP outputs. Checks MST vs. SST
> + * early, then calls run_link_rate_test(). Returns true if it ran on at
> + * least one matching output.
> + */
> +static bool test_link_rate(data_t *data, bool mst, bool uhbr)
> +{
> +	bool ran_any_output = false, is_mst = false;
> +	igt_output_t *tmp_output;
> +
> +	igt_skip_on_f(!is_intel_device(data->drm_fd),
> +			"Test supported only on Intel platforms.\n");
> +
> +	for_each_connected_output(&data->display, tmp_output) {
> +		if (tmp_output->config.connector->connector_type !=
> +		    DRM_MODE_CONNECTOR_DisplayPort) {
> +			igt_info("Skipping non-DisplayPort output %s\n",
> +					tmp_output->name);
> +			igt_info("----------------------------------------------------\n");
> +			continue;
> +		}
> +
> +		/* Early skip if MST vs. SST does not match. */
> +		is_mst = igt_check_output_is_dp_mst(tmp_output);
> +		if (mst && !is_mst) {
> +			igt_info("Skipping %s: MST requested but it's SST.\n",
> +					tmp_output->name);
> +			igt_info("----------------------------------------------------\n");
> +			continue;
> +		} else if (!mst && is_mst) {
> +			igt_info("Skipping %s: SST requested but it's MST.\n",
> +					tmp_output->name);
> +			igt_info("----------------------------------------------------\n");
> +			continue;
> +		}
> +		data->output = tmp_output;
> +		igt_info("Running link training test for %s\n",
> +			 data->output->name);
> +		ran_any_output = ran_any_output | run_link_rate_test(data, mst, uhbr);
> +	}
> +	return ran_any_output;
> +}
> +
> +IGT_TEST_DESCRIPTION("Test to validate link training on SST/MST with "
> +		"UHBR/NON_UHBR rates");
> +
> +igt_main
> +{
> +	data_t data = {};
> +
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
> +	}
> +
> +	igt_describe("Test we can drive UHBR rates over SST");
> +	igt_subtest("uhbr-sst") {
> +		igt_require_f(test_link_rate(&data, false, true),
> +			      "Didn't find any SST output with UHBR rates.\n");
> +	}
> +
> +	igt_describe("Test we can drive UHBR rates over MST");
> +	igt_subtest("uhbr-mst") {
> +		igt_require_f(test_link_rate(&data, true, true),
> +			      "Didn't find any MST output with UHBR rates.\n");
> +	}
> +
> +	igt_describe("Test we can drive NON-UHBR rates over SST");
> +	igt_subtest("non-uhbr-sst") {
> +		igt_require_f(test_link_rate(&data, false, false),
> +			      "Didn't find any SST output with NON-UHBR rates.\n");
> +	}
> +
> +	igt_describe("Test we can drive NON-UHBR rates over MST");
> +	igt_subtest("non-uhbr-mst") {
> +		igt_require_f(test_link_rate(&data, true, false),
> +			      "Didn't find any MST output with NON-UHBR rates.\n");
> +	}
> +
> +	igt_fixture {
> +		igt_reset_connectors();
> +		igt_display_fini(&data.display);
> +		close(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index b9dd162cc..926c5825f 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -246,6 +246,7 @@ intel_kms_progs = [
>   	'kms_ccs',
>   	'kms_cdclk',
>   	'kms_dirtyfb',
> +	'kms_dp_linktraining',
>           'kms_dp_linktrain_fallback',
>   	'kms_draw_crc',
>   	'kms_dsc',
> @@ -367,6 +368,9 @@ extra_sources = {
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +	'kms_dp_linktraining': [
> +		join_paths ('intel', 'kms_joiner_helper.c'),
> +		join_paths ('intel', 'kms_mst_helper.c') ],
>           'kms_dp_linktrain_fallback': [ join_paths ('intel', 'kms_mst_helper.c') ],
>   	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
