Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E8CFED2D1
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 07:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4E710E15C;
	Thu, 12 Mar 2026 07:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RwY3esJG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD06C10E413
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 07:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773299387; x=1804835387;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ek0DvotG8caPV1GTp7HHjLnpMrrLqJ6o/Yd+ZiT1kjM=;
 b=RwY3esJGDbUbIc36OpZqhNRS2qyoN798Yjj5DX3yhEYGlal4Y6afhtkc
 YSzIRY/QVIVw04KCD6TUJHg/HL3tfv/m+7/4DIcS6F3NNEbfOJxCx8+cX
 8FBedPchhuRoVukjUJPNyqZcfZrCmMYmLidGNTLOP6bXaLU2txDTlVeUZ
 fdi6AmpEh53VznsaH32IPJkAoaFt1IOdH/b87tkaQY6pvgvzg/TCeZrWU
 QK2+2eESGtxMSpfy3lcMolzRGoTjRuZirWIdpKTHTmQkyrjtCMmkJoNtp
 ecrlD6t+++BYENyVfxE3x0Ow5ss9+mCq3JiqbyswbVKrgTab+k/7i5dOy Q==;
X-CSE-ConnectionGUID: awsMwex4QwyMA8PoRG7QJg==
X-CSE-MsgGUID: jtPqQphMQ3eRdriyJpineQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74349270"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="74349270"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 00:09:47 -0700
X-CSE-ConnectionGUID: c0ep/lwHQL+ZpZa+aOrH7w==
X-CSE-MsgGUID: ZSAh0vrKQneb9Thdb8fnbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="225428566"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 00:09:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 00:09:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 00:09:38 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 00:09:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9dytOoYQwwywBAQqxZ1jpVY3Km5I03r1/1wq62AZeeNk0jWIFRjkwvfXk660pbumq3Z7GZnc959syuaaf+q7sy3gWA12WyFBxVASAiNfB+9WgRR65rWjLHTJD4bbm1fImVzMz6dqrCXlPkRRhXUuFbDnzlrE0gHS7jmeBJ0Jzln7RwoZXmJqZvxed5hAFO1oFjfAIUzQiQBmpA528KdoGO0eZnhcg1rjMEUjoiAqf1WKHUKuKTIwAcPmGcFWMX8TMXDfT/VziMD3+AurktJedCGA1gpkshhb8lCA7N/SBEzk/3UrfZ6J25djHDdS7WIJskkYKtuJzih8PLyqWMStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKAFm3pYysJw44EqT5xFpbDO8l/1FKqQNcISAp1bIFQ=;
 b=XI1/Sa4wd+gowIE5hU667dfDQweGUSZRuIweuYcfjor6601+9iNSlw5SwonsFl3kQmSZqF3XkbDy2xld5sp66urv6NrT7ndqCitUHdQJnd8LQSvUsDh/oM9GHB+t/6BZ/0vtORGnhgygJGOlwqdV52kYdXGZPKh+OL7rN4x6ewTcqmKumiAcnLlovrKZ4HtN8WjdF0bahnJFnQxOULGRuBf2ooQPESVfN58Fm5znO1GVMDQWXMaM3rt2Oeh5h8u7GiZa1TUaBx3tEeZzq7XS9RNjhq+xhrdNQuyrxFKugX82HzYYZQlkLyKBCkixlf0LtDXMwClwj9OOGXnd8F+JZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS7PR11MB6126.namprd11.prod.outlook.com (2603:10b6:8:9e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Thu, 12 Mar 2026 07:09:35 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 07:09:35 +0000
Message-ID: <8068a1e1-9f33-4edc-9e66-67f038c2eead@intel.com>
Date: Thu, 12 Mar 2026 12:39:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel-ci: Add NVL core blocklist
To: <aditya.chauhan@intel.com>, <ramadevi.gandi@intel.com>,
 <himanshu.girotra@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260311122606.42223-1-aditya.chauhan@intel.com>
 <20260311122606.42223-2-aditya.chauhan@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260311122606.42223-2-aditya.chauhan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::6) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS7PR11MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: d3228656-7e8c-4ccd-4ba4-08de800650cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: NAoeOL1g36xKOQbr7KB7CUyM4mnQ8xQiS4d4TfO/3NW5byxSsVnB3kkp9nRFc1Y1HLr0dPvNZsBABNyp18OHhqpF7b8mBlVBGavjq+rDRLnZfkegCivJS0KAN1ZEZMZf+O74DDVDHXWf3k8e4MzlW0qja7HuY7zgLwa+9+MSnMMxtinVh+VLzKk0yrwx0mEkP2/u3sGtwRsmtEYhWjNEkM0AibLzXzcRTdOXMzAyexg6K6aKrnPZSjb+4H+qC3JthWmpEa7xipDCeYFgTw99VtShBtOsrnI7Zg2mX8rkxTZzC2PuMSJIBGT1CpplUQh/qgwORzie9Fy36ZVLTjzUDGp69vIn7Ek0hNk1qoOnj3q8k9GsD7ARw65paDFuZK1c6rN4J1wOSYfoSeBtWP/6Ah2GVBIEgInXPwgHB1eMNwxdHMmS6eknn2f9y5Lo+7J52lUW/0rjpZlXj0E5WGsN2vYaRQIBRAFNRaf8yZiIzrjnDPeMoqo8UGed+kCbB0pwmLIO1839b6Gqnn6X6IEl+0rSCphVjKbcEiOyvKSQ2+V0yb+J3ounjD7kYFRjZQg3uiPdLo57pZnuVJdw9qGXyFUA7mzUIJpLzRfRMD8WXpJKl/kMUciqVs8+rK/Sjx2HdsruJ7vU7BKrfbPD/xnm7a6+8lSPLOCwfZ2uxXcSoYC9MLAy9cB1/wMs3z4OrYmhLpVjkk9lokJ5CxfRmHN75NZGP5GfQZBAxw83RvtyUyM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHlQWlNSRk5yWm54b1B0cy9rY3RGakJLZVBMNEVpZTFkZVNJRC9QTWpxTWEz?=
 =?utf-8?B?MnAyeTU2NXpiWHZMampVT3kwNWRZUVhXOGpJUEJvNDNOU0s3MVhXOGRxZ3Ax?=
 =?utf-8?B?K2VyWFVyc0llcndVWmY2NC82K0lFRDRleVAvVTNua3dCTE9oeWZQRkJKN3ht?=
 =?utf-8?B?MEZNeURZZUtTajdQQ3VxRnZVUXVUK0Q3OEhsL1BxVEpnUWNwNE5udWcwSWVZ?=
 =?utf-8?B?Sll0U2pVa2Y5d3ZBTUczREhub0ozd3dnMDdIQjgwTTM0UzBLa1M2Sm9UVFhP?=
 =?utf-8?B?YW9DSlhVMURscHd2WmlqUXFEd1BBV3hJa2JvaGVDZnZqUksvT3A1a0l0R05G?=
 =?utf-8?B?ZmlJTVBieG0reDFBcGIxT0JjVTh2SXgzeVFxL0ZYbXpWYVA3RFdDWHI4VzR4?=
 =?utf-8?B?YWhPMXVwRzhtN1NsUjE1TExJc3pDOEMxNzU4bFVKdDJZR3RFK3hmL3ZBcU9W?=
 =?utf-8?B?SS9zeVp5Tm1kL3lLbXkxZXpLOHpJVE5TYXRPV1NuTXUrT2dQSFduQXVOS2VW?=
 =?utf-8?B?NWFnSHBaNldOYVk4cG5wTzYrV3MzVjEweDVTZnlpb1hVeGZmVHdRbHpOQ1B4?=
 =?utf-8?B?cS8rem5VQ3g3ZEx6NTJlUy9ScHJ0NTJXZHhZNERoZWEvdmhnY3hJRWZEQk5w?=
 =?utf-8?B?RURQNHdhY3poL2pTU1lGRXNKa3FxcWdsemMrWDZvQnB3em1WMjVUTTFScWFJ?=
 =?utf-8?B?NEV0Q1FjUGs5Rk05b1YrSzRaV1JaYTMzazRGQ2RMd1dOd09ZVGVUajFuSDY1?=
 =?utf-8?B?ZWV5S2ZrZVNIM2FkcEFQcHJNVE9rYzZDaXhOT0w5RTlXVytNTFZIcWlVWXdn?=
 =?utf-8?B?NTJGUm5BdFlReEpuRjZaWElrQk03MFUrSDlIdnJPYnlBRDZPY2VKV2d3cDhK?=
 =?utf-8?B?NWI4WDVEUEYzVFJLVWxBd3NsOXdCWlkyUGhES0twN2RZcHo4SEpsMUlzSzE3?=
 =?utf-8?B?SW5xRm40NllnTm5FNW1WME1wZk9kRlpKSk1PWlp0ZHJHSGlMVEs1TjNXQ01t?=
 =?utf-8?B?SnUzbXJUSFBMd2s4SHp2R2ZWR1ZWYzczOVNHREd2UDZrRG1UWHpsNWdXOTNv?=
 =?utf-8?B?cktYM0VtRFZrZGFwcXE1NFExcFhEbW9PSkdwaUFDNGxTczdMNnJjV0FFeEdi?=
 =?utf-8?B?VDZwQmJDbUNXTHMvSzRUbjVSeXA4MWEzaUNVT2lyRGV3SVhxMTdiVWdQcCtM?=
 =?utf-8?B?WjBSMy8rUU5FTk9pRzN0NHJ5TGFGdC9DclpHTEdkODBFODNGTkZsSWZLWDZQ?=
 =?utf-8?B?R2hCVS9mdkNaOUVSRzdmUTJ6cnh6U0N4MWo3bGkvemc2cVBPdmZ3WXpJeGZh?=
 =?utf-8?B?ZHRIUFNONThPQ2JsUFNWaFRjWWdpRmFPRDVWQUs0dTZJd09jeS9tcmhZMXFy?=
 =?utf-8?B?ZzVZa2hEVWdnbzRGZmxuOFA0STU1dTZnUTJSbmZIVHY2Q1BPZHZQcGludHhO?=
 =?utf-8?B?UGpsOXY4aVJVSnJsRzhzR2hoVms3MW9rUGFSUVd2TmpBdGZBVkRhS3JENE5V?=
 =?utf-8?B?eEl5ZFd6d0VQcjJoaDhpcUlSWXEreHpjWkRTN1dHTWVEZFJUOTN4QmlFT2tq?=
 =?utf-8?B?T3V1SlBFWG1EUWpiMnBLREJ0UlhCRG8wNjU3UVNPVVp6czJQYlhMUjVDUUtT?=
 =?utf-8?B?azVsMDB1WElQQzJZdmZNaWpoV1lIR2F3NnBlZ25PSnNZMEhJNE1ucEp4UlRY?=
 =?utf-8?B?Q1hNN2p3aWQ3WWFNZzc3ZVdiU2tpMG83RlFiNUpoSldGb3ovL2Y5MWNMQlgy?=
 =?utf-8?B?OWVkb2U5di9YMDFMMlBBV2pNR05pR3FmM3ZHUW13UmIrclg0K2pEaXB1WDhs?=
 =?utf-8?B?M2p3d1pBMm11amlUcVBoVFFNOTNSWGNxdjNaK0Z4TFM2OXVuTWNINDRyOUtI?=
 =?utf-8?B?UWp0a0ljVGtyMnpSZmlocmpSMG5EWDBwNFZ5ZEFHV1FnczNDYURqbWhUNzZm?=
 =?utf-8?B?SW9GNlJWdmoyTFNDeHB6UVhGVlI0SjVZQUtqQjVpVkFnUm9aR0F1VGZvN3ZF?=
 =?utf-8?B?aTlIZDA3ZmdjQzBveTdTblF2M0RseVJxYlNVb285RWQyTDhiSDl3QjNnRmdD?=
 =?utf-8?B?bjloTWdBNGFidWtkQnhRQUh6Ymdmd2N3ajJCclg0OXFNckRJTnVwbCtnSjhu?=
 =?utf-8?B?Y3VOa2JmaHV1Zy85R0lFUnFCblNjMjNhMDJZckR4OE1mV1MrNzV4YlhXcWo1?=
 =?utf-8?B?d2taY05MdExqWDhOa21tOTFOaTFBYVNQdWgvblRkMkVTNUdCNERkalYxZUZR?=
 =?utf-8?B?OC94aVdhT2drSUljejNYeXBTcG1nOWhHUml6dHphR1RKQkg3QlBWUXFSUGFp?=
 =?utf-8?B?dzlLeG1xR0RzeExEd0xqRHViOFpDak05TU1LczBQa1dDdFhZY0RVZz09?=
