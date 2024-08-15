Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF572C52D7C
	for <igt-dev@archiver.kernel.org>; Thu, 15 Aug 2024 16:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B3810E45B;
	Thu, 15 Aug 2024 16:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQR/grUj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BB210E4DF
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Aug 2024 16:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723741043; x=1755277043;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mh3MdwSFYldE8BX7Ndc0tWG1epnXqm9Kssdcd4uH4bM=;
 b=KQR/grUjs3DZrEysH+IJXWEa8jRtpKhbjkwkw+CdX5pRUlLCbw6alSPM
 FZ3ZV005E+gG3OI4vpwhwyMsKefIdEAcbYN4I55nu1WMG5IeLwn+CA+XY
 t5OQYkG2sX5fYSew8qgKkZl6fJSWhXwv+hciOGWsxMnH2ZZwvHjMTC+dl
 3WxT5CJ3SinGmvfJZyPPyRKnkh/Us3mO806G7XpuHhtFNKl5FShMRyGuF
 LfE2CdfjwGyAorAjA/whA8h0ZM1zDVEtYGOBxFVIeGGi9cdSNtrda4tlK
 ecaCEu8ZUFQf6Iupa0cJb77a3Ys/c3s8sO1l4S1BImOWZPzEcqtbOB2gJ w==;
