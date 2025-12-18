Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDACD6ACE6
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 11:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D1510EE80;
	Thu, 18 Dec 2025 11:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VhVIAABi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC21F10EE80
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 11:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766057224; x=1797593224;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PWp+y1wvkhwRrLLgESEplKKw9SSXiXG/h7mJ8qEWWbc=;
 b=VhVIAABiuJr0TGXL2Wl9Ns+xwaeSNGLTCCWhc007suMAFnznCtUL1+gs
 Fe4xk12jowJ9zGYjfLxDVkmfhdXMWsFUl9umM++RBCRloyeqSEhncoYlc
 fhREAQHkJqfVCOqlhgP0js5HRVEitX4owCl7uXP+wFXLE3UqHKgScWaY8
 80egG+BsbOMT6HaMXiCbc4Z1rx3QpZdZOq5+OpRMElBkcqm+UDiUSsVFs
 XHx7Y3u/XRq5jdWScT5YFTEklt50FnHIf2NO+TBpyxgXQLHdHDN72mfdV
 e2CG0PTPZ0LlDb6HA6La3U/k0KpIPyEvQziu+Hrfi1DfzDbjAHXmGVOHV g==;
X-CSE-ConnectionGUID: EVFRx/ekTgatfO1X+XgCgA==
X-CSE-MsgGUID: Fv3B2x2ASSmPt5LHrQlbkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78647039"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="78647039"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:27:04 -0800
X-CSE-ConnectionGUID: 5JJGYCaiTxWBSpKVOb6rLg==
X-CSE-MsgGUID: GVL992uUR7WWJid+NguiSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198826644"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:27:03 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 03:27:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 03:27:02 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 03:27:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPdLK2/vcCEm69OuyVZ5dtOccropk5CU0sc3YQKxKCo9DbiT36HcSbz5knnqQS/UYu+fy3/lDOsCgOh4gYqgfc8gHioXcWlcJb5zYF+1od6IrNK2nJmW7cNpEyrGAy3eWiG8APmzIylOph0qB6XatqTgPTrVyNwuSifXUyHYRx4DQJ8ZFlG6PONE7PJoJNwOzbtwvUyJuoaNQiY/RNcRW7OcZZbB/uVzSYgk+n9dKcrPk+drTKz6dIWC/NQ0fdECmpLtpzp6pIilg6/7nExJ4Nm9JNcgZ03RHirk4x5zw+NyN26l+eNsd/F5CKvSLmdFURTiCBb3GvTSClVy8m3Bbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JNu+WfyN0+A8XgECJWLDI6kfOvqkVdME8+MuwtPdZw=;
 b=vBcr32l2/hFK69g7UPkDtchPu2q7Erknm+v2zgf28zwadoDe5tJRbb1EgidEKOsY21uzzs88iWwhb8Mr0CbXyCBAFi/21MY078vMZi17Ni0OULxQDcJbozebZEUL20rRXJSQ1hBwcqL8xE+7ROavDL/13ei7g3qVnVB/70cWOEIhM5YtcFGL1VxcZf4vhbmJ78eD0g5ni5H6FxwumwPJRI+P/J9f7dfMCInJ8pd6Bk5DE616+65MviPlns5lpaSQQhY5D3vz1/Mo8tSVjmFG8vWNekRJnlZ4Ika3uf2UxPKOS2XiTefR4gbpzU1EzP++vtxs5Jmk2LI0/GlMrUV8Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DM4PR11MB6405.namprd11.prod.outlook.com (2603:10b6:8:b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 11:26:58 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 11:26:58 +0000
Message-ID: <210b02e0-ed99-4ba9-94e2-9ed1345ca17e@intel.com>
Date: Thu, 18 Dec 2025 16:56:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 6/7] intel-ci: Add NVL display blocklist
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20251216185215.1281390-1-swati2.sharma@intel.com>
 <20251216185215.1281390-7-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251216185215.1281390-7-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DM4PR11MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: 81dab4a2-2554-425e-f74e-08de3e285b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|42112799006|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3N5TFlNUGR1ak9SeUNKcUJoRm9MaTBDNGZjUjZ0N2JQNVFBN2VtQlduTyt3?=
 =?utf-8?B?alNFQ2t3N29JRWl2b3lET1pGbEdzRWRMdEFqM0o2cHJRZnBIeVR6cUxsYnJV?=
 =?utf-8?B?cmRrbTYrbHBubi92Ly9Dc093NGR4SmlFeUN3M3FwdTFjSU14bzI5SHZBQjFi?=
 =?utf-8?B?cU1IWWtzMjRsL2pZbmxmSWhMT2F0NEN6a2NJVHA5a0JwRkl4bk1DTkxYc3pY?=
 =?utf-8?B?d1REZCs1dDI5S24vYWNKWk9uQW9FeDFRN05DdXJVQWtMYS9SeE5GN05ZQWho?=
 =?utf-8?B?bzNPTVhUQkVPNURHazVOQkNLYWthNHFrWmhGL2JhNnRqMDRsRzU3Y3lWeHFX?=
 =?utf-8?B?RGMzMi9pclVlbDdZdXM2SXhaSC9kR21NcWFsT0NNYUxVRFBGeW5Jb1JsazR6?=
 =?utf-8?B?KzdoRENHcHQ2SjVWSDY0RFlObDkrcFd1ZDNDQnJ0RUxBK3NYYjJ2aFpiUzdK?=
 =?utf-8?B?LzRCK0Fra0poUzhRS3ZwbFpSYW9TSXJIRy9obTdhOCsxRXJuZWtaMXRUVzJ5?=
 =?utf-8?B?NEJINEkyWEppNUlQa09JWGVEVUFhc0JIc0VPWU14MmZQaTlMMnpEUWFBenM1?=
 =?utf-8?B?Z2t2ZzJubGFLUzk1djVrWmlwZFp4TUxMNFc1Q3BodllBL0VCbnQxbzhpWU1s?=
 =?utf-8?B?OVFJcXlKT1luS2hZUHBzQ0tkU2YvVUc2OEpxdU1GamRITmtuWnlIVFRQbmJ6?=
 =?utf-8?B?Q05jZ0VXbjRLMFJWcHB6V2xNQXJGZDVLR283MEhuNjZuaGZFS05aR0VKK3hp?=
 =?utf-8?B?RWUzR1lObDRtanBYS1p2L2JQaHRwUEtFVlFaZjNJRmU5VlhzMXJQUTlqclp2?=
 =?utf-8?B?RXF3L1dDZlF1bU11cXZzUjZ5dVIvVEs5VmxTaXNWdVNBOHlRZThreTBoT1Jo?=
 =?utf-8?B?S3Y1VG5YZnMzdVU0bkdlSktpdHphVEt6Q1lWOE1rUkNrWWNhSUdCWDlvWHFM?=
 =?utf-8?B?eVJqYnFvVU9rOFp6YmhmM2g4bUllcStCM3g1MnlHQWdHa3pJVzZEOEpPOWZ3?=
 =?utf-8?B?T0lWczZucWxCak9LM05OWWJkLzhKdzhHYTdyUUFNa2cxdWcxSEs1THVPL2VC?=
 =?utf-8?B?cnVrUEFTUGJUWk5ZNHpYQmhSMWoxYjQyU0UxdmJUQlZnb2YxZk94bXpDQzZ1?=
 =?utf-8?B?a293S0lHelJnOWRDVmRvMkFPa0xCeld4V0hqUm9DU0ErajhjcSs2Q05oNGZC?=
 =?utf-8?B?NUlsNys3M0w0UmxzQ3lYR0Z5TWhQcTg2RUFsdVZ2NWp6eEgxdDhucTliOGRF?=
 =?utf-8?B?N3YxKzlLS1JpeTU2MnlWWWZQL2h0WFRCc1RieTJLM01RbzlpSytBdzBNL3BR?=
 =?utf-8?B?ZEVzOWlSb1VZOGZDT1Z1TnNvTE1weDE4Nnp6OWVaSUZic3c2WmU4Z21saUFX?=
 =?utf-8?B?OVZhYlNRN3RVaDROWitwa2E5SkVoSHUwSlN3ejdjZjJPUkhpNWt2dFVya3Fq?=
 =?utf-8?B?MjBuOGlyejJyeVJZYncyK0VZTC9XejhPUXFpdDJienFtUzZxTERNc2EyNGdF?=
 =?utf-8?B?cE1kSVhyeXRSdHNsV2NlYXFXNXNZNGxGdm94bklXdi9mRUtDZ0V6STNYNlIv?=
 =?utf-8?B?bWkwODRTUUFJWmtiRXFpa3NTVFB1M2dLR2tLYWtLbk55WmIxVWpIRXFaeFpR?=
 =?utf-8?B?SENOanl2VlBrSXZ6bGk4U1NlcFJvV3ZZMENsTEZCc1kzT0ZMTERWTHRjU3Rl?=
 =?utf-8?B?T1NqQTA5ZnNwT0o0QUg4Zlc3cXArVTBlYWp5QUtoWWNhUm5KN1V3eTMyUDhZ?=
 =?utf-8?B?Sm9uSGhHRmsyemlBNHdHMElqTVd5b0xxMm91czlrbjZhelREb1VLcThmT1Vk?=
 =?utf-8?B?NGduZmFNQ3NJTFRaSktRZkh0NTVVMmJOUWtJVzcyQytJczloK3VNOUs3WkxI?=
 =?utf-8?B?d2taWkpIM1NPVXplcnZtYkhEK055U1NZdC9EUkVFODUzQ1hDdFNkSU9DbjRo?=
 =?utf-8?Q?QB2uRem0mxjBQlH/tUBM9JyGFO9NQBPY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3djc1lFNCtQNktwNnNDeUdadFdHZExNR0oxR0JNV3VzOTg1OENLL0pmeWhC?=
 =?utf-8?B?KzBTampIZXBKYWE2T2I3N3pZZ29maEdzaEpzU2JxVk9lYW8rRVpGREQvbWpG?=
 =?utf-8?B?TUlUUlJnYjlWQm5ZR01UL2tsWlRtTWUwa2JrRnZLY0FWSGdKVlNFcThqTWNW?=
 =?utf-8?B?VTVTdW5pN0djK1VzTll5Tmg5ZkR0SGhBVGtGSGZ1Mk5yV0JCZW9UT0YrYnk4?=
 =?utf-8?B?ZlBLUWxtNTh2MEtsRFFCZnI1VVZXYVBZVlJXTnJWRkxQeWNvTTIzRU5WWXN1?=
 =?utf-8?B?S0pOcE1IS1BDTUpSdzY5S0RwYmJtZ09jcDVkTlhoZkpxR2NWWHl0Nno1ZUFv?=
 =?utf-8?B?SUJnSytrTmdQanY0VGo2VWJneEZjVG90ZytSYUtZM3M5T0xIUmlWV3BlSGNR?=
 =?utf-8?B?ZGxRTnNVNUNVaU52RFNiNHRQUmVVaE1OMjdrZm9SblhRS2hWU2sxVi9DdUQw?=
 =?utf-8?B?ZGxzbUlreDl0cDhlVkF2U1UyZjA0Qmg3UW05SkpwSjZ2Z3AzZUtyVXhJRWRy?=
 =?utf-8?B?cW9PTlYvdWRPSGF0N0w3WnhmQmhsNFJQc0RONExTQ0IrZHk5TmwwQ3J2RVRv?=
 =?utf-8?B?TDJqTStYMFY4SjRxZk10aC8ybVNtUytNUjVldWcwT2pERzRwZUdIcEl4SWRl?=
 =?utf-8?B?ZWRGc25NejJaRDBnemhvUkwrY056L0xWQzhIcno3RTBGRTQ2MGtvQ2dETzdK?=
 =?utf-8?B?SWZuZ3E1S1dncDZ0cFFXYWJ2enM1OTY2dW85TUI2eU9GZ3hTTWdVcGxyL2xa?=
 =?utf-8?B?MHc4c1AvV1BIa1N3UnhRZHErbUh4NmNKclAzZFhBRytXMVduQ0VTbUNTTkJ4?=
 =?utf-8?B?MmpwZTNEdDlNemtHZ01xZWxDMlVVVGkxOWZNb3JsNDFpRHJaWEp4WjRNWjdv?=
 =?utf-8?B?RkZ3cjkwTFd3NU1EbjdycU9VVFl6RUdwdTZxOUVmZWZpNmZtY05LNmxjTXZx?=
 =?utf-8?B?TmhZRUQ0bjZMWjZtSGZicHJWMFg4QnBVQ05vc0l0a0VRMDlZTnhuaTJKdWEv?=
 =?utf-8?B?eUdMa3cyVkg2M2tWVnpiQ2lJQXg2YUhZeXpDcVNXYzlJbWZXYWQ0S0sybkQy?=
 =?utf-8?B?VmdlN0ZncUI2YjJZdjhhdzV0STkvSlBWdTJHcllrb1dwc2FsMDFpQXBJcUly?=
 =?utf-8?B?bUh5VXFia2FkeFpUbGNvUUZMcDNiUXoxOFc2K0ZPUEJyRkJ2dHNWWExUVGxl?=
 =?utf-8?B?TUk5MzJBZ2VoMm5VTVEwR2tTcENsRTgxWVoyemU0NjFia1JhVnpTaThXaVNm?=
 =?utf-8?B?aUYrQlhuQmtZVUtNS3dSZDhRVk1FYzhkL2tPZXo3NnQxR2pyTml3NDVpQ01w?=
 =?utf-8?B?S2FPekl2Y2pEaWQzYlhsVmNRa2Q0WFlLanFybGxhMHM3ejR1b0JwaDAvNGlJ?=
 =?utf-8?B?UnZIVVZRcGwvRllxRG96ZzJIYnFPazdDQjM4V0MxZGpKbjFTUW5KVW1GTFZr?=
 =?utf-8?B?TzJVdXBpTzEwV201d2UwbDVIOU9vNitoSVBURjJiNHFNVzkwMDNXS2F1dHBY?=
 =?utf-8?B?VkJLUytrQnhCUkpTRXFVbE9DeGpxNTVxUjBsSFUvVmdvL2NiZlF5WkJmSFBq?=
 =?utf-8?B?N3puQ3pkY21TdnVxZURidXVkd2tuN3lNM3ZaNDhpZkRXSHkwZE11RW5PdnFy?=
 =?utf-8?B?T0tNRktpVUo2MnYxeklzNlV4N2hscSsyK0hlU0Z0MEFpai9oTGhpWStZMnRq?=
 =?utf-8?B?N0NKTzNyWmtpLzJBdjZacVVvZ3BJOSsyaGxSSSttbER5UHBhSkpRa1UwSkZk?=
 =?utf-8?B?Mk93Y21RUksvUjJmN25vcEZaWVpsQVNPMVRURGhhOWNCZnRGdG52WUxYNUJl?=
 =?utf-8?B?ZU1GcnhNVjRtT2JEUTlIRXdCaVZLZ2ZnU1VWR01IaUNKTVlrc0JDNUtMTCtm?=
 =?utf-8?B?WWNMRnlDQnVaM1REcEZ4VnZkRGxSSWpwclROYnR5OEJERzJRQlB3WDVRa1Zx?=
 =?utf-8?B?UFd1SEVTV2VXckR5cE5PWUxZbXNvSnNwZjhDM0djamF6Qm92RCt5ZWhuNE9o?=
 =?utf-8?B?cy8xL09qMXhVN3hITUZaOTNJSDc3R1JyTXYxaWVJNDBkdmxYQlQrMGEzdjZD?=
 =?utf-8?B?ZWhOUGpveGRQME9rbjYyMm5rZmVUUnA1MkFhV1hlV0xadUx0THNhWFFVMzgw?=
 =?utf-8?B?Z3ZuN0x6VUpRREppUmlLdVRQMG5uUXkvM3Z5RHJVTnpCelVKcW9qTVZHT3A5?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81dab4a2-2554-425e-f74e-08de3e285b58
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 11:26:58.8369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJ1luaJpggTx4eSa5u6hZeN80fHcIfJlsV6wUY03ctiu5SXBdtiVyAmKbuB5TlNgsV0sq2FCTZ0Bm4r9yK90gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6405
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