X-Exchange-RoutingPolicyChecked: OCDrI0UAUYHFY4zmIz60QqZ9x9t411fQtb+nUSP5aQdsPmhTq569M8Iifp8XU3c20MXZZECc9ZDaauv2T7vH1RT7l3dzZravBxXD4EgRkQjKlIdxqaK6k4UF0UqHR7qqEWTwPVPJ1jkE565jbSukpAn97Ocs2ctumuWNU+UI9pgs0mKfAiLwRwc8ois3vWOkTpgWYWubmi7CwHDB/x+VHp5J4Up2jjjCHLY8sIgi1Xykj2tqf1wxruh44bCZlRqZ+XLx4njqrpt2S5HqKIityfbCUh+ypFsvvxyGiZy4taQzQyWk4weTYR+FmqW43ZMC5kpcFiBvCwEJ/ty6KPA9Ew==
X-MS-Exchange-CrossTenant-Network-Message-Id: d3228656-7e8c-4ccd-4ba4-08de800650cb
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 07:09:35.0561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwySnVKq1G4dBI4HUL8Wa1xe3Hiv8IzJ3GygD+7pT9s2knB2Z1CXd2Z7LOpGM9DMaYqUUWB3d+etK4fk+vKjvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6126
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

Hi Aditya,

On 11-03-2026 05:56 pm, aditya.chauhan@intel.com wrote:
> From: Aditya Chauhan <aditya.chauhan@intel.com>