X-CSE-ConnectionGUID: 95wcl7TnRnW2XLWjtQE09Q==
X-CSE-MsgGUID: PUuORCRFRXGSTPgeLMLPJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21979746"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="21979746"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 09:57:22 -0700
X-CSE-ConnectionGUID: 6Xf9No95QI27WmmUnXySPA==
X-CSE-MsgGUID: Q1hGTGr9RNKgQo5lpgVtWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59082821"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 09:57:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 09:57:21 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 09:57:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 09:57:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 09:57:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjfSfZFR8ftAZm9Crt/ltjYLia5AMzveDmwfVtlsAlbz5njmxomBHHvszAifd8a8eXokGMRa0SipjtnognR9W6xS5ktT6bOQJTUWWKYTlRtu2D3zi+ePuZ2E9HX5Zzxn5vzMdiMgj5t+weNrA2lQgMQpZ/e6b93QUl3Ob5YRCsiX2kZEX93XuruvXMfBeYnwsXwi83BQfrJTrYs7rbAUpUhEW7aTnI8QTnLTA/RwPS7InPhvi37w6MY8Q9IAq0DoFeL1K3E3WxeIr0brzeFiaoY9EZpruM3mPSL9hB7Y7nthRa82UjBd/spyqIgvX9aBbd4M1t5XIZWE2mAFj/+maw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PajbiiluXdnfCghiZ4fSszy6VGMkZLSAPsMnbmaa0n8=;
 b=Et/onYi8uW54WsDqKNoFoc+A3yrbMkRdo2YQw6OPF6LE1tf6/2QZ2AjqmuaAttz0Ez/V4nEp2mG0WNUIQZyt2zoFrP6kLhooqj+K2r+3103Gmmp0Asg/B4i83JVY3tZjVTKcUiGGq+fox0Qzexe56HMl3u5/MtFooxouzAOkUF6p01A4hXe8ErH+OqhYwGWI5e8ry3ttRg6nbefGj+M3mYc2IfmHpHJ+HScXtAfMampPcjQIJxkGZ6m/PLsgDIBZv3PRYJgobFs0ZLOArOtLcvhD7TcOg8ztr8n/FGD1YetlLyP/xFtriCuH5fe6x5LXnA8EUHt50q7Q+bS/wk2ogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB6652.namprd11.prod.outlook.com (2603:10b6:510:1aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Thu, 15 Aug
 2024 16:57:11 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 16:57:11 +0000
Message-ID: <a7cca758-ae66-42a6-be4f-c935d2fab785@intel.com>
Date: Thu, 15 Aug 2024 09:57:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_kmod: Unload/Reload the mei Modules Before
 Unloading/Reloading the i915/xe Driver
To: Lucas De Marchi <lucas.demarchi@intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20240815130423.7686-1-krishnaiah.bommu@intel.com>
 <hg3qro3dxili6n3dggarg75abttxeuzsqkibzviogpdvmylq4u@qan2mer3fh3l>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <hg3qro3dxili6n3dggarg75abttxeuzsqkibzviogpdvmylq4u@qan2mer3fh3l>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0050.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::25) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: 409b7b2d-861e-4143-e7e9-08dcbd4b4e85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dk0yM253cjFBNWRMekFZYldEUlJrVGlPV3RlRkMvdkNRLzg0QWJLbWhqUzVP?=
 =?utf-8?B?RVdGdzN5dGc1OTlhOFYvZVVVSEFueUQzbUNEMFhXMzlaL3RVZGJqM0FEWmdZ?=
 =?utf-8?B?OG1HTnRZbUYxNTlGYlp5OWNueXltQ0xESHBCUXViMGNZRy9IUGhwMHErYzJw?=
 =?utf-8?B?VTJHakVKVFdyVnhhbUI2eE5FZjBEZFNHMFZDclk5ekxmcExMOWs2QWFDdXlj?=
 =?utf-8?B?cXZZR2hnSFUxeE43dlA0RUxYVUFielE0bC9pZjNlUi9PZVJDWTZaTVVFVmZH?=
 =?utf-8?B?Si96N0JrOGlXVkZVY0dKWDNqMVhHbldZVDdYS0dLM1kxeCtiTENsTXVwbG9a?=
 =?utf-8?B?SndHWXdtTE5vZXFrQXRHYUlYQ2wyRkMyTkpQcGFKU3RlOS9rT2JEL1lSSHhu?=
 =?utf-8?B?RS96dk1EVFdKOVJKclJEOUJ4R096TUxsTzREVjNJdnEyVU8xd0NhS2VWck1s?=
 =?utf-8?B?OFY2UU5hTFFpcXUzblAvOGFXdFlSbk1mcmg1NFV0YmJQbEZYbUExYi9JSG50?=
 =?utf-8?B?eUNtQzFUbUJ5aVljTVhwZXJTc2taQVl2a3dWTVYwS3VmMTV1K2NlaTdUU3NL?=
 =?utf-8?B?SEhJaVZjL1FaNFF4VjdJRWZwYnI0STBFYzlrZTU3c1pYSHNrazArdVJqanNz?=
 =?utf-8?B?TlZscXFtblp6TXBrVWNsUkFyL1ZNZjVNL3hJcmJsVkg2ampkWGtIaEEydlJT?=
 =?utf-8?B?TWZXSm14MkEzQ3NITjJxQ2cwd0plMkdSMWxUdDFhRHlNcUFOZ09aUENJUVhK?=
 =?utf-8?B?M0t0RWkzbU5oZnpHY1d4MWFzQnRVbytlN1hEdUdRZG01cDBQd2k1Y1FaWlVH?=
 =?utf-8?B?dnE1V2NIdGJEZ1hFQThtclNOVVlSSEUvQTJZaVlWdDBWclA4bXZKV3ArL0dx?=
 =?utf-8?B?U2hrRHFjK2s1ZjBWTzExMzg3WWFHaVpPTEV1OXVUYWcza0l3SWxQN0tISGg3?=
 =?utf-8?B?NHluM3ZzcnE4RkdNMnRub1ZtemxyTDlSRzFKTDgzUDloTTZDLzF1dWNDWUlF?=
 =?utf-8?B?OGJKWGdYMFlRVDQ4QkNsekFYNk1ldUd1bi9NNS9iUHJoWFZndm10YXpIbUE4?=
 =?utf-8?B?M3hDZkIzU1hHMXVnVXVWMXJXRXNTNXBFdGxjaEp6aEpndStoQkJJZFFjUzYv?=
 =?utf-8?B?SG1pS2lET21zUi9KeXFJU1c5bGVCNmdBc2Z2dHhadXJtWFh1UTlZdkpKaStO?=
 =?utf-8?B?UzcvVzNKR2pkdmltN2ljV1VpcC9tWXBjbjdZdjAzN1lpdWovOUY1cGphRDUx?=
 =?utf-8?B?T2xlMXZNd0owRUdGMVFCcSsySEM4YUV0MXRiUUo0V0VVZnZ3NmJybHN5cHh2?=
 =?utf-8?B?ZFY0RWxZOGd4ejJueklMTG9UMEtBOFR2UC9oSkhmYVlSbHQzU0NVNTh0Ni9a?=
 =?utf-8?B?VDNrdDdmKy9iSXVPVzc1NWFXcExnOFl6Q214dXFOeFY4TWpkU2U3VnVSeWU3?=
 =?utf-8?B?eC9OUzh0OGV6VWIwWVJpWFk2dWF6YjlTcisvbHZVcHl6MUxEdnMySWR0SU45?=
 =?utf-8?B?ZmxhMVA1d09ZaHZQQWNFek9nUUs3VG1NODlYcmsyektPQTA0cUVkUGcveVkx?=
 =?utf-8?B?M2V5NTNibHhjZjVHeWxtNDZMOUNDN1lQRjluN2dsYXUrdmFnT0F5V05tVk1O?=
 =?utf-8?B?dncvTCs4TFN0cEV1WXIyQ0x6TmFKNFhVd25MS3NXei9XbnRsUmQ4YjJIWTZj?=
 =?utf-8?B?cTcxVGRIbjVubEJFZGZ1empsdUt4cVhxejFRakdOYm5tY2gyQkk3ck1hNUc5?=
 =?utf-8?Q?q6rUd286h1qLx7UM50=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTBVczlXRlhsbkdHMWZ4R01CckZvRk9ZZDMzS0VhSHRCYkhCZkNkRXZrYTkz?=
 =?utf-8?B?NnVad0ljRTJReUdxYW8xcVNkSUpkYkQvcWEzN2M3ZExUa0l3UFozMmUyeFNt?=
 =?utf-8?B?RHBERVZBK0FrcTdZSW5rZE50a2E4MThqM3FvQXBpelBrZUNuWG5NQmNIOTdE?=
 =?utf-8?B?RDc2OHgxT2VJSnJOMEFhbHZ3N25ZQzljeW5kN0lMSUI4TzE1Sm9GVlNuUmVU?=
 =?utf-8?B?S3ZscXpidkVYRE9KRm9qaG5CallNU0dPWUE1OE1PdlRJUU5QVTc4NkU2cVFV?=
 =?utf-8?B?NWpyZ2RNdVJua0tJV09mSDRtSTRyck04KzU5RjhHMFBOV0VSeHNDLzdxbm5R?=
 =?utf-8?B?bUplaXkvNFprYVFVRHdWK0VuRTdGSWRFc1hvWjhERFhEUUVHbG5INFJvMzZx?=
 =?utf-8?B?eDhTMFovT1ZqOVlkWHN5WmFpQmdzMXJrNDRsVno1VXJpYzFGczc3RFVjVm9o?=
 =?utf-8?B?N3V2S0tLSTlxQ0dYWHExNFdlZHVCSURFMmRwdDgxVGRnQjRmRDhKbWp1REVu?=
 =?utf-8?B?MGdOemdJVTgvWDdxQnRUbURrWEYrWnFVd1d1amM1RGs5R2o2RkZYVmRjS1Bp?=
 =?utf-8?B?dEhHNTQ3TUNMOTBkdjZsaVovUTZSWjNNSkl0djNjeVJxSmZIamNQMjRWL1Zs?=
 =?utf-8?B?b0l5R1VBZnZrTmFMZ2dMTHNVSmtlWG1kS0I5Zk5wNTljWktUakhNQ0ppSzBr?=
 =?utf-8?B?bk8wakZ6dVBDeE5GRjBWRmd2SXZSRy9UOWcwNWNpNXZ6b2tWYmh6NzgvdXdX?=
 =?utf-8?B?RmdPdU4xZHBPUWR3RlE5NVQxRVFobkpmYmNWNnRaMDJZVVdEVHdjdHNhM29l?=
 =?utf-8?B?VUd0cnpkRXZ6Sy9qcXBUZFpIZi9GU3RQWldMdFZqUTN0NDBQZXZFeWdMQmgr?=
 =?utf-8?B?ZFptY1U0eHljVXNVUSswVEdUMVczU0NrUERWcXZualhRZDRTUklTNStzUWE0?=
 =?utf-8?B?UGNWMW9MdDAraUpzdURhM0JzcGNqUFFWU0tZYmRDQzFiQlJEZUpkRWVlVTF1?=
 =?utf-8?B?bk5kbXlsS0hhQ1JMOWo3eVZ5bFh6RXJxSmNIaDZ3Nk41NzFmbEFrZGN6ZlNX?=
 =?utf-8?B?M3lYVXRoWlRad2JkbFFxTTgyVUpTYzdVcUVJajhyUGlaNzFTWmlxUzcvcEFE?=
 =?utf-8?B?SUFtS0x3cjBtdTJaK0JJUE8raWVJYzZLMjFaeEtZZ3JaZUduaXdjNnBPQ2Y0?=
 =?utf-8?B?bjJrK2RiUmpiQ2pzRW50eWN3dmNMQkFmTTRQRE9SVGVUck1UMDhHQ2F5RkpG?=
 =?utf-8?B?aW9GckVMT2tKTlhKMm1TMVo2R1l4QmlEZUVEV2tsUDZadHpQd05CaEJYRjFL?=
 =?utf-8?B?UXZzNnROdGhVY3Rybis1cEtoaTFqMi92ZHMvRHJLUGMralBrTXpOOFpSN2x4?=
 =?utf-8?B?akJKcUdiT1RNSk5iQVhLaWgvRENLS0NCVXhqeENQbGMzbkl2Z3l1dXdJMjgz?=
 =?utf-8?B?dHJpMGNOQWdWMFNsbXVlTUNoNkhKbEgwelQyRWlqNkhQcFFqMFJ5RnY4NGdh?=
 =?utf-8?B?QVU5R042VzRYeDNMa2FKQjl4ZHVLdWN2OXRyMnRTZ1BHNHhELzRtNm1xOUZo?=
 =?utf-8?B?emlsYTVDVndlWlc4M0pXYmxsZHNHVTdNcFlMN0dOd21uL0Mvc2U0SXpTVldr?=
 =?utf-8?B?U0pZSHV6YXE2U1pReEFWSk1xWkR0b0t1MUF1SjdYTlZZQml3NUlUc3BmTWJK?=
 =?utf-8?B?VWpvdjd5UW5FMHd4cnFlck11YmhtZXpaZ1Q1SkVNL1UrZG5YbVRnZTRJOXZi?=
 =?utf-8?B?dkV3TGRiMG9jZ2JQaDlWMTBseWxDYXhGdGYrZ1pmQ2liTWZ2QUV1Y1dFYzlC?=
 =?utf-8?B?K3Zsd2kyek1QRTQwQ0M5MzlhbGl1eER4UEViM0dJSzNkUStvSFR6MkZQUjlT?=
 =?utf-8?B?MGRYZmNKeFNEWEVackQ5UU5maVhjNWt4WFZHMGNlTTZiNTFEQTBFN0VEU2E1?=
 =?utf-8?B?NG4rR0IyR3YrVG1CdEtKRGhteEV3QmpzOTBWTFdFb0VBSXlZRnlodDN4MGhv?=
 =?utf-8?B?UUpHOWJDMTNGV0xQRjVkZmFXbmZYN0FSZG0yajlPUVlCSnJDWkpZaDJPVjdC?=
 =?utf-8?B?ajEwbjlMTERkVEVzUUljM2lKWnNjWVlvenhldWViYWdMdEh4R3JQTUV2M3ln?=
 =?utf-8?B?cHZZY3JNSWQrM2FJaE1lS3lZZXIwV21qSDluM2xXZHdPSGE4cFgzaXdWUllx?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 409b7b2d-861e-4143-e7e9-08dcbd4b4e85
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 16:57:11.8850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Ea22vW16b6R7gq73d+PCR0Bkkc0f0CyTmlSwOmvx4dMJS5WHVTiwG+OInMR7wMnSOCsAhrubQknaEzofNv9DbogLRmbtPuiw0cIbn1iwA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6652
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



