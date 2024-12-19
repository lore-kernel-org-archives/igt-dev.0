Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BA8E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 23:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958A110E2B7;
	Thu, 19 Dec 2024 23:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kVOxUN7V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A9110E2B7
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 23:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734651237; x=1766187237;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MYoXweMiGWlhcFwKIfb/qmfC2fXC66fCoqrMlaFjQTs=;
 b=kVOxUN7VRL9vYyEMK63d/yq/PZUc/cKh6ZpX1CBMxUnrDC1X56aezdeR
 NoCTlkJWm+UKi/VGNtTJv3HSQOWmQR+MZtvVKXkOFEBuZImFhxbfK9pcs
 bmJQoOSiQNYiFG8Qr1iYu3H+9FJn8rFX4a5QeWwXXSprDtuDotPQoKOJp
 XXVHAikPX4mWECLct09AVB8lhJaGyhvGCsszt6lnLUl3k4iwig97cERzG
 hZ7vygJmmufJlgueI6P/+dbKBwoFw0WJ+CBexSacnkoISLMyqBvSxyu4T
 BP0MQOFqFJdv4/lRdr5h5iHRJdbZkrzz8tSXC8jpyqR9eVGgIW3l/BrPp g==;
X-CSE-ConnectionGUID: 0JQQUmCfQCqAKUgvji7f0A==
X-CSE-MsgGUID: EvtaPGN+RxOinoiwGqSGKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34516618"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="34516618"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 15:33:55 -0800
X-CSE-ConnectionGUID: fJschuefRseCHxkg12e/zA==
X-CSE-MsgGUID: zqaxDJSaQOiLf3PwDJ4jhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121623776"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 15:33:55 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 15:33:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 15:33:55 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 15:33:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ES6I+JD+S2L3RNAmnr2J6qndeQgAbnw4noTKFNLxe1yhGoBB7KiQTGXA4HJVCgRWu59HyNga+V9xxahWW8bTRv4NNE5XN7PfcBTC6F1ocvrzHUqJELBdbCI4GBweKsLRlQELvc1ZFlbXSo2hrg+YIYV617KAvbNiHl5Po6urHZ2KbkpwXswWAogcNLbsNeYWnHaE90uN9swfoUGTV+KYGQrdhqNUOCJ3hX/M51738q0aRZxsYViPO+ON1vxwujgXM0TAFivZAKCj4bPVWOKeW947tbTDKWSPPyBxL3Qdq63ZQ19ab1eqrwEQgfYEHnLc9B3Y5TbKteVA7n55yjhc/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucrr5MbSp1h3Zzg+xUMtaDKKIflaA6uGhCqdj+XGCb0=;
 b=ZqBTOPpj4GGxmUkE1LPU+DrYLXbX17JgPn+z8l+luq5Ns/mmGeKhKRkcSBWzOdlh9NhkmRW1DOeoHVD7tIs2zC+ZqI/LkEOSZJP38ecpXc1S00mKPbmTLsIt58a7sti9vB2zgNnFVVKULF1OOF+neYdebwJUhM91UnBiRc0+IYBMN3rsevkDTd3Ows1ZhrUJ1WD7b/Rp2fZ0SNvGOQhKBjon3m3gzHrBQko9txfbCUiBXN6Zd7xgWT1oKyojWTMh+6G3+UBmHpNGSjcEC5IALn54FrCpga5plSjnBT/CqYlNOUJOg8wXlQcVRTw/gP19z8pt6QSisLnps67tm7sqlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA0PR11MB4688.namprd11.prod.outlook.com (2603:10b6:806:72::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Thu, 19 Dec
 2024 23:33:26 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 23:33:26 +0000
Message-ID: <a80eb8c5-1679-4cdc-90db-1c1de2f3747e@intel.com>
Date: Thu, 19 Dec 2024 15:33:24 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/3] lib/igt_kmod: Make sure errno is not already
 set before unbinding
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20241219230517.2492196-1-daniele.ceraolospurio@intel.com>
 <20241219230517.2492196-2-daniele.ceraolospurio@intel.com>
 <44eqlwtjr5vvyjaystcoqk7zpz7bi72oezfo3glsdwiu7wlff3@5zc63q2oamu4>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <44eqlwtjr5vvyjaystcoqk7zpz7bi72oezfo3glsdwiu7wlff3@5zc63q2oamu4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA0PR11MB4688:EE_
