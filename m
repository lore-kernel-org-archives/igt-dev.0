Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E424CA0EFC
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 12:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA15110EAF8;
	Fri, 22 Aug 2025 12:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDa6xEdz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE2010EAF9
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 12:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755866895; x=1787402895;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EXnKXmoq5p48NSLyTfQG/LZm8UyAwJ7LxH8US+ESn/U=;
 b=dDa6xEdzG1vHRhZtD3vIScOR/a5ehoiqfLmR1/WcjWUhSUGfMZqyqje2
 QT8nUXJiiT57yyqW9WaIsFyqGcJkNf2P22ctrOSYiTpLIj/pul/X6jwQB
 h8I3BIucmFjdcV4+wRLQ/CGR454XOZwQcWLMEILNenmvrjrJp5JvBpxJq
 RYCoMHAzj0DcyC/4mkkLSX3JJwK8wnr+Fq2Cs11mj0Gh5AHD5b3I7sLPS
 KejSKsNZXzcdFwF9lz1irA1jgnk+Eq8s0vF6iUCd/oB+8mYvPwax4T6ck
 CVVzFb3p6DtEK5473bPFKxf/YYyka4aAipQljIoA4J58E7tngACAXXuyv w==;
X-CSE-ConnectionGUID: HWxC51mSR063NF/5XufyBQ==
X-CSE-MsgGUID: FCvz5dRKQC25m22w7DjN/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61985236"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="61985236"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 05:48:15 -0700
X-CSE-ConnectionGUID: dZ9JYetSSmyB2Q1WgTbIGg==
X-CSE-MsgGUID: bRH3Gp5qSMuex/hJRJJlwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="173117251"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 05:48:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 05:48:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 05:48:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.81) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 05:48:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDdei5RIbyAziboo/xhK/FpBwRoGztnprc85OZvBMl07jfvBHwcuTNSGsb8kONpbSrD5xHXnLUMkkNA+uqLCooRoIUr0c029/CJ2lpINN+Zrr04C4RDOZYADIWjbd0x6UYeEceIz7h+nCjN2p8+Mr4cOjIjA77mRAhMvXarvGLRKZelUIA6OVLF3gtUdBaLpUcp7l7uxdJUHXIflBA3+DAGEVMcR5gRMQHvSnSmgBc+M4xxJetfBOTDGc0ojNzDf08vCG92cNXtYj22g1Y10Kjcy9GDcO5iVp8KXeaQzw3kmZZrI2/e1Jes0WG5YKq9lLuGkQfyERHh0/lHkAScjQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uxuXUzf+97+DqM6T1UBkhJlU0gA7OJW9rZbOFZFBPE=;
 b=n0BJdLdsXC15R/53DWiYNQ+4vUpNMWDOMb/vVsF2r52UbJTEOHXuF1UdiamCManWraNLRZGVzJggWJWxjRO1/anjIeSijBsXFS5SyqaMZuEGSocEzdb3UYj7n6jBTHvQKF3IP+8FGFve0Z2vM0O2D9TK8nMIdFP06S9ZiJUc6bER0he3aEAvY0Mr37rXi3t9mrTVjnOtIwU23x81Of1hdM0GbZ5PkfQHfUfH9L14MLjgy4X2eUgryX3wna9rgcM8ZHFRX0qcW4ZYe8AENvEgHSqOjNzeYIbMLIi+hHpbipsxnu71+UrKPtVc0g4bri1ZUGRnNtYAhf1zSzorUkMYOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CY5PR11MB6164.namprd11.prod.outlook.com (2603:10b6:930:27::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 12:48:12 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 12:48:12 +0000
Message-ID: <c08912d8-b0a7-4e3d-a616-60f88d0f4d97@intel.com>
Date: Fri, 22 Aug 2025 18:18:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_sriov_flr: Handle missing
 provisioning data per-GT
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250822093908.414306-1-marcin.bernatowicz@linux.intel.com>
 <82bd517f-f746-4c9a-b6f9-e828d9e16a58@intel.com>
 <1f44e5d1-860f-434b-a212-1e3e6d1f95f8@linux.intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <1f44e5d1-860f-434b-a212-1e3e6d1f95f8@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::8) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|CY5PR11MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: ac8b5a0f-5a40-4373-e766-08dde17a27a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlNNaFJxNzEvQWh4ZmR1Ui9wUzRUS2J6QnZ6MEZ0VmVNa2xjSEZMY2ZkdHNx?=
 =?utf-8?B?ZWROTG1iaTBmdW8vYWlqK1NmbXVsTStjbzhxbnpZZm45TTVQMTRXbjF5NTBO?=
 =?utf-8?B?V2phdEs3NTVrZmFhUVZZMlJ0V2V2UWRVZ2tJNEpreDN0MXJEU2l1UnVPYWRJ?=
 =?utf-8?B?QzRCNC9zT1k5QjJmR0JQeFRGNUtHeFRKTDU0SWVBbzRlT1hXM0RLMVByL3F4?=
 =?utf-8?B?T0tNL25jUEFEU0krR3dmK2VPa3BVYWVScTl4TnI1c3RtNFFPOTZGZXIvOGFl?=
 =?utf-8?B?emRGNjhZVmtDYXpsalA3K21JenJUQXp1VTM1amJxTzdJdjMvelV5YzdIbVhn?=
 =?utf-8?B?OEpEZ2dqcXB2YlpKSDFqdk1ETHcwYkU4SzZxZmZCcFV2MXRCenFuN2FKTUhG?=
 =?utf-8?B?U2tibmFjNmlNSmNKOG1LNmd0WkYyNHRISXh5d2F4VmRtL1QvL2lXN1ZFdjJS?=
 =?utf-8?B?Sit3LzFHU2FZUjR1OEdNQ0d3UDJLdTI1S0xSeWJpMis1YkFvSnZpQmgrYml5?=
 =?utf-8?B?SSt0V2JjeVAxQlhIdFd2UWFhcGR6cXBXbzVuZnZscEFHWXo1TlBST1JDM0F1?=
 =?utf-8?B?L3phdS9pV1ZTbWhuYXExZVVVL3JySGxGU3FRYkVqa1h3SGZqMnZaU0N3WmdI?=
 =?utf-8?B?Nlh1Nk16dXBvZ0g3M0t5WjNrcVllZGdiVTMyT0loQmVTN2VBbnZyRFhDVkFj?=
 =?utf-8?B?WGxXUm5kRzRGQnB3WDlXSHNLbG8zRGgzN2FnaUZCdFBncmNyUVdqcGtQS0Zm?=
 =?utf-8?B?TktLbkRJV2kwQXYydWpsTkNnSnhvbHpYeWkwMGJaMUJFR0FyRDJZYzlvbjND?=
 =?utf-8?B?bHRJQVFYd3BwcWtEWElrYW43SENER25XalQ1djRlK25XRFVuUFF4ZWUyRjZE?=
 =?utf-8?B?VnBOYXpWNGFTSGltcHJpcVR3THJucUZ4OHNoNjJXSVRPS1NyL3BiZ3k1OGcy?=
 =?utf-8?B?ZEYyNjl5Q3ZPZmhEaWV2WG9yMVkxT0cwNW91TW54LzlvUUIyNzg0ellYdGhG?=
 =?utf-8?B?dW96Tmpna2w4S3BpRzlvWTl6cnpGZVhScFF3MGdmTUFKeG1ZUXREMnNVTDZT?=
 =?utf-8?B?S0VONjl3aTcxWFBuUXcxNmIwYjArdFdNN2FuN1JkS1VpOUtrRlp2bmszWkNh?=
 =?utf-8?B?VmRJNXVueTgwSG9naFIwQUdLa1kxbGVNN2FFUDE5bTFqYXovMWh2NUNlbmJq?=
 =?utf-8?B?cDZuZ0VXWUk2L1czaWdsdEpCbzBsdVVTTUREZXdPalVic1J2ejkrWkdTcE9s?=
 =?utf-8?B?cnFaQ09vdW92T1BzUkF4OHhGVno2dC9FZExWdXFCZFNLenFZQ0tJVVRyWjNP?=
 =?utf-8?B?aHVxY2hVaVNCZlhrWFMvd0hDRiszeCs4czBkV1ljZzd5U3ArQUU5cHR4cXpi?=
 =?utf-8?B?YmVpcy9JRHdzUzh0YUZaQkM1V21YcVN3Y1dhQVJmVHp4UlF3aklxVnF4TjZq?=
 =?utf-8?B?dHphWDh4QXluNkRib0lPOEhWYU5FdThyRk93cS9Cd256RUE3T0VZKzcweHRv?=
 =?utf-8?B?b0N6MEdBNUtSbXdGR0U0NnJLV3pvWHpzYUpCZE45aGE4YklWTnhxbUdxSnNH?=
 =?utf-8?B?eW9Td1pWVFJFdHhYUUNRSnNVOElqTlFpUVk4UXdMRFJiMGVMbFRZMzNiYkhz?=
 =?utf-8?B?ZHBQcFFMSy9qcGt4b0pMd0N3ZTEwTnp2RkhKN0hycjN5TTR1dmJMQitQcUpM?=
 =?utf-8?B?a1lQNjhiZU0xSVNMVmJEd3NBNXY0TzlHc2djWnJDYWREc01maHFxSStpVnpn?=
 =?utf-8?B?UkIwbTRuQktQTFZNVis0S2ZweDA5NDNWWWN0bmt5bmxRbnp1MTVpR3RzekFo?=
 =?utf-8?B?SHN1NmNBdUlJVW9pV2xSNmFyZEFkYWFjSzFaSDM2NDgxdWpaY0dDMHRxbzZ2?=
 =?utf-8?B?OXpXRkIyQlRpUjVGUFZLNE5IbUFFRk5GQ09OdmdWbWFEd3RUd1Y2ZG5GT0Fh?=
 =?utf-8?Q?kULDe6vl+i8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEpIcytBdFFVcXdhbGRyckRkM1BjZHFZMDB5NzdJQWhUblQyaDJndUtObWR3?=
 =?utf-8?B?MFh2V1M3SEtRMW5ISmpETklPeXVTanBzcS83NWR5TEltNlV5VmR0UmExRHNo?=
 =?utf-8?B?QUZqaVAyaDdiT2p1THFrY0grNHR3a2JudjlNR0xlLy9zZlFFbVlBbWV3RlRL?=
 =?utf-8?B?UkxKNVJTUEtibVgrNnk2Sk1XU3Uwb0RwRU0yRmlyNC9EbkVFUWtDR1lWT1dj?=
 =?utf-8?B?RnorRGFTOE94Rk55SU5YdStLekFpTFpxeHorM0pZRi9jVi9ZQUhmWjY0UXZk?=
 =?utf-8?B?WkowNGZlenpqMjVqaGUrRFBueEhDWG9RMmhYelZXd20yeHhVcldWa3htVVZo?=
 =?utf-8?B?TEwvMUF5UThwMjdSajhiMmVaK1Y2aFVmWlYrZkl0RE5zR3RSbjVUWkhrRkZE?=
 =?utf-8?B?R3pBMDdFMFVybGxiMytBV1FvdjZPK0NhNmh5N3JESGhCRDFJM3VWMTExNjNO?=
 =?utf-8?B?VFNWMVZqUkpuZE1iQktQNDROby92VldPbmcrSmVqZzd0eWZNWjFhVmVKQlM1?=
 =?utf-8?B?SGozU2Z0Y25FNlNGa0o2eWQ4M25GeGxLcGVYb1NYMWpud1ZuNjRzVmpyK0FO?=
 =?utf-8?B?VjgyNUowcytQUHZ1QlRJUDU1ZmVydHZHdHJtQ0pma2lVVEZXcTM0d3JvUm1L?=
 =?utf-8?B?YzFINUJ4anlGRGlHLzJrUjd1R3BqK29SckpCeXp0WVBmM3lFaHlQSk1GMzZP?=
 =?utf-8?B?N0d1aW1BTys3dUZteTc2UkxHUWRXenA5NUlUOU1tY0lyOTR2SnFIc1FVWHFX?=
 =?utf-8?B?VWN2cXltMDlPWmJ4Y21iZEMydlI5NWhmMHhMTTZUeXd2UmZYYThHN2d0MDlp?=
 =?utf-8?B?UWtleEJCOXZKOHBJNGhsdGZkdHRucVNoOXdiaUJYMDBYTXdIc1QvVFhENk4x?=
 =?utf-8?B?N3h0U3VuWW8rdEUyRmE0ZHoxc3RMeDgvcVpwS0tVOUZuNnBVMWdma0JSLy9K?=
 =?utf-8?B?MmswNTdvcFEzcXBhZ00vTkdJS3N5d0hsQkEyeHFRaDdKM0QxaTNSSnBHM0Qz?=
 =?utf-8?B?ak9YR1ZwNW54UW5tWlltYThOVXhsMVlNdlpuTDFmNEIrMmQvSDl3M0xhN1Jz?=
 =?utf-8?B?UHpHL2ZPSDJ5WVFmQkY1K3JtcEg2QnM0QVFIOENWbDVhWUpMSjVBUkpSMHFL?=
 =?utf-8?B?ZElDUmFOclc4TUVsZnBBYnFhSGpSNytMQ2lSKytKL00zZm4rVHF0VTQvWWtS?=
 =?utf-8?B?M1Y0QlVmd1hYWDlWQjNBb1UzTkpnSnNhUjkvMVR3L0o5cDRrTFdCTytIUFFX?=
 =?utf-8?B?aHVxc0hxUm1OSzN0d2lPRm9xWGcxWm5QVlZEbjh4ejFYYzN6K01IaXprV2hS?=
 =?utf-8?B?QjNxNjFEbHFYcjZiVkd6RDdScDFoenFaOTRyV29OdU5IeEFacXJST0lTeEZF?=
 =?utf-8?B?d05TNHU2QUQwZmxTL0t4MHNwcWlsM3pyTk5lc1h3YS9BVzJhd0QyK0lLVVY4?=
 =?utf-8?B?NkdYSGRDa2tjb2F5Z1Nsd0tWN3FORHBObHcxNTErV0x5TzJBZUlmQXJURHBF?=
 =?utf-8?B?M2pvZXMrV3c5Y3M5VUlZN1NhR01iVTNlckQ2YkM5U1VyN1FoSy9WSEJPWmxI?=
 =?utf-8?B?clhnT0ZqdzNVcWdVclpPUmNHTmdDQkRFOURvOVJxMkpwYWJIdk5vcUU2cDJt?=
 =?utf-8?B?OHdMeDA1TVROZ0V0dXNsTStxdnZ2RDRiUlJpaitKM0Y4ZEgrQytjMlJIdWpo?=
 =?utf-8?B?MXhMekNXUkM2dmlrdnl0ZGVSNkl6eVQzeVJ2U3hob3h2aU44UkE4dXR1dCtP?=
 =?utf-8?B?aWszdFRVdDU2RWVHbnlzd3pCbzU1UkpleURhblg0RlRqMzhwSC9YdU05cTBm?=
 =?utf-8?B?MFJqa0w4Q0ZUV0s5UDRBa01BRzBOYnhOTi96a1ZrZjRQL3NqSkV3cnBBZ1FY?=
 =?utf-8?B?N3pkRG1PTHdha0V1NGVyakxwYTVGTlNqcUNqNFpYSlZkTVhhSHhOWmVUaFJ2?=
 =?utf-8?B?VE5GMm5hcS8xd0t6VkxYL292RnRVL2NZY1E5WDN1ck5xT2doZFRUWWluVkdl?=
 =?utf-8?B?T1Fsd2NxTXdNUi9pT1ByY2oyTlpRRC83eGxRdEF6dDUremk4TE1vMk0vR003?=
 =?utf-8?B?SmhMMDR3UFhoL3FwcmsrRnNiR1RYdk93ZWt1UWo4SU1mbzBYbUtXVWR3VndS?=
 =?utf-8?B?d09xNjRtTFNtZndmeWdrcG56MHpHTjQ0VGVSRHdKb3lRdXJFQ3owR3RoTzBL?=
 =?utf-8?Q?v3EEX/XukXdacyPXuUjoMfM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8b5a0f-5a40-4373-e766-08dde17a27a3
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 12:48:12.8022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ddtgqVD1YabzKlXppk1nKopkaIAoqDRe1bnNf5qMvvpJww6x/A4enDsR4/X7MtZTvNN/BxofzT+FIiiGi+vcsND1VWBoOP3eWeuYgBJXj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6164
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