On 8/15/2024 8:20 AM, Lucas De Marchi wrote:
> On Thu, Aug 15, 2024 at 06:34:23PM GMT, Bommu Krishnaiah wrote:
>> To ensure stability and proper module management, this update introduces
>> changes to the handling of MEI modules when loading or unloading
>> the Intel i915 or Xe drivers.
>>
>> Key Changes:
>> - Unload Order: The `mei_gsc_proxy` module is now unloaded before 
>> `mei_gsc`,
>> preventing potential failures during the unloading process.
>> - Platform-Specific Handling: On platforms where the MEI hardware is 
>> integrated
>> with the graphics device (e.g., DG2/BMG), the MEI modules depend on 
>> the i915/Xe driver.
>> Conversely, on newer platforms like CLS, where MEI hardware is separate,
>> this dependency does not exist. This update ensures that MEI modules are
>> unloaded/reloaded in the correct order based on platform-specific 
>> dependencies.
>>
>> These changes address the need for a more robust handling of MEI 
>> modules across
>> different hardware platforms, ensuring that the i915/Xe driver can be
>> cleanly unloaded and reloaded without issues.
>>
>> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>> lib/igt_kmod.c | 38 ++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 38 insertions(+)
>>
>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> index 464c0dcf4..6ee2b7afe 100644
>> --- a/lib/igt_kmod.c
>> +++ b/lib/igt_kmod.c
>> @@ -480,9 +480,29 @@ igt_intel_driver_load(const char *opts, const 
>> char *driver)
>> {
>>     int ret;
>>
>> +    const char *mei[] = {
>> +        /* mei_gsc uses an i915 aux dev and the other mei mods 
>> depend on it */
>> +        "mei_pxp",
>> +        "mei_hdcp",
>> +        "mei_gsc_proxy",
>> +        "mei_gsc",
>> +        NULL,
>
> all this manual approach we have for module unloading should be gone
> IMO. Replace that with 1) unbind the driver; 2) unload the module.
> There's no need afaict to keep tracking what the module uses.
>
> as for loading, why exactly do we have to do the kernels/depmod
> manually?  If we have to do anything manually like that, it means
> real users won't have that and we are actually missing the proper
> integration. I typed something on the different types of
> dependencies (harddep, softdep, weakdep):
> https://politreco.com/2024/08/linux-module-dependencies/