On 12/17/2025 12:22 AM, Swati Sharma wrote:
> Introduce display blocklist for the NVL platform containing
> NVL-specific display test exclusions.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/xe.nvl.display.blocklist.txt | 128 ++++++++++++++++++++
>   1 file changed, 128 insertions(+)
>   create mode 100644 tests/intel-ci/xe.nvl.display.blocklist.txt
>
> diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-ci/xe.nvl.display.blocklist.txt
> new file mode 100644
> index 000000000..38ca3a654
> --- /dev/null
> +++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
> @@ -0,0 +1,128 @@
> +##############################################################################
> +# non-KMS tests
> +##############################################################################
> +igt@(?!.*kms|testdisplay|.*display-vs-wb-transient|fbdev)(.*)
> +##############################################################################
> +# Valid skip: Y and Yf-Tiling not supported
> +##############################################################################
> +igt@kms_(big_fb|ccs|rotation_crc)@.*(y|yf)-tiled.*
> +igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
> +igt@kms_flip_scaled_crc@.*(yf|y)tile.*
> +igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
> +igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
> +##############################################################################
> +# Valid skip: Test skip due to hybrid config requirement
> +##############################################################################
> +igt@kms_addfb_basic@invalid-smem-bo-on-discrete
> +##############################################################################
> +# Valid skip: 90/270 rotation not supported
> +##############################################################################
> +igt@kms_big_fb@.*rotate-(90|270)
> +igt@kms_rotation_crc@.*rotation-(90|270).*
> +igt@kms_rotation_crc@bad-(pixel-format|tiling)
> +##############################################################################
> +# Valid skip: Mutable zpos not supported
> +##############################################################################
> +igt@kms_atomic@plane-primary-overlay-mutable-zpos
> +##############################################################################
> +# Valid skip: Cursor size = 32 and Cursor size > 256
> +# are not supported
> +##############################################################################
> +igt@kms_cursor_crc@.*-max-size
> +igt@kms_cursor_crc@.*-(32x10|32x32|512x).*
> +igt@kms_cursor_crc@cursor.*(21|42|85)
> +##############################################################################
> +# Valid skip: !cursor_slowpath(&display, i)
> +##############################################################################
> +igt@kms_cursor_legacy@(short|basic)-busy-flip-before.*
> +##############################################################################
> +# Valid skip: Use of a single CRTC for two connectors
> +##############################################################################
> +igt@kms_setmode@basic-clone-single-crtc
> +##############################################################################
> +# Valid skip: Connector uses CRTC that is incompatible
> +# with the connector
> +##############################################################################
> +igt@kms_setmode@invalid-clone-exclusive-crtc
> +##############################################################################
> +# Valid skip: Requires TV connector
> +##############################################################################
> +igt@kms_tv_load_detect@load-detect
> +##############################################################################
> +# Valid skip: WB feature not enabled
> +##############################################################################
> +igt@kms_writeback@.*
> +##############################################################################
> +# Valid skip: Scaling mode none not supported
> +##############################################################################
> +igt@kms_scaling_modes@scaling-mode-none
> +##############################################################################
> +# Valid skip: DG2/MTL/BMG specific CCS tests
> +##############################################################################
> +igt@kms_ccs@.*-dg2-.*
> +igt@kms_ccs@.*-mtl-.*
> +igt@kms_flip_scaled_crc@.*dg2rcccs.*
> +igt@kms_ccs@.*4-tiled-bmg-ccs
> +##############################################################################
> +# Valid skip: Valid for display ver < 13
> +##############################################################################
> +igt@kms_psr2_su@.*
> +##############################################################################
> +# Valid skip: Downscaling factor not supported
> +##############################################################################
> +igt@kms_plane_scaling@.*downscale-factor-0-25.*
> +##############################################################################
> +# Valid skip: Downscaling not supported on second plane MTLP+
> +##############################################################################
> +igt@kms_plane_scaling@planes-downscale-factor-0-(5|75)$
> +igt@kms_plane_scaling@planes-.*upscale-.*downscale.*
> +##############################################################################
> +# Valid skip: Simulation specific
> +##############################################################################
> +igt@kms_pm_dc@dc3co-vpb-simulation
> +igt@kms_simulation_hpd@sim-hpd
> +##############################################################################
> +# Valid skip: Mei interface not supported MTL+
> +##############################################################################
> +igt@kms_content_protection@mei-interface
> +##############################################################################
> +# Valid skip: VGA subtests on chamelium are expected skips for PTL+
> +##############################################################################
> +igt@kms_chamelium.*@.*(vga).*
> +##############################################################################
> +# Valid skip: Use either of connected/non-connected kms_bw
> +##############################################################################
> +igt@kms_bw@linear-tiling-.*-display.*
> +##############################################################################
> +# Valid skip: Horizontal flip is not supported with tile4 surface formats
> +##############################################################################
> +igt@kms_big_fb@4-tiled.*hflip.*
> +igt@kms_rotation_crc@primary-4-tiled-reflect-x.*
> +##############################################################################
> +# Valid skip: X tile defeatured
> +##############################################################################
> +igt@kms_(plane_lowres|plane_multiple|rotation_crc|big_fb|flip_scaled_crc)@.*(x-tile|xtile|tiling-x).*
> +igt@kms_pipe_stress@stress-xrgb8888-xtiled
> +##############################################################################
> +# Valid skip: DRRS not supported on LNL+
> +##############################################################################
> +igt@kms_vrr@seamless-rr-switch-drrs
> +igt@kms_vrr@seamless-rr-switch-vrr
> +igt@kms_dirtyfb@drrs-dirtyfb-ioctl
> +igt@kms_frontbuffer_tracking@.*drrs.*
> +##############################################################################
> +# Valid skip: PTL+(igfx), UJ not supported
> +# Bspec: 69556
> +##############################################################################
> +igt@kms_joiner@.*ultra-joiner.*
> +##############################################################################
> +# Valid skip: Display 12+ is not supporting FBC with PSR2
> +# in case of selective update.
> +# Recommendation is to keep this combination disabled
> +# Bspec: 50422 HSD: 14010260002
> +# *PR selective update + FBC is not valid.
> +# *PR full frame update/PSR1 + FBC are valid.
> +##############################################################################
> +igt@kms_psr@fbc-psr2-.*
> +igt@kms_psr2_sf@fbc-(psr2|pr)-.*
> +##############################################################################