X-MS-Office365-Filtering-Correlation-Id: cdeeadba-70fe-43d5-8436-08dd20858933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWN4TUd5alR5T3BHNHNiMjE1U2dhYTQxSVBsYjMxTU5yT2xtamRIcm9JbFNl?=
 =?utf-8?B?TlEyeU16bUlvNVNwck1tVEI4eDhhakUyMEQ4L1VBUnFqLzZCNlpTRXYvczFB?=
 =?utf-8?B?N3FOcG9LQUhxdFlhUGNMR0ZTakFURGJBMjZDc3FUNThteDl5dHFnaEVrSy8y?=
 =?utf-8?B?c1lyRVhzdGVOTkxHSTU5eEZ5emd3MVVkZFFHd3B3MHhjQVFIS1E2REw1bndl?=
 =?utf-8?B?SDY4Vi9xNU4vZStRbURRMEVMRVg3YkZpaVBMUkdZZW9qQmhuWmlhY3Zici82?=
 =?utf-8?B?UlVFbzdoZ0pFdWJ1cEdDeDFwS1ZiQ1BEa2dqU2loMUZwcWU1N0Jjdkd2NGc3?=
 =?utf-8?B?bG5HaTMwMkJJM2ZtcGZEcjAzOTFoNUFPMTJtbWl2R09ZQnkzaUVKdUpWeGNG?=
 =?utf-8?B?b1haOS9jRS9lbEptV3ZPMFJDZUF5S3pwSFJJVmVmamxKSFRlYlgzLzBiditO?=
 =?utf-8?B?Z1dQc3lyYXJQbUFHZUZWSDVoc1FhazlMUE54bW5xelF5RVJsT09SeTlOR2NF?=
 =?utf-8?B?bEp2MzZRSTJTbnZqU2NRWkRzQzZtT0VGVXVVU0tON05qRlVORjJTNndkZStB?=
 =?utf-8?B?NEMvU1pVdHFJUzY4d3d0dDJQZGRveFhubzU2bzE1a1JEMkRpMW1JWmVoMmhu?=
 =?utf-8?B?a05oUVU0YjhxMVlHTWF3KytQcjdrQVhaUDZodXRUZGQ5MitWZjZra2FOTkoz?=
 =?utf-8?B?MlIwKzFvY1FJbHJ4V0RUb25QWW40dnpQdWd5WS9aRVp3cmdtbDBNeVFCVTZY?=
 =?utf-8?B?endaNER2TDFVVzNQY1gxaFA3WlBvSGxBc2htcGdZZitWV3Z4NkZPbnVxVXhG?=
 =?utf-8?B?cll5cEpQbXNHTmxqL2REY2pKdUt4ZU5UQzE2czdxSk1oOURieitCbzNNT1lT?=
 =?utf-8?B?UEpIc3BNWWRQckpFUnBweWtZeDVKajdGdVFLYjMzalRjT1JON2JnYXY4WjBM?=
 =?utf-8?B?Q1pWMklReSt5Umg5UDBPUlZ0VUluMGIxNTNsL3FxZXlQWnNKdUNxaXNzVzgr?=
 =?utf-8?B?akN4SkNjKzc1UGNXb2Z6YjRDNEVWQmZ3cHIyRXUycngyaUNKanhLTHFOWkdz?=
 =?utf-8?B?V3hRMWNhYzJ2Qjk5dUF4WGdyNXZlVloyUjRLbFhtcWExTnUwMzYzUWszRzZu?=
 =?utf-8?B?SlpzQmx1UGNjVmJ6QVQwT21PbjRTOUZXdEJmTXZzdG5Oek5MZzU3RDZGYTBn?=
 =?utf-8?B?U0JBcjNWMEJ2KzAxMkNrV3FtUTYwSVhmQVpiUEdJZEhQZldYMnBhcU5Qc1dE?=
 =?utf-8?B?eDE2ODVkaTl6K1g5YVlSdy9tOFpWbmJIWUdQT0xwTy9WWUlXZDNyQXZHTnp1?=
 =?utf-8?B?dUpLclBRT3pHRHhOanpYcWpFeUxZY3lpL2tseVpVT281NUdtbkJDU05VcUV5?=
 =?utf-8?B?YTlVYkt6K0sxVXNOYzBNWCtXbG5xcUQrZXhIa2x6bVZrQTg1aWdzZ3cxcU9W?=
 =?utf-8?B?dWxwbVlUY2NYTmpBMEdwWFZzUnpCb2IyT3dEWTBZUXJFWUk5V0JRU2t3WUFr?=
 =?utf-8?B?Z2pwT3d4M1hTT3ZFQUZ4Z1NZRElReWhpWDZHeHc5V2tXR2dwd1lQZm82M0pr?=
 =?utf-8?B?RzFhcytvb2c3bE9QNW9vRDIzcEtNVUdPM2FVbE96ait6dXphL2JRY1VQNFhw?=
 =?utf-8?B?L3A5ZVVKQ01BcnF0T1lpRGJSUHVpaGNQNjF2QTg4Q2RHc1NPbkcybm5mT0dF?=
 =?utf-8?B?UXAwNlJndXhidXo4Y3U3eXlNNENIMUVkbFlvblArN3ZJRGE3OEY3ZDc4TEx0?=
 =?utf-8?B?ZHRHcHIrVW1MZ2E4MFRCZFRBMUhSQ0NFTHlDS1RtTHZsVGtsU0ZGUUJPVTlS?=
 =?utf-8?B?SGwyWE1RaXZXZUJ5SEh2dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTZwdkdnN3NvTWpoNWlDRm50OUVVVUw5OFpUUmpHR2dBSXJIZ2NNK1hxOGxZ?=
 =?utf-8?B?Snc3cHhXMEpUOWJNcjc0YVNQeG1YZmx1dENndHlVQndHaWk3NkJRcm03NHB2?=
 =?utf-8?B?OGxnMVhpR1ZmUGF5UlZXZExUZHVxUnZaM3pZVm1TMkxPRlIrZkVkRytTVGh3?=
 =?utf-8?B?L08xSUlGdjVzLzh1RUlHbG1YU1V6SnJWQTMyVHJMbk85RjRzWWtEbmR6SFpv?=
 =?utf-8?B?VWR5TmRwWVNhRkRidzhIc0JrT0VZTk1FVzJmbTF4QWtEOEdheldQZnRSMGNy?=
 =?utf-8?B?V0VwdzBVSnI2aHhMQ2RCT09uUENicDVRaE5DWmpnd3k1YmVYNkFoQ2xUQ2lR?=
 =?utf-8?B?NW1pWVJtZVN4Q2sxZThRTXd1YlFLM0UwazZkM0I3dU1iemtCWHNiYTk1aEQr?=
 =?utf-8?B?UUhLdVhTTkV1NmkvQWFwM1VFS2ZFbjdSUWNIeVpJRzhzNDJXYzF0ajBLb0pQ?=
 =?utf-8?B?RXZ4RVJlbWRJeTNtRGUybHpKY0RPMFZtSDBoNmZzQnNlakdTN2tWREQvdjIx?=
 =?utf-8?B?ckJvODJ0M1czNkFzVXZJZ1ZKS0IvUkFadktBRHh2M3NJRlpHcWJWVFRYd3hQ?=
 =?utf-8?B?YXRoOFFCdEhDV1ZrcnVSZUV4SU9HS2FuS0hzQk8yNW1SVXo5NTNFU2x1RFhp?=
 =?utf-8?B?SFBwMXZXbzZ2UjNMV0w5SlRFV1FrNy9WZ0pZR0FmSjZJSytTUDdyRGcrSlp6?=
 =?utf-8?B?bEpUUk1PRE9xVlV4b2Z1Y2RsdVpBMVpmaU8zQW8vcWRyK3F4NG15T1drZ25i?=
 =?utf-8?B?R3ppa0JSR21rTlZtTUpJR28wclAxdW9Hb01idVdiU21EUDBqcUhPcHVpbzBu?=
 =?utf-8?B?OUszZXdQa3dwbnJHOHgrR3NoN3JqVy95NWVXLzU1OWJUSHVLMVBHK21mbjA2?=
 =?utf-8?B?UFl0Y3dyREovaURWeFNTOGszRVhRbWwybXhIdVNsOSswU09hSWxNQnA5d0hS?=
 =?utf-8?B?Zjc0dG9teGJkMWRvamV5azQ2YWg3SjZtbjFGOHZYL1psMmNHeGdrMWczMTJv?=
 =?utf-8?B?Y1F3YmdDQ2Yvd0FYV2c2NDBrRFNEYS8xamNrY01aaVBRNjBNK1BCdzdaV0tw?=
 =?utf-8?B?dit2d0JVT1FtRHA0U1JWNzhDZzVSVGw4MTJNc2FCRWNNRVdZZ2k1ZjBJb016?=
 =?utf-8?B?STJYSkVZUXZNQ1VpS2lWUlo5Q3N5T2YzcXNKbE9odXI4eFdPazlYRUQ4ZzA2?=
 =?utf-8?B?amNJZURzVUdPWHBEQThrTEkrZzJUd1ZtelZubHVTaVpEZjEzTjdmRlFNdC9F?=
 =?utf-8?B?ZjN0NldYN1FmTU83ZFZUcDlZdUtveitLWWhtb1UxQngrb0xqVWJib1JkT2Ex?=
 =?utf-8?B?Q3N5eU8yaXF6cTdXVmI0dDBxaTlvMDU1Y3FtdlhMV0ZadWFNRDZ2dy9BOGR3?=
 =?utf-8?B?SHc0VTEyaGwxblF0dGt3V0JpMklVdFRKUDZYV2RuUUI2TE9NcFVxbk9FZlZC?=
 =?utf-8?B?NUR1NGZOcTk5aTFjZzRIQ3JwZi9MNHU0bERITTZaM0pha3FpUEIwVTBYWDI0?=
 =?utf-8?B?Sk9vd21va3VaUWpUUFNNd0F2eWxJUVdMWldDR1VtdktPQ0FHdlR3MnBYdmFr?=
 =?utf-8?B?aWxUVXUwRnFaSEx0QjJqNnFVcTFjRXluSmg0QTdGSU9aK3hvUFAyMEd6aXk5?=
 =?utf-8?B?OHhTVzA3Z2xnS3F1alJ1WEZxcXpqSWFmUWlqelBmR0lvK2Y0N0ZmbDRIUDQ5?=
 =?utf-8?B?NUFIMkh5MU10cmYxbFErWkp5ZlA4endXY3d1SWFOTnRzUE9RekNxUEtkNHB1?=
 =?utf-8?B?TE9zeHAwK0RPejNWcGkwazNqNzJQbno0bE5RMEJROENOWTY1NSsyQk40MkRK?=
 =?utf-8?B?NVlKNmZoZkJsQkFtcnhmMTFtQ2V6OVllYi9hTXJNK2Via2l6SWZoM01rWGhm?=
 =?utf-8?B?TURkTURYWTNXMjE4N1JKcUgyMTFCclFBazZmVGU1QzBhQnhDOG0rN2tIbGFn?=
 =?utf-8?B?NzEvL0hWUzRBekVYOG9kdjZzbW1BRmYwa3VYbHNMZFZtVkQ0VkNpR1lwcS9o?=
 =?utf-8?B?RU9nZjk0bnZOU0E3Zm9NWlZvTk9qNU13YVY5dFBQbVpYa08rSlZ1MkVsNjZs?=
 =?utf-8?B?ODNHNU9BTUtPbjhtQ2t0RDYwM2NWL3dVcEFTRlJPZHJyZlpTNGhxaHJ4dldL?=
 =?utf-8?B?MVNiaC9Ucm1WTUpuWmsxNmJnRWJPOGNXcHIzK1cyeC8wOHkxcm5SK20xMG1H?=
 =?utf-8?Q?fcK3nTREhVzIYRXNgh6WbO8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdeeadba-70fe-43d5-8436-08dd20858933
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 23:33:26.2382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 161yu//Ci6towES4QKKvHZlpcHQoK0yA0PRt7rhn9TTp82lrhBuBv7OzcCQgJiK2jO8cMJ11Z/2vwzWpYUHkHPZPgy6wqKi53dvP+jSI8tQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4688
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