The mei modules are a bit of an issue because they change behavior 
between integrated and discrete. In integrated, they're loaded on the 
CPU MEI device (the CSME) and so they're completely independent from 
i915/xe and we don't need to unload/load them them to unload/load 
i915/xe. On discrete however the MEI device is a child device on the 
graphics card, so the mei modules depend on i915/xe and need to be 
removed before the graphics driver can be unloaded, but are then 
auto-reloaded when the i915/xe is re-loaded. So for IGT we have 2 
possible solutions:

1) only unload mei modules if we're on discrete, in which case they will 
correctly auto-reload when we re-export the child device.
2) always unload mei modules before unloading i915/xe, but then we need 
to manually re-load them because they're not going to be auto-reloaded 
on integrated.

I'm guessing that if we unplug i915/xe that's going to automatically 
unplug the mei driver on the child device so maybe that does help in 
avoiding the unload/reload flow?

Daniele

>
> Lucas De Marchi
>
>> +    };
>> +
>>     if (opts)
>>         igt_info("Reloading %s with %s\n\n", driver, opts);
>>
>> +    for (const char **m = mei; *m; m++) {
>> +        if (igt_kmod_is_loaded(*m))
>> +            continue;
>> +
>> +        ret = igt_kmod_load(*m, NULL);
>> +        if (ret) {
>> +            igt_debug("Could not load %s\n", *m);
>> +            return ret;
>> +        }
>> +    }
>> +
>>     ret = igt_kmod_load(driver, opts);
>>     if (ret) {
>>         igt_debug("Could not load %s\n", driver);
>> @@ -620,9 +640,14 @@ int __igt_intel_driver_unload(char **who, const 
>> char *driver)
>>     const char *aux[] = {
>>         /* gen5: ips uses symbol_get() so only a soft module 
>> dependency */
>>         "intel_ips",
>> +        NULL,
>> +    };
>> +
>> +    const char *mei[] = {
>>         /* mei_gsc uses an i915 aux dev and the other mei mods depend 
>> on it */
>>         "mei_pxp",
>>         "mei_hdcp",
>> +        "mei_gsc_proxy",
>>         "mei_gsc",
>>         NULL,
>>     };
>> @@ -647,6 +672,19 @@ int __igt_intel_driver_unload(char **who, const 
>> char *driver)
>>         }
>>     }
>>
>> +    for (const char **m = mei; *m; m++) {
>> +        if (!igt_kmod_is_loaded(*m))
>> +            continue;
>> +
>> +        ret = igt_kmod_unload(*m);
>> +        if (ret) {
>> +            if (who)
>> +                *who = strdup_realloc(*who, *m);
>> +
>> +            return ret;
>> +        }
>> +    }
>> +
>>     if (igt_kmod_is_loaded(driver)) {
>>         ret = igt_kmod_unload(driver);
>>         if (ret) {
>> -- 
>> 2.25.1
>>