On 22-08-2025 15:51, Bernatowicz, Marcin wrote:
> 
> 
> On 8/22/2025 11:47 AM, K V P, Satyanarayana wrote:
>>
>>
>> On 22-08-2025 15:09, Marcin Bernatowicz wrote:
>>> When reading provisioned LMEM ranges from debugfs, some GTs may not
>>> expose provisioning data at all. Previously, this caused the test to
>>> skip entirely with a "Failed read" reason.
>>>
>>> Relax the check to treat -ENOENT as a valid case and simply continue
>>> to the next GT. This ensures the test is not skipped unnecessarily
>>> when provisioning data is absent on some GTs.
>>>
>>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>>> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>> ---
>>>   tests/intel/xe_sriov_flr.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
>>> index fc08703c0..9eebe5f71 100644
>>> --- a/tests/intel/xe_sriov_flr.c
>>> +++ b/tests/intel/xe_sriov_flr.c
>>> @@ -816,7 +816,9 @@ static int populate_vf_lmem_sizes(struct 
>>> subcheck_data *data)
>>>           ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
>>>                                     XE_SRIOV_SHARED_RES_LMEM,
>>>                                     gt, &ranges, &nr_ranges);
>> Is it applicable only for LMEM? What about other provisioning 
>> parameters?> 
> 
> GGTT is already handled.
> 
> -        if (ret) {
>>> +        if (ret == -ENOENT) {
>>> +            continue;
>> Can we add a debug level print here with GT id?> 
> 
> Something like: "No lmem_provisioned attribute on gt%u" ?
> 
Yes. With adding this debug print,
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

> 
> 
> +        } else if (ret) {
>>>               set_skip_reason(data, "Failed read %s on gt%u (%d)\n",
>>> xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
>>>                       gt, ret);
>>
> 

