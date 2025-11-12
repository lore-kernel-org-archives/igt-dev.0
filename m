Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3837CCCFA1A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 03:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B168110E17D;
	Wed, 12 Nov 2025 03:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXV55JdU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6266D10E17D
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 03:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762918137; x=1794454137;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=ZNlwNPNUdmzxpizwQR0dkuU3mNcdTpL4Wd/rNLH9WWQ=;
 b=AXV55JdUbNhVlNpO5At/VGaBEbrD2iODWmHb7oppW8KBYSElYZOO/xQL
 +i5FboC4opxsjtX+njapxfYv1UjoqiRlIgFRCyRqEMhAG+SCj9SRusMso
 pHB496Q5mNIfN12plWIM2cIXm4FndhRxmIboLwoZQ81LalUlniaQWToWz
 cc6wiLBdt+ek5nua8xy21sVlj2TBIUFuIzVCF2hXvm5KdKKak7+s/U18t
 6UnsL/PhQhxoBDWDQUMORYiKxHEwJxjBtcF1oH2Qyls5u6HSwTF4hGuHR
 Q8eKlN4YRgZ4jMeuQShl6yBjCLIxrP62tCc3HH4LRgqRwtTXT3jB63i53 g==;
X-CSE-ConnectionGUID: UZ0lKbt0QauXQ1m4Nbdcdw==
X-CSE-MsgGUID: CqTYiBt6Q4axJEOx6N16Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64683135"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; d="scan'208,217";a="64683135"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 19:28:56 -0800
X-CSE-ConnectionGUID: aooBgYoYRLix5Svp9gPfVQ==
X-CSE-MsgGUID: I/GwMLwHQOG81OiWu/erJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
 d="scan'208,217";a="188873212"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 19:28:55 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 19:28:54 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 19:28:54 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 19:28:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfWzXyzRHUKFSku3WPujElQXdUxABVXnGVHq54MIMp8VVbrD1vbSAIg08OvqiIGZ4t6YyfbLBl6LDkhYmjNfi0GqmlnSODaxw1Wlh0yAErOJJcRc9FENK3mQAsBBqtDT5kERFhwKfW0mx5saz9oRNK2LEprNr3Na4WmaaXc+sfw9D+jrhAsvAYWmYHE6E09ii169QX8G+mEs8YxQcUDrlrzJY9wehHrAVHuzsKwNfWad3qlYJOiiCKl2FUjzrAAzdD3WL2Dp9NqCPLzIjIwj18kk3yrcMlpufrQUkOG8V3JkUHfKxm6B0GkNkPRooVN70jxd4uYFwrTinNAyWHivxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzjIIsvbRO0AqzVPefRTHgYt1bqR02mYhPlPHAEzKFk=;
 b=m7We8QoBubdUsQ1uKY/uqGwtThXFCvws6oKycnHgNwWmVUfkR2HOWAbpKjkYQUQ9bYqIFQ73WpHBiy+cY49ymYXoaoptPKJFFhjYFZOXjfyyqvBTjk6mLXxriR0HaiSrenA1L6mn8BJcM3YFH6FNYXs8rXDeLLtScfScSbk4lTU/QM5uYS8X78JuvPknghoyu3ob1ON+rKOkIfknK7HfMSXQT4Em4QS0yDeY8HBjrz3pW6C78ip59nix8+JjzbO2jmH208OkKlzNTN9JIonXUTPD+ka9rDZ9CUJ8CH+zRarOlpIU3rOcvmtxkwGEvChYWNGwhhIAmG5DeMOdK1lFug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA1PR11MB6990.namprd11.prod.outlook.com (2603:10b6:806:2b9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 03:28:49 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 03:28:49 +0000
Content-Type: multipart/alternative;
 boundary="------------M46UgTBlhdWDzfeT06ANmlNX"
Message-ID: <ee2f4302-2367-406e-85f7-eededbecfb56@intel.com>
Date: Wed, 12 Nov 2025 08:58:43 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/kms=5Fjoiner=3A_Cleanup_igt=5Frequire_checks?=
To: <igt-dev@lists.freedesktop.org>
References: <20251111041505.2438654-1-karthik.b.s@intel.com>
 <176286623899.41671.17125294086201523519@10055242dc62>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <176286623899.41671.17125294086201523519@10055242dc62>
X-ClientProxiedBy: MA5P287CA0179.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA1PR11MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a56082-7a59-4601-cb5d-08de219b982f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|42112799006|376014|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2NXNXpKNGVBZG10QWhmMEsvdTVWckFqNnFOYjI4dkNYdmI3RVh4bkhhTTlw?=
 =?utf-8?B?UGI3Y0FtVlJOWUVkSDdEZXRjam1HbzdCVHJGdllnZzFuWmRoQ0hLWStKT0RO?=
 =?utf-8?B?NFNhVTNVNERyS3JibnlkVkgvaStmd2ZsUzQ4QUFzZVhZNitNQVFzdFdpaTNy?=
 =?utf-8?B?aGdlTnh2WVhIUEVKSnEwcStBR0JaYyswQmNNWjVWRXhZRWttU1pCbERrVVBZ?=
 =?utf-8?B?S2MzR3hTcWJxbGR4d21uTTFjOURPZkJoSFRNemVVQnNabjBzQ2tqZHdqUXZQ?=
 =?utf-8?B?SVE3c3VZMlhJV20zQ2tBUEJhUWx4MFNCU3llK3BmYWNPYU5kczZnczBVS3RH?=
 =?utf-8?B?dmRVT25TTld2ZGdkbkZxakxMV1JBUXBtTHVwanVnVHV2aDlMckdrNStqSjBV?=
 =?utf-8?B?SFJOdUcvajcvakdEOGE5OStBWmFTV1FSb2lsTUhJS0xHanNUem8yR0s0U1cr?=
 =?utf-8?B?ZTFOeEVlVmxWOXhEUWxzV2hyMHB0TWt5SGtkVlFNdit3M0txVDhid0s3N0Iw?=
 =?utf-8?B?dHR2ZjJmdWNYdzdoU1hXVXZqSlJtMnBNSmR0bzNQbmtOWWVVbEYyUDdYWEpO?=
 =?utf-8?B?MjZUV0FZN2N0VHRTT1Myd3BocHk1YlEycFFDa1VReU5EMGpnUFU5b0NKL1R4?=
 =?utf-8?B?aXkvcEpkTDBHTVFQY3hVWXVTV2RNMndNMUhHaFZ2aW4yN3Q2NU9wL2xsSmhh?=
 =?utf-8?B?Tnh5bGlKUmdpZzdzdWhibHRxZS9SUmJyUjQxWC9YQ0JkdDZTMWZGWlBWTXpp?=
 =?utf-8?B?c3BML0JTSzNrVkZKR1ordFFadmhJaXF6OWpmRmVablNpY3JKdFhrTTBXNys4?=
 =?utf-8?B?Z3pWdG9XYTV1WkJySy9sbVBhd3JGOGxVdDNUSVlYTnFMUFFKbVM4YTZmdHdK?=
 =?utf-8?B?a1RXeXNQYmJ5K21FNVpQVUxCQTVnMXkyaUZNTXd6bHdEcGY1Mi8vQ1lndUIw?=
 =?utf-8?B?REFVNlpSdEVDMlhrMGJzUmdNbGNUckdsRld2RHZGL25raThyNVA4NU5VSWo3?=
 =?utf-8?B?ZE1BbU5FUi9CT2wzOUdxSy9wcDhsVzBNYXFyMDZIUXBCS01BT0RSNjE5eVcw?=
 =?utf-8?B?WnhpcVdwZFlqajk5bGZqUndwajlOVUx5OXJsLytobFhMb1ErQXhIQk5rTFRi?=
 =?utf-8?B?cjBteEdmVm5UcnQ4N3pwTmkrYURVa09KdHc3UXRSNlo3TWlNRCtQTnFPT1VV?=
 =?utf-8?B?Q3NkbVYyRHFGQ25aNm1CQTUxaU5WVUJVM09FMjFZVE9yd3l0anFQalBudDBY?=
 =?utf-8?B?a0ZOdGkwQ09oTnd0M0JRdTFMeTZXbHBlbGIxN3p4aFNvL2l4YkFoVmtvaWk3?=
 =?utf-8?B?Z0M3TkpjaWJveGZERG1Ec0JJTEg5QzIreVVIQzRzYWhyQ1BJTzA1Z0txZHZE?=
 =?utf-8?B?T2JsZzA3UFN5NmtzUmVVMkcwbHdDazRxckEwbERFYjc0U0daa29FMHVmK2JW?=
 =?utf-8?B?SkR0ZlZLTFUvUWNlMk9XTkVWWkRBQ1R4T003aE1zY3BFMVJuWXlRQ1U2a2FK?=
 =?utf-8?B?MlpPcjVXbGtjc1psVjBrZUgwTmFxUk90Y3l3bFNFd3NzQ0F2b09uOGhEVy9F?=
 =?utf-8?B?Q2RwNEpBOURvRjFwdzJVM1BXemdVZlIyaW9OaXljUE1ITnpvQ2ZKQTlHMFR6?=
 =?utf-8?B?YW1tTzBBM0IzRDlUS0hVT3YyN3VmZU84SzBIVGJTNXNRSkg1UFAyWmhBR3l3?=
 =?utf-8?B?SnJ4Ly9ZQ0l3WmRHSmM4ei9kc2FDKzd1MjFZbXgxS3l6Y1lYNG5BaHlaZU9K?=
 =?utf-8?B?b2hMSWl3aVF3OEpKT1R5L1BCYTBqeFZIRlkrSnE5WjJveU4vWFYxVUthSnhh?=
 =?utf-8?B?SjgvZUJvOW1JZXY3SVVxY3FFK0VpL1l0V3RSRlo2Uk94NVBKZjM0T2dHUCs3?=
 =?utf-8?B?NVFUMTVEK1l5d290ejBFMmMzcHgzdWdSeWtJdS8xditRWWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(8096899003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmNSQzUzbUtIaUxwamYzV2VtVlZ5eStMMVJaZE5RUUdMSEtEeUxib25iOXRX?=
 =?utf-8?B?VkZDZGhSMjFEZGxrYy9hOEVrNkg1Ny9ETnlMZ2F5bE1LemFCdFZCTitrOHFy?=
 =?utf-8?B?SnNOaTdUMFZUTjlRQTAyQlRYa0hacFNqTDc4amVPcjkvMjJGUmRPaWNmcnBx?=
 =?utf-8?B?MkZYUkhLUHBFdy9XcE5nVGI3bEhGa2t3R1FFSDNsZTh5ai95dnRRdjNFR0xy?=
 =?utf-8?B?SGhMcnpaRG1pb1pvaWJzTlhUem1sTjRiZGNIYTlwMHpFYm1wbFNPVTlIaTZD?=
 =?utf-8?B?TUNwcEJvdHZmU1VYSHlmMWZ4eENuWnRCMzR1Ukg2eHAyMCtIdGVCcWFjTG9I?=
 =?utf-8?B?b0p5Y00vK0dCN0xBMjNCcnNTMGZQZkV1QzJneDJVb2ZXalRjdnRXd2lZc0JI?=
 =?utf-8?B?Q20vSVJnNDh0a3VIS3ByTU1PelhQRGxRZE1EZDZycUQ0TGlaMmNIYTl1U0pt?=
 =?utf-8?B?K1lOYVNWR3duUE82eDUzK0hEc2JxMXdQbmUvMmpZVGg1V0IzSFBCeFdJWjdQ?=
 =?utf-8?B?MTVxSFY3a0p5d3phdFpnZlFWVGMzdXIwRkFQWFRBTGIvQWlGdmtzMmlEakF2?=
 =?utf-8?B?Mlp5Sm9VOHJDVlpyK3FLazBtbHdpd2JNVVdvODdZaCtScmhoMG1RVCtDRUlm?=
 =?utf-8?B?SjFxNlZOVFZzckZ5MnhkTURzWDF2R0dnVWhFM0JpMmp2UUEzNzdJby9IR29L?=
 =?utf-8?B?MG1USTFXM3V3SmJCeTAvd0R5RThIOXVkUGtDMSt5OXVvNnQ2YTZlZUcvQkwz?=
 =?utf-8?B?Mm5aTDlkWXVKa1BXTmpRdnc2NTM1c05PREt4S2pQWXlDZ2pTV2FMU0g2NHd0?=
 =?utf-8?B?YXJNb0VPTmxlYld2MCszU205Y01hMDRNdGw5Mnk3SVM4c0lkZEhyNnZFa0tr?=
 =?utf-8?B?ZUxPeDdxUTVhN2RCczNBNkVaU01icWhhYW5keXF5b3h5MTFEZnhFb2lVSjhC?=
 =?utf-8?B?MUliUUdMblliNTNLYTBvaUIxaUlqTG1rR00rRU1jeGxYdHR2OXdLUUx1ZmVB?=
 =?utf-8?B?RWQ5Y1hXYkJkanZaR2FQdHpHVEdadzFPc0M5ZUMzTDBDR1NHZGVnSllKY1du?=
 =?utf-8?B?bi80aTdDbEpBckROdGxEV1NNRjFhTDdRcXJ2clJNS1FTekNJZCs4Q1p2SktN?=
 =?utf-8?B?ZVEzOW1OdTVVblRSQ25iL0VWL0wyS2RhSC9jN0w3aVlIVis2TkFlRldOYVQ4?=
 =?utf-8?B?eGthcjhhbXhUbmZxL082R3lZZWNGN2xVS25XZ0QvTlJoN3ovMngwaFd4TTZI?=
 =?utf-8?B?cmVxSDNlT0pCWVl3eHFaaFNCT3cxVEswbzIxOGxQSysrdEx1cGc2MnJIYk5x?=
 =?utf-8?B?RFJKd21tc3c2cmc1bTlYUGFaZjFsWFIyQityWDZzSVhGSGh6NG5EM0ppRXRU?=
 =?utf-8?B?SkJkUmc4bFhESE9PK2REY3VSSHN1ZXVTSk1qd2RWYjhkQit4allFMU5yL0cx?=
 =?utf-8?B?dE1SOS9QdnVDODRXREV5QVU0NFF4OFRyVm1KZFN3b3h6dEVoQmpYckQyTTZ4?=
 =?utf-8?B?VE5zUUd1UUZiUGlxOExjNGs1cTdjNUM2cTdKWjlXN1ViVW9MeTBSS3hWeERk?=
 =?utf-8?B?c0ZabFJHdS9QaEsrZG9CaEdNeUJCVDN3VDZKR01IeFBHMkRXK1FaRzJJM3J2?=
 =?utf-8?B?R2JaT2Z0Y2lGaUVHYUM1UlBtSmloVjJob1h4WnB1YXlYRW96elVZSmhtb2ht?=
 =?utf-8?B?ZTlnUUkrM1ZGdlpjdU9Hd2s3c2xqLzFlWStqRHVkdkhIZnpTck42dC9hZklR?=
 =?utf-8?B?REdhZzI3Y2ErMlZXNGE0N0tTRjVMTjNFaDJXYkMyUmhXRG9rMkNOVmt6elhx?=
 =?utf-8?B?RGszSitveDhFaFEvblBuZ21kWjNJYURtZ2tmTEgwb2ZEWEdSN0tTZFNCcGpH?=
 =?utf-8?B?VDdUY2pLVjRxa1hscDdCM2N2M2RNSnB1NWRnRHVtNVhtV3RGYVE1cGxVYW82?=
 =?utf-8?B?aHA5Z0JEVzJOUU4wL0JtOVYzUzZYVWlCMTZHNHpmaWFyMGpsT2huOW02SkxE?=
 =?utf-8?B?d2R5VDBaR0JNZ2hHSlI0cHY1TWZUSWpoUjNPWFRqWGRuU1BSTVkrNkdIbzNR?=
 =?utf-8?B?UnVVUEFWWmNqS1BTTlBuM1ZwTmdLajNuUit3Zm9tY2t6WkxoZ2Ivand1UnJt?=
 =?utf-8?Q?yLK8QoGMtoygKFdbQXRLvxaEa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a56082-7a59-4601-cb5d-08de219b982f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 03:28:49.8184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E99YUsoCzr4IBumSg8HpM5mxNLXdTgg0IgxxcHdBgdqpn21pC3jqwXLPFMNdXcylL+JifWS5lhPLjQLoIGjWkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6990
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

--------------M46UgTBlhdWDzfeT06ANmlNX
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

The failures here are unrelated, including the skip seen 
on invalid-modeset-force-big-joiner subtest as that is a config issue 
seen on shard-bmg-6.

The kms_joiner tests are running as expected otherwise. Will merge this 
change.

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shards-all.html?testfilter=kms_joiner 


Thanks and Regards,
Karthik.B.S


On 11/11/2025 6:33 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/kms_joiner: Cleanup igt_require checks
> *URL:* 	https://patchwork.freedesktop.org/series/157360/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/index.html
>
>
>   CI Bug Log - changes from XEIGT_8619_FULL -> XEIGTPW_14036_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_14036_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_14036_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 3)
>
> Missing (1): shard-adlp
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_14036_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@xe_exec_reset@long-spin-reuse-many-preempt-threads:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-dg2-433/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html>
>  *
>
>     igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html>
>
>
>         Warnings
>
>   * igt@kms_joiner@basic-max-non-joiner:
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-6/igt@kms_joiner@basic-max-non-joiner.html>
>         (Intel XE#4298
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@kms_joiner@basic-max-non-joiner.html>
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_14036_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html>
>         (Intel XE#5993
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993>) +3
>         other tests fail
>  *
>
>     igt@kms_async_flips@test-cursor-atomic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@kms_async_flips@test-cursor-atomic.html>
>         (Intel XE#664
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/664>)
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-8/igt@kms_big_fb@linear-16bpp-rotate-270.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-16bpp-rotate-0:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html>
>         (Intel XE#1512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html>
>         (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html>
>         (Intel XE#2669
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#3862
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862>) +1
>         other test incomplete
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +27
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#2705
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4212
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212> /
>         Intel XE#4345
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345> /
>         Intel XE#4522
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html>
>         (Intel XE#6168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#2705
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4212
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212> /
>         Intel XE#4522
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522>)
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#2724
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#4418
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-2/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#4418
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418>)
>  *
>
>     igt@kms_chamelium_color@ctm-0-50:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-1/igt@kms_chamelium_color@ctm-0-50.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_edid@hdmi-edid-read:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@kms_chamelium_edid@hdmi-edid-read.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_edid@vga-edid-read:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-435/igt@kms_chamelium_edid@vga-edid-read.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-fast:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-8/igt@kms_chamelium_frames@hdmi-crc-fast.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-5/igt@kms_content_protection@uevent.html>
>         (Intel XE#3278
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-32x10:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-max-size:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +9
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +3
>         other tests skip
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>) +1
>         other test skip
>  *
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html>
>         (Intel XE#4422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422>)
>  *
>
>     igt@kms_feature_discovery@dp-mst:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html>
>         (Intel XE#1137
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137>)
>  *
>
>     igt@kms_flip@2x-modeset-vs-vblank-race:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-1/igt@kms_flip@2x-modeset-vs-vblank-race.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +2
>         other tests skip
>  *
>
>     igt@kms_flip@2x-nonexisting-fb:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +5
>         other tests skip
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +2
>         other tests fail
>  *
>
>     igt@kms_flip@flip-vs-suspend:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) +1
>         other test incomplete
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +9
>         other tests skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>) +3
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html>
>         (Intel XE#6313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6313>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +14
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +18
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +8
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +15
>         other tests skip
>  *
>
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         (Intel XE#3012
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012>)
>  *
>
>     igt@kms_plane_lowres@tiling-yf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html>
>         (Intel XE#2393
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-3/igt@kms_plane_lowres@tiling-yf.html>
>         (Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html>
>         (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>)
>         +11 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +4
>         other tests skip
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#1129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>)
>  *
>
>     igt@kms_pm_rpm@dpms-non-lpsp:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@kms_pm_rpm@dpms-non-lpsp.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#3141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +4
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>) +1
>         other test skip
>  *
>
>     igt@kms_psr@fbc-pr-dpms:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-435/igt@kms_psr@fbc-pr-dpms.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +9
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-plane-move:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +5
>         other tests skip
>  *
>
>     igt@kms_psr@pr-cursor-plane-move:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-2/igt@kms_psr@pr-cursor-plane-move.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +2
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>  *
>
>     igt@kms_setmode@clone-exclusive-crtc:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>  *
>
>     igt@kms_setmode@invalid-clone-single-crtc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-2/igt@kms_setmode@invalid-clone-single-crtc.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>  *
>
>     igt@kms_sharpness_filter@filter-scaler-downscale:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@kms_sharpness_filter@filter-scaler-downscale.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>)
>  *
>
>     igt@kms_vrr@cmrr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-435/igt@kms_vrr@cmrr.html>
>         (Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
>         (Intel XE#2142
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142>) +1
>         other test fail
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         (Intel XE#5937
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937>)
>  *
>
>     igt@xe_compute_preempt@compute-preempt-many-vram:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many-vram.html>
>         (Intel XE#6360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360>)
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0x8fffe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x8fffe.html>
>         (Intel XE#5300
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0x3fff:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>  *
>
>     igt@xe_eudebug@basic-read-event:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-2/igt@xe_eudebug@basic-read-event.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +1
>         other test skip
>  *
>
>     igt@xe_eudebug@vm-bind-clear-faultable:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-434/igt@xe_eudebug@vm-bind-clear-faultable.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +4
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@interrupt-all-set-breakpoint:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +2
>         other tests skip
>  *
>
>     igt@xe_eudebug_sriov@deny-eudebug:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@xe_eudebug_sriov@deny-eudebug.html>
>         (Intel XE#4518
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@xe_eudebug_sriov@deny-eudebug.html>
>         (Intel XE#4518
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@xe_eudebug_sriov@deny-eudebug.html>
>         (Intel XE#5793
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793>)
>  *
>
>     igt@xe_evict@evict-large-external-cm:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@xe_evict@evict-large-external-cm.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +4
>         other tests skip
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html>
>         (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>) +1
>         other test incomplete
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +3
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-once-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +19
>         other tests skip
>  *
>
>     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html>
>         (Intel XE#2360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>  *
>
>     igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-5/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html>
>         (Intel XE#5007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007>)
>  *
>
>     igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-464/igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>)
>         +201 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@process-many-mmap-new-huge:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@xe_exec_system_allocator@process-many-mmap-new-huge.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +8
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-free-huge.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +8
>         other tests skip
>  *
>
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html>
>         (Intel XE#5893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893>)
>  *
>
>     igt@xe_oa@polling-small-buf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@xe_oa@polling-small-buf.html>
>         (Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +8
>         other tests skip
>  *
>
>     igt@xe_pat@pat-index-xelp:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-5/igt@xe_pat@pat-index-xelp.html>
>         (Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>  *
>
>     igt@xe_pm@s3-d3cold-basic-exec:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1
>         other test skip
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>  *
>
>     igt@xe_pm_residency@cpg-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-4/igt@xe_pm_residency@cpg-basic.html>
>         (Intel XE#584
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>)
>  *
>
>     igt@xe_pm_residency@idle-residency:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-432/igt@xe_pm_residency@idle-residency.html>
>         (Intel XE#6362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6362>) +1
>         other test fail
>  *
>
>     igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0.html>
>         (Intel XE#6251
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251>)
>  *
>
>     igt@xe_query@multigpu-query-mem-usage:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_query@multigpu-query-topology:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-463/igt@xe_query@multigpu-query-topology.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +3
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-3/igt@xe_query@multigpu-query-topology.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_sriov_auto_provisioning@selfconfig-basic:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@xe_sriov_auto_provisioning@selfconfig-basic.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>) +1
>         other test skip
>  *
>
>     igt@xe_survivability@i2c-functionality:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-466/igt@xe_survivability@i2c-functionality.html>
>         (Intel XE#6529
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6529>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html>
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html>
>         +1 other test pass
>  *
>
>     igt@kms_dp_aux_dev:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-6/igt@kms_dp_aux_dev.html>
>         (Intel XE#3009
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-2/igt@kms_dp_aux_dev.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html>
>         +5 other tests pass
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane@pixel-format@pipe-a-plane-0:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-dg2-434/igt@kms_plane@pixel-format@pipe-a-plane-0.html>
>         (Intel XE#1035
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-435/igt@kms_plane@pixel-format@pipe-a-plane-0.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         (Intel XE#2571
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>  *
>
>     igt@kms_pm_dc@dc5-dpms:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html>
>         (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html>
>  *
>
>     igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html>
>         (Intel XE#6353
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6353>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html>
>  *
>
>     igt@xe_module_load@load:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-8/igt@xe_module_load@load.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-1/igt@xe_module_load@load.html>)
>         (Intel XE#2457
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457>) ->
>         (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-2/igt@xe_module_load@load.html>)
>  *
>
>     igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html>
>         (Intel XE#6251
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html>
>         +1 other test pass
>  *
>
>     igt@xe_sriov_flr@flr-each-isolation:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-8/igt@xe_sriov_flr@flr-each-isolation.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html>
>  *
>
>     igt@xe_sriov_vram@vf-access-provisioned:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-4/igt@xe_sriov_vram@vf-access-provisioned.html>
>         (Intel XE#5937
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-2/igt@xe_sriov_vram@vf-access-provisioned.html>
>         +1 other test pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4345
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4345
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345> /
>         Intel XE#6168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168>)
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-1/igt@kms_content_protection@legacy.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@kms_content_protection@legacy.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>)
>         +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +12 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +9
>         other tests skip
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>  *
>
>     igt@kms_joiner@basic-big-joiner:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html>
>         (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html>
>         (Intel XE#2925
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925> /
>         Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>) +1
>         other test skip
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-lnl-3/igt@kms_joiner@basic-big-joiner.html>
>         (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-4/igt@kms_joiner@basic-big-joiner.html>
>         (Intel XE#2925
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925> /
>         Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>) +1
>         other test skip
>  *
>
>     igt@kms_joiner@basic-max-non-joiner:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html>
>         (Intel XE#4298
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-435/igt@kms_joiner@basic-max-non-joiner.html>
>         (Intel XE#2925
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-lnl-1/igt@kms_joiner@basic-max-non-joiner.html>
>         (Intel XE#4298
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-4/igt@kms_joiner@basic-max-non-joiner.html>
>         (Intel XE#2925
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>  *
>
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         (Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         (Intel XE#2925
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925> /
>         Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>) +1
>         other test skip
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-lnl-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         (Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         (Intel XE#2925
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925> /
>         Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>) +1
>         other test skip
>  *
>
>     igt@kms_plane_multiple@2x-tiling-y:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html>
>         (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html>
>         (Intel XE#5021
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1500
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>  *
>
>     igt@xe_exec_system_allocator@many-execqueues-malloc-prefetch-madvise:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-dg2-435/igt@xe_exec_system_allocator@many-execqueues-malloc-prefetch-madvise.html>
>         (Intel XE#2594
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-435/igt@xe_exec_system_allocator@many-execqueues-malloc-prefetch-madvise.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>)
>
>
>     Build changes
>
>   * IGT: IGT_8619 -> IGTPW_14036
>
> IGTPW_14036: 95b0ce9ddb7115807cfde329e4d78a659423fdca @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8619: 8619
> xe-4085-4ce351022716985e9c1dd18583acd4d3d149cb5b: 
> 4ce351022716985e9c1dd18583acd4d3d149cb5b
>
--------------M46UgTBlhdWDzfeT06ANmlNX
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>The failures here are unrelated, including the skip seen on&nbsp;inv=
alid-modeset-force-big-joiner
      subtest as that is a config issue seen on shard-bmg-6.</p>
    <p>The kms_joiner tests are running as expected otherwise. Will
      merge this change.</p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14036/shards-all.html?testfilter=3Dkms_joiner">https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shards-all.html?testfilter=
=3Dkms_joiner</a>&nbsp;</p>
    Thanks and Regards,<br>
    Karthik.B.S
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 11/11/2025 6:33 PM, Patchwork wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:176286623899.41671.17125294086201=
523519@10055242dc62">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/kms_joiner: Cleanup igt_require checks</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/157360/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/157360/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14036/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8619_FULL -&gt;
        XEIGTPW_14036_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_14036_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_14036_FULL, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 3)</h2>
      <p>Missing (1): shard-adlp </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_14036_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@xe_exec_reset@long-spin-reuse-many-preempt-threads:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8619/shard-dg2-433/igt@xe_exec_reset@long-spin-reuse-many-pre=
empt-threads.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@xe_exec_=
reset@long-spin-reuse-many-preempt-threads.html" moz-do-not-send=3D"true">I=
NCOMPLETE</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_cl=
ass_video_decode0:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50@engine-drm=
_xe_engine_class_video_decode0.html" moz-do-not-send=3D"true">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-ln=
l-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video=
_decode0.html" moz-do-not-send=3D"true">FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>igt@kms_joiner@basic-max-non-joiner:
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-6/igt@kms_joiner@basic-max-non-joiner.html" moz-do-=
not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4298" moz-do-not-send=3D"true">Intel XE#4298</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/i=
gt@kms_joiner@basic-max-non-joiner.html" moz-do-not-send=3D"true">SKIP</a><=
/li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_14036_FULL that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pi=
pe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-eve=
nts-linear@pipe-c-edp-1.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-5/igt=
@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html"=
 moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5993" moz-do-not-send=3D"true">Intel XE#5993</a>) +=
3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@test-cursor-atomic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@kms_async_flips@test-cursor-a=
tomic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/664" moz-do-not-send=3D"true">Intel XE#6=
64</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-466/igt@kms_big_fb@linear-16bp=
p-rotate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send=3D"true">Int=
el XE#316</a>) +2 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-8/igt@kms_big_fb@linear-16bpp-rotat=
e-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-send=3D"true">Intel XE#=
1407</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rota=
te-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send=3D"true">Intel XE#=
2327</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-4/igt@kms_big_fb@y-tiled-16bpp-rota=
te-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Intel XE#1=
124</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"=
true">Intel XE#1124</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:<=
/p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-434/igt@kms_big_fb@yf-tiled-ma=
x-hw-stride-32bpp-rotate-180-hflip.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-d=
o-not-send=3D"true">Intel XE#1124</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-2/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true">In=
tel XE#367</a>) +1 other test
              skip</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@kms_bw@linear-tiling-1=
-displays-2560x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"t=
rue">Intel XE#367</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-5/igt@kms_bw@linear-tiling-3-displa=
ys-3840x2160p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true">In=
tel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-1/igt@kms_bw@linear-tiling-4-displa=
ys-3840x2160p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1512" moz-do-not-send=3D"true">I=
ntel XE#1512</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@kms_ccs@bad-rotation-9=
0-4-tiled-bmg-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2907" moz-do-not-send=3D"tru=
e">Intel XE#2907</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-til=
ed-mtl-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"true">I=
ntel XE#2887</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-t=
iled-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"true">Intel =
XE#2887</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4=
:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-463/igt@kms_ccs@crc-primary-ba=
sic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-=
do-not-send=3D"true">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>)=
 +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-ed=
p-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-bmg-ccs@pipe-b-edp-1.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669" moz-do-=
not-send=3D"true">Intel XE#2669</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8619/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg=
2-mc-ccs.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-463/igt@kms_ccs@crc-=
primary-suspend-4-tiled-dg2-mc-ccs.html" moz-do-not-send=3D"true">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862"=
 moz-do-not-send=3D"true">Intel XE#3862</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send=3D"t=
rue">Intel XE#3432</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send=3D"t=
rue">Intel XE#3432</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp=
-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-432/igt@kms_ccs@crc-primary-su=
spend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" mo=
z-do-not-send=3D"true">Intel XE#787</a>) +27 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8619/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-436/igt@kms_ccs@random-c=
cs-data-4-tiled-dg2-rc-ccs.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-=
not-send=3D"true">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2705" moz-do-not-send=3D"true">Intel XE#2705</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-=
do-not-send=3D"true">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4212" moz-do-not-send=3D"true">Intel XE#4212</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345" m=
oz-do-not-send=3D"true">Intel XE#4345</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4522" moz-do-not-send=3D"true">Intel XE#452=
2</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:=
</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8619/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs-cc@pipe-b-dp-4.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-464/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html" moz-do-not=
-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6168" moz-do-not-send=3D"true">Intel XE#6168</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-=
a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8619/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs-cc@pipe-b-hdmi-a-6.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-464/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html" moz-=
do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1727" moz-do-not-send=3D"true">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-d=
o-not-send=3D"true">Intel XE#3113</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p=
>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8619/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs@pipe-c-dp-4.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-436/igt@kms_=
ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html" moz-do-not-send=3D=
"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1727" moz-do-not-send=3D"true">Intel XE#1727</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705" moz-do-not-send=3D"=
true">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3113" moz-do-not-send=3D"true">Intel XE#3113</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212" moz-do-not-send=
=3D"true">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4522" moz-do-not-send=3D"true">Intel XE#4522</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-5/igt@kms_cdclk@mode-transition-all=
-outputs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2724" moz-do-not-send=3D"true">Intel =
XE#2724</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-434/igt@kms_cdclk@mode-transit=
ion-all-outputs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4418" moz-do-not-send=3D"true"=
>Intel XE#4418</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-2/igt@kms_cdclk@mode-transition-all=
-outputs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4418" moz-do-not-send=3D"true">Intel =
XE#4418</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-50:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-1/igt@kms_chamelium_color@ctm-0-50.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/306" moz-do-not-send=3D"true">Intel XE#306</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@kms_chamelium_edid@hdmi-edid-=
read.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Intel XE#37=
3</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@vga-edid-read:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-435/igt@kms_chamelium_edid@vga=
-edid-read.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Intel=
 XE#373</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-8/igt@kms_chamelium_frames@hdmi-crc=
-fast.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send=3D"true">Intel XE#=
2252</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-5/igt@kms_content_protection@uevent=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3278" moz-do-not-send=3D"true">Intel XE#3278<=
/a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-5/igt@kms_cursor_crc@cursor-offscre=
en-32x10.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send=3D"true">Intel =
XE#2320</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@kms_cursor_crc@cursor-=
sliding-max-size.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true"=
>Intel XE#455</a>) +9 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding=
-max-size.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send=3D"true">Intel=
 XE#1424</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-=
flipa-atomic-transitions.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-sen=
d=3D"true">Intel XE#309</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-vary=
ing-size:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tra=
nsitions-varying-size.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@k=
ms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2291" moz-do-not-send=3D"true">Intel XE#2291</a>) +3 ot=
her tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-fractional-bpp:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2244" moz-do-not-send=3D"true">Intel XE#2244</a>=
) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-1/igt@kms_dsc@dsc-with-output-forma=
ts.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2244" moz-do-not-send=3D"true">Intel XE#224=
4</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:<=
/p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-4/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422" moz-do-not-s=
end=3D"true">Intel XE#4422</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@dp-mst:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@kms_feature_discovery@=
dp-mst.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1137" moz-do-not-send=3D"true">Intel XE=
#1137</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-1/igt@kms_flip@2x-modeset-vs-vblank=
-race.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send=3D"true">Intel XE#=
1421</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-nonexisting-fb:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html" moz-do-not-s=
end=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14036/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2316" moz-do-not-send=3D"true">Intel XE#2316</a>) +5 other t=
ests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible=
@b-edp1.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@kms_flip@flip-v=
s-expired-vblank-interruptible@b-edp1.html" moz-do-not-send=3D"true">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz=
-do-not-send=3D"true">Intel XE#301</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html" moz-do-not-sen=
d=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14036/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html" moz-do-not-s=
end=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2049" moz-do-not-send=3D"true">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597" moz-do-not-se=
nd=3D"true">Intel XE#2597</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-=
blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-1p-offscreen-pri-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-=
not-send=3D"true">Intel XE#2311</a>) +9 other tests
              skip</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-436/igt@kms_frontbuffer_tracki=
ng@drrs-1p-offscreen-pri-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312" =
moz-do-not-send=3D"true">Intel XE#6312</a>) +3 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
-1p-offscreen-pri-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312" moz-do-=
not-send=3D"true">Intel XE#6312</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-r=
ender:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-pri-shrfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do=
-not-send=3D"true">Intel XE#651</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-b=
lt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
1p-offscreen-pri-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6313" moz-do-n=
ot-send=3D"true">Intel XE#6313</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do=
-not-send=3D"true">Intel XE#656</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:=
</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-indfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390" moz-do-not-=
send=3D"true">Intel XE#5390</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-dra=
w-render:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-434/igt@kms_frontbuffer_tracki=
ng@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
51" moz-do-not-send=3D"true">Intel XE#651</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-mov=
e:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-move.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-no=
t-send=3D"true">Intel XE#2312</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw=
-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-cur-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do=
-not-send=3D"true">Intel XE#2313</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:=
</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-435/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-shrfb-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-d=
o-not-send=3D"true">Intel XE#653</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.h=
tml" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@kms_joiner@invalid-modes=
et-force-big-joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3012" moz-do-not-send=3D"t=
rue">Intel XE#3012</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-yf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2393" moz-do-not-send=3D"true">Intel XE#2393</a>=
)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-3/igt@kms_plane_lowres@tiling-yf.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/599" moz-do-not-send=3D"true">Intel XE#599</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html" moz-do-n=
ot-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14036/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4596" moz-do-not-send=3D"true">Intel XE#4596</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-fact=
or-0-25:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-2/igt@kms_plane_scaling@planes-down=
scale-factor-0-5-upscale-factor-0-25.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz=
-do-not-send=3D"true">Intel XE#2763</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-=
5@pipe-b:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-4/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" mo=
z-do-not-send=3D"true">Intel XE#2763</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send=3D"tr=
ue">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14036/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send=3D"true">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718=
" moz-do-not-send=3D"true">Intel XE#718</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1129" moz-do-not-send=3D"true">Intel XE#1129</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@kms_pm_rpm@dpms-non-lpsp.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1439" moz-do-not-send=3D"true">Intel XE#1439</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141" moz-d=
o-not-send=3D"true">Intel XE#3141</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-ful=
ly-sf:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-exceed-fully-sf.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-d=
o-not-send=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2893" moz-do-not-send=3D"true">Intel XE#2893</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fu=
lly-sf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-ove=
rlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6" moz-do-not-send=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send=3D"true">Intel XE=
#1489</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-update-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">=
Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1489" moz-do-not-send=3D"true">Intel XE#1489</a>) +2 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-update-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">=
Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2893" moz-do-not-send=3D"true">Intel XE#2893</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4608" moz-do-not-send=3D"tru=
e">Intel XE#4608</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:<=
/p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-update-sf@pipe-b-edp-1.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-s=
end=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4608" moz-do-not-send=3D"true">Intel XE#4608</a>) +1 o=
ther test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-435/igt@kms_psr@fbc-pr-dpms.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz=
-do-not-send=3D"true">Intel XE#2850</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/929" moz-do-not-send=3D"true">Intel XE#929</a=
>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane=
-move.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#=
1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
234" moz-do-not-send=3D"true">Intel XE#2234</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send=3D"true">Intel =
XE#2850</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-cursor-plane-move:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-2/igt@kms_psr@pr-cursor-plane-move.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406</=
a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-464/igt@kms_rotation_crc@prima=
ry-yf-tiled-reflect-x-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-se=
nd=3D"true">Intel XE#3414</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@clone-exclusive-crtc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html" moz-do=
-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14036/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435" moz-do-not-send=3D"true">Intel XE#1435</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-single-crtc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-2/igt@kms_setmode@invalid-clone-sin=
gle-crtc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1435" moz-do-not-send=3D"true">Intel =
XE#1435</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@kms_sharpness_filter@filter-s=
caler-downscale.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6503" moz-do-not-send=3D"true"=
>Intel XE#6503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-435/igt@kms_vrr@cmrr.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2168" moz-do-not-send=3D"true">Intel XE#2168</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp=
-1.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-1/igt@kms_vrr@seamless-rr-=
switch-virtual@pipe-a-edp-1.html" moz-do-not-send=3D"true">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142" moz-do-not-s=
end=3D"true">Intel XE#2142</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvf=
s-all.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-4/igt@sriov_basic@enabl=
e-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send=3D"true">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937" moz-do=
-not-send=3D"true">Intel XE#5937</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt-many-vram:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-435/igt@xe_compute_preempt@com=
pute-preempt-many-vram.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360" moz-do-not-send=
=3D"true">Intel XE#6360</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0x8fffe:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-466/igt@xe_copy_basic@mem-copy=
-linear-0x8fffe.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5300" moz-do-not-send=3D"true"=
>Intel XE#5300</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-434/igt@xe_copy_basic@mem-set-=
linear-0x3fff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1126" moz-do-not-send=3D"true">I=
ntel XE#1126</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-read-event:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-2/igt@xe_eudebug@basic-read-event.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true">Intel XE#4837</a=
>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-434/igt@xe_eudebug@vm-bind-cle=
ar-faultable.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true">In=
tel XE#4837</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@xe_eudebug_online@interrupt-a=
ll-set-breakpoint.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"tru=
e">Intel XE#4837</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_sriov@deny-eudebug:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@xe_eudebug_sriov@deny-=
eudebug.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4518" moz-do-not-send=3D"true">Intel X=
E#4518</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@xe_eudebug_sriov@deny-eudebug=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4518" moz-do-not-send=3D"true">Intel XE#4518<=
/a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@xe_eudebug_sriov@deny-eudebug=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5793" moz-do-not-send=3D"true">Intel XE#5793<=
/a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-large-external-cm:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-7/igt@xe_evict@evict-large-external=
-cm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/688" moz-do-not-send=3D"true">Intel XE#688=
</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html"=
 moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@xe_evict@evict-mixed-many-th=
reads-small.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321" moz-do-not-send=3D"tru=
e">Intel XE#6321</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exe=
c-userptr-invalidate.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send=3D"=
true">Intel XE#1392</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-1/igt@xe_exec_basic@multigpu-once-b=
asic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send=3D"true">Intel XE#2=
322</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-434/igt@xe_exec_fault_mode@onc=
e-invalid-userptr-fault.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send=
=3D"true">Intel XE#288</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-432/igt@xe_exec_mix_modes@exec=
-simple-batch-store-lr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360" moz-do-not-send=
=3D"true">Intel XE#2360</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:=
</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-5/igt@xe_exec_system_allocator@many=
-64k-mmap-free-huge-nomemset.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007" moz-do-not-=
send=3D"true">Intel XE#5007</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-64k-mmap-mlock-nomemset:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-464/igt@xe_exec_system_allocat=
or@many-64k-mmap-mlock-nomemset.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915" moz-do-n=
ot-send=3D"true">Intel XE#4915</a>) +201 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@process-many-mmap-new-huge:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@xe_exec_system_allocator@proc=
ess-many-mmap-new-huge.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-send=
=3D"true">Intel XE#4943</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap=
-free-huge:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-3/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-mmap-free-huge.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" =
moz-do-not-send=3D"true">Intel XE#4943</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</=
p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8619/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_g=
uc_mmio_send_recv.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@xe_=
fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html" moz-do-not-send=
=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5893" moz-do-not-send=3D"true">Intel XE#5893</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@polling-small-buf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@xe_oa@polling-small-bu=
f.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3573" moz-do-not-send=3D"true">Intel XE#3573=
</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelp:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-5/igt@xe_pat@pat-index-xelp.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/977" moz-do-not-send=3D"true">Intel XE#977</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-d3cold-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-=
exec.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel XE#2=
284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
6" moz-do-not-send=3D"true">Intel XE#366</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-4/igt@xe_pm@vram-d3cold-threshold.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/579" moz-do-not-send=3D"true">Intel XE#579</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@cpg-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-4/igt@xe_pm_residency@cpg-basic.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/584" moz-do-not-send=3D"true">Intel XE#584</a>)</=
li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@idle-residency:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-432/igt@xe_pm_residency@idle-r=
esidency.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6362" moz-do-not-send=3D"true">Intel =
XE#6362</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_cl=
ass_render0:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm=
_xe_engine_class_render0.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-2/ig=
t@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0.htm=
l" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6251" moz-do-not-send=3D"true">Intel XE#6251</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-mem-usage:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-bmg-5/igt@xe_query@multigpu-query-mem-u=
sage.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Intel XE#94=
4</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-topology:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-463/igt@xe_query@multigpu-quer=
y-topology.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Intel=
 XE#944</a>) +3 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14036/shard-lnl-3/igt@xe_query@multigpu-query-topol=
ogy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Intel XE#944=
</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-433/igt@xe_sriov_auto_provisio=
ning@selfconfig-basic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4130" moz-do-not-send=3D=
"true">Intel XE#4130</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_survivability@i2c-functionality:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-466/igt@xe_survivability@i2c-f=
unctionality.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6529" moz-do-not-send=3D"true">In=
tel XE#6529</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-256=
0x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send=3D"true">Intel X=
E#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2894" moz-do-not-send=3D"true">Intel XE#2894</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-1/igt@kms_bw@conne=
cted-linear-tiling-2-displays-2560x1440p.html" moz-do-not-send=3D"true">PAS=
S</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2291" moz-do-not-send=3D"true">Intel XE#2291</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/sha=
rd-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html" moz-do-not-sen=
d=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_aux_dev:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-6/igt@kms_dp_aux_dev.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
009" moz-do-not-send=3D"true">Intel XE#3009</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-2/igt@kms_dp_aux_dev=
.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-inter=
ruptible.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-send=3D"true">Intel =
XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14036/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interrupti=
ble.html" moz-do-not-send=3D"true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:<=
/p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-=
dp2-hdmi-a3.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2049" moz-do-not-send=3D"tru=
e">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2597" moz-do-not-send=3D"true">Intel XE#2597</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-5/igt@k=
ms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html" moz-do-not-se=
nd=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format@pipe-a-plane-0:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8619/shard-dg2-434/igt@kms_plane@pixel-format@pipe-a-plane-0.=
html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1035" moz-do-not-send=3D"true">Intel XE#=
1035</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14036/shard-dg2-435/igt@kms_plane@pixel-format@pipe-a-plane-0.html" moz-do-=
not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2571" moz-do-not-send=3D"true">Intel XE#2571</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-=
bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html" moz-do-not-send=3D"t=
rue">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-dpms:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html" moz-do-not-send=3D"t=
rue">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/718" moz-do-not-send=3D"true">Intel XE#718</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-5/igt@kms_pm_dc@dc=
5-dpms.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-sing=
le-vma:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pa=
t-idx-uc-single-vma.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6353" moz-do-not-send=3D"t=
rue">Intel XE#6353</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14036/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madv=
ise-pat-idx-uc-single-vma.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@load:</p>
          <ul>
            <li>shard-bmg: (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8619/shard-bmg-4/igt@xe_module_load@load.html" moz-do-not-send=3D=
"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
619/shard-bmg-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-b=
mg-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-5/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-6/igt@xe_module_loa=
d@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-6/igt@xe_module_load@load.html=
" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGT_8619/shard-bmg-2/igt@xe_module_load@load.html" moz-do-no=
t-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8619/shard-bmg-1/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_861=
9/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg=
-6/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-4/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-4/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-2/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8619/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8619/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"tru=
e">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/=
shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-2=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-5/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-5/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-2/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8619/shard-bmg-8/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8619/shard-bmg-8/igt@xe_module_load@load.html" moz-do-not-send=3D"tru=
e">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/=
shard-bmg-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-1=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-1/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8619/shard-bmg-1/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2457" moz-do-not-send=3D"true">Intel XE#=
2457</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14036/shard-bmg-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/s=
hard-bmg-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg=
-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-1/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-5/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt@xe_module_load@load.html"=
 moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@xe_module_load@load.html" moz-do-=
not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14036/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14036/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-send=3D"true=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1403=
6/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-=
bmg-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-8/ig=
t@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-2/igt@xe_mod=
ule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-5/igt@xe_module_load=
@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@xe_module_load@load.ht=
ml" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14036/shard-bmg-2/igt@xe_module_load@load.html" moz-=
do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14036/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-s=
end=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14036/shard-bmg-4/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4036/shard-bmg-4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/sha=
rd-bmg-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-4=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-4/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-5/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-2/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_cl=
ass_compute0:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm=
_xe_engine_class_compute0.html" moz-do-not-send=3D"true">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251" moz-do-not-se=
nd=3D"true">Intel XE#6251</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14036/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-=
90@engine-drm_xe_engine_class_compute0.html" moz-do-not-send=3D"true">PASS<=
/a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-each-isolation:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-8/igt@xe_sriov_flr@flr-each-isolation.html" moz-do-=
not-send=3D"true">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14036/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html=
" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_vram@vf-access-provisioned:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-4/igt@xe_sriov_vram@vf-access-provisioned.html" moz=
-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5937" moz-do-not-send=3D"true">Intel XE#5937</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg=
-2/igt@xe_sriov_vram@vf-access-provisioned.html" moz-do-not-send=3D"true">P=
ASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8619/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs-cc.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send=3D"true">I=
ntel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3113" moz-do-not-send=3D"true">Intel XE#3113</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4345" moz-do-not-send=3D"true=
">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14036/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-c=
cs-cc.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send=3D"true">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113" moz-do-not-send=3D"true">Intel XE#3113</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4345" moz-do-not-send=3D"true">=
Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6168" moz-do-not-send=3D"true">Intel XE#6168</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-1/igt@kms_content_protection@legacy.html" moz-do-no=
t-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178" moz-do-not-send=3D"true">Intel XE#1178</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-6/igt=
@kms_content_protection@legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341" moz-do-no=
t-send=3D"true">Intel XE#2341</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt=
:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-ind=
fb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=3D"true">I=
ntel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14036/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-ind=
fb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">I=
ntel XE#2312</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:=
</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrf=
b-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">In=
tel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14036/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb=
-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5390" moz-do-not-send=3D"true">Int=
el XE#5390</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-re=
nder:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-=
indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5390" moz-do-not-send=3D"tru=
e">Intel XE#5390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14036/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
spr-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D=
"true">Intel XE#2312</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-dra=
w-blt:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-=
cur-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"tr=
ue">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14036/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-prim=
scrn-cur-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=
=3D"true">Intel XE#2311</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p=
>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-=
multidraw.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">Intel=
 XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14036/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-mult=
idraw.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"true">Intel XE#=
2313</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-b=
lt:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-i=
ndfb-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"true"=
>Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14036/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn=
-indfb-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"tru=
e">Intel XE#2312</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3544" moz-do-not-send=3D"true">Intel XE#3544</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-7/igt@k=
ms_hdr@brightness-with-hdr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374" moz-do-not-se=
nd=3D"true">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3544" moz-do-not-send=3D"true">Intel XE#3544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-big-joiner:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8619/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/346" moz-do-not-send=3D"true">Intel XE#346</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-dg2-46=
6/igt@kms_joiner@basic-big-joiner.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925" moz-do=
-not-send=3D"true">Intel XE#2925</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/346" moz-do-not-send=3D"true">Intel XE#346</a>) =
+1 other test
              skip</li>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-lnl-3/igt@kms_joiner@basic-big-joiner.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/346" moz-do-not-send=3D"true">Intel XE#346</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-4/igt@k=
ms_joiner@basic-big-joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925" moz-do-not-se=
nd=3D"true">Intel XE#2925</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/346" moz-do-not-send=3D"true">Intel XE#346</a>) +1 othe=
r test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-max-non-joiner:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8619/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4298" moz-do-not-send=3D"true">Intel XE#4298</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-=
dg2-435/igt@kms_joiner@basic-max-non-joiner.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
25" moz-do-not-send=3D"true">Intel XE#2925</a>)</li>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-lnl-1/igt@kms_joiner@basic-max-non-joiner.html" moz-do-=
not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4298" moz-do-not-send=3D"true">Intel XE#4298</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-lnl-4/i=
gt@kms_joiner@basic-max-non-joiner.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925" moz-d=
o-not-send=3D"true">Intel XE#2925</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8619/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joine=
r.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2927" moz-do-not-send=3D"true">Intel XE#2927=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1403=
6/shard-dg2-433/igt@kms_joiner@invalid-modeset-ultra-joiner.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2925" moz-do-not-send=3D"true">Intel XE#2925</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927" moz-do-not-send=
=3D"true">Intel XE#2927</a>) +1 other test
              skip</li>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-lnl-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2927" moz-do-not-send=3D"true">Intel XE#2927</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard=
-lnl-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2925" moz-do-not-send=3D"true">Intel XE#2925</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2927" moz-do-not-send=3D"true">=
Intel XE#2927</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-y:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4596" moz-do-not-send=3D"true">Intel XE#4596</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bmg-7/ig=
t@kms_plane_multiple@2x-tiling-y.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021" moz-do-=
not-send=3D"true">Intel XE#5021</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8619/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2426" moz-do-not-send=3D"true">Intel XE#2426</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/shard-bm=
g-1/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send=3D"true"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
729" moz-do-not-send=3D"true">Intel XE#1729</a>)</li>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8619/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/362" moz-do-not-send=3D"true">Intel XE#362</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14036/sha=
rd-dg2-432/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send=
=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1729" moz-do-not-send=3D"true">Intel XE#1729</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8619/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-w=
ith-chamelium.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1500" moz-do-not-send=3D"true">I=
ntel XE#1500</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14036/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-c=
hamelium.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/362" moz-do-not-send=3D"true">Intel X=
E#362</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-execqueues-malloc-prefetch-m=
advise:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8619/shard-dg2-435/igt@xe_exec_system_allocator@many-execqueu=
es-malloc-prefetch-madvise.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594" moz-do-=
not-send=3D"true">Intel XE#2594</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_14036/shard-dg2-435/igt@xe_exec_system_allocator=
@many-execqueues-malloc-prefetch-madvise.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915"=
 moz-do-not-send=3D"true">Intel XE#4915</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8619 -&gt; IGTPW_14036</li>
      </ul>
      <p>IGTPW_14036: 95b0ce9ddb7115807cfde329e4d78a659423fdca @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        IGT_8619: 8619<br>
        xe-4085-4ce351022716985e9c1dd18583acd4d3d149cb5b:
        4ce351022716985e9c1dd18583acd4d3d149cb5b</p>
    </blockquote>
  </body>
</html>

--------------M46UgTBlhdWDzfeT06ANmlNX--