Please remove this From,

Also add proper commit message describing "what"

> - Add xe.nvl.core.blocklist file to intel-ci
> - Update meson.build
>
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>   tests/intel-ci/meson.build               |  1 +
>   tests/intel-ci/xe.nvl.core.blocklist.txt | 69 ++++++++++++++++++++++++
>   2 files changed, 70 insertions(+)
>   create mode 100644 tests/intel-ci/xe.nvl.core.blocklist.txt
>
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index cf0023c63..a1e9dff55 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -25,6 +25,7 @@ intelci_files = [
>     'xe.multigpu.blocklist.txt',
>     'xe.ptl.core.blocklist.txt',
>     'xe.ptl.display.blocklist.txt',
> +  'xe.nvl.core.blocklist.txt',
>     'xe.sriov-vf.blocklist.txt',
>     'xe-sriov-vf.blocklist.txt',
>     'xe.sriov-vm.blocklist.txt',
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> new file mode 100644
> index 000000000..297651d43
> --- /dev/null
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -0,0 +1,69 @@
> +##################################################################
> +# Tests NA for Native
> +##################################################################
> +igt@.*iov.*
> +##################################################################
> +# KMS - Display related tests
> +# Other Display specific tests
> +##################################################################
> +igt@.*kms.*
> +igt@testdisplay
> +igt@xe_pat@display-vs-wb-transient
> +igt@fbdev@.*
> +##################################################################
> +# Expected skip as iGPU has no vram
> +##################################################################
> +igt@xe_mmap@vram$
> +igt@xe_mmap@small-bar
> +igt@xe_noexec_ping_pong
> +igt@xe_create@create-big-vram
> +igt@xe_evict.*
> +igt@xe_pm@d3hot-mmap-vram
> +igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
> +igt@xe_compute_preempt@.*vram.*
> +igt@xe_vm@out-of-memory
> +##################################################################
> +# Expected skips as the test are expected to run
> +# only on older platforms
> +##################################################################
> +igt@xe_pat@pat-index-xe3p-xpc
> +igt@xe_pat@pat-index-xehpc
> +igt@xe_pat@pat-index-xelp
> +igt@xe_pat@pat-index-xelpg
> +igt@xe_media_fill@media-fill
> +igt@xe_pat@pat-index-xe2
> +##################################################################
> +# Expected skip for the platform as the tests need more than
> +# one CCS engine
> +##################################################################
> +igt@xe_compute@ccs-mode-basic
> +igt@xe_compute@ccs-mode-compute-kernel
> +igt@xe_compute@eu-busy-10s
> +##################################################################
> +# Expected skip for the platform
> +##################################################################
> +igt@xe_huc_copy@huc_copy
> +igt@xe_exec_balancer@.*
> +igt@.*@.*tiles
> +igt@xe_oa@oa-tlb-invalidate
> +igt@xe_pxp@.*
> +igt@xe_exec_system_allocator@.*
> +##################################################################
> +#Expected skip for integrated platforms
> +##################################################################
> +igt@intel_hwmon@.*
> +igt@.*@.*multigpu.*
> +igt@xe_peer2peer@.*
> +igt@xe_mmap@pci-membarrier.*
> +igt@xe_pm@d3hot-i2c
> +igt@xe_configfs@survivability-mode
> +igt@xe_survivability@.*
> +##################################################################
> +# Kernel support not available
> +##################################################################
> +igt@xe_eudebug@.*
> +igt@xe_eudebug_online@.*
> +igt@xe_exec_sip@.*
> +igt@xe_exec_sip_eudebug@.*
> +igt@xe_live_ktest@xe_eudebug
> +##################################################################