On 12/19/2024 3:29 PM, Lucas De Marchi wrote:
> On Thu, Dec 19, 2024 at 03:05:16PM -0800, Daniele Ceraolo Spurio wrote:
>> We assert that errno is zero after unbinding, so we need to make sure it
>> wasn't already non-zero beforehand or we might incorrectly fail.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> The non-zero starting errno hitting the assert is reproed when using
>> unbind in the 1915 reload-with-fault-injection test:
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html 
>>
>
> yeah, but I think I made a mistake checking for errno. Checking it
> outside of a call to libc is odd.
>
>
> I'd rather remove both the assert and the setting to 0:
>
> if we have an empty dir we won't ever reach the `errno = 0`, making it
> the same as the `if (!dir)` in which we are already returning 0.

sounds good, I'll wait for CI to make sure no other issues pop out now 
that the test is running properly and then respin with this change.

>
>
> This would be a
>
> Fixes: cb008246b0c7 ("lib/igt_kmod: Rewrite xe unload logic")

thanks, I'll add this in.

Daniele

>
> thanks
> Lucas De Marchi
>
>>
>> lib/igt_kmod.c | 2 ++
>> 1 file changed, 2 insertions(+)
>>
>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> index d73cb4101..a008b3c29 100644
>> --- a/lib/igt_kmod.c
>> +++ b/lib/igt_kmod.c
>> @@ -662,6 +662,8 @@ int igt_kmod_unbind(const char *mod_name)
>>     int dirlen;
>>     DIR *dir;
>>
>> +    errno = 0;
>> +
>>     dirlen = snprintf(path, sizeof(path), 
>> "/sys/module/%s/drivers/pci:%s/",
>>               mod_name, mod_name);
>>     igt_assert(dirlen < sizeof(path));
>> -- 
>> 2.43.0
>>

