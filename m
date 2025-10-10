Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FE9CCD185
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 22:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2127610E28D;
	Fri, 10 Oct 2025 22:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M4u6y/SW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B400710E28D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 22:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760135093; x=1791671093;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I5ncpONDrD5W+/YAh6l98zqU6N7RfXOrCMgfFdmNo6o=;
 b=M4u6y/SWDzLVEBgxj7AeqeTnzKWcFzlcvxc6dhzVjIvl0Fmtibwv15jE
 UsBA/5O10q/fmvdnskXH63PbcmI2hefKgUTKqcsrW78zjZOu22N2zBT0O
 MGxUfEs8LHtJgu3QIGpiXmSc2vR9A+7zIVvjmwhGQg5w9Mh+PIuOsUZ75
 SOEMmPhQ+gDnTRngDWAwe/rsYH24HD8dPDvGYnyJ9+mU4bDjvmYuMILDV
 Vm27IbK+tkO/CIOPmHWEYV0MwtFE6v6pUrodF7D/IJQb3QC6k8LDUxekv
 AcnTuRVLYmSjBvpH7ArZ4O7CHB8KBguI2JwE+lsq0Sdirh1lWKdEZ1me3 g==;
X-CSE-ConnectionGUID: Wrl/4t6BQSO7/Cu0vU22XQ==
X-CSE-MsgGUID: PRgwdHgqTJy+N9IoEmt6qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62061374"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="62061374"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:24:50 -0700
X-CSE-ConnectionGUID: xH+8E65HTXy8f4zsUT5DvA==
X-CSE-MsgGUID: gBnZhETSTKmo1eQaEnbwuA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:24:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:24:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 15:24:48 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:24:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/0EVvA8U75dswW72qcIMBiNuGFoEua2Rq4QoEG7lcwHu5+CF/JR/Mljkqy2L1vXEIr+xZq1KcJUKhplp0YrIGJg85U/bUbcKP05DCz+5+Bop9ZWv+BnOAoOxh2kg9uKeDXm9OAHtBTLSz7k2QakDFBagtBkXO6HTj3O4o6cmgdkU98Oie01za0GTa68j9fOFw1TCMdK0ZtZDBJKCmN8sjod6Ylw5il2YzCuy5cJasmuhT5rJTwsxa7Gqsm//tlOeo5c738sMo77FhNI5o6/8L789bWrrXTQe/hrJYb6qQ5QKXNVdJ4++IMGUaj5lRYRqQ/dveqX2WfWPYJDOBi+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jE6JMaNHmad/Hj4gWZd6NmdTXBE+LSbvcZYLU2b6h68=;
 b=nTxWfe6wOBU8dOb57HwYY96TR8ehKAGn4pMPEbw+ROXm9P+GeKpnnILK55b9nfYLzjCTGdNCdzJH4kJmZTlrxXxRHIxaY2Vt0vlNiRlrR+X5WoI7/iVcv/zWW0D+jTMbRBoK2OramtvbollGZo7g5nfKB4xR83T33qdMsVzQlpnwecpnAo2D6ygAXeaAPNMpxU6cpqpH/z7tR2ng82kzuOSvq+nu7Sl91dqVmZES4HeVHokaXtrEpcw4vsQEXyWdbUIvgoKFzukH2aRXyvQkhssYRrOXz6MrEZRDT8flh7mgNbcnsApQUW+kWO9bZPl8ujOgZ7mBWRTxUPrWRHKO6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 22:24:46 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 22:24:46 +0000
Date: Fri, 10 Oct 2025 15:24:44 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 09/18] tests/intel/xe_oa: Convert
 test_non_zero_reason to take an OA unit argument
Message-ID: <aOmHrDl3rgeP+WqQ@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-10-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008211806.625154-10-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0385.namprd04.prod.outlook.com
 (2603:10b6:303:81::30) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY5PR11MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 89a03956-4a1c-4541-8e28-08de084bd1a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXJqYjFmVDdrR2FkYWJkVS9wL1RqSDh5Q3FXZmR4Y3ZlTFFXUGlrZm1UYXJo?=
 =?utf-8?B?UTBGTlVNd1JZN0N4OGdGdUhHTnpkam1lb1dMSXl2TkhMblVEQm5FZVNwbFFY?=
 =?utf-8?B?NnBsMGh6dURyY2hkdmFyWWl6SVBBeWZDRHkvaElKWUdWVnVwOVZCMTRnOFRh?=
 =?utf-8?B?ZE9CK1NyWlgwYk5jRWF6VXB3d0ZBYndXZFJ2ZHhaVm9LOHJubzFSaVZaSHcr?=
 =?utf-8?B?N0lIODZ4ZjhVdlpYMGRKZzdrMGpCR1hVS0FFa3lDUGwyQVU0cTFOSHU1dmZS?=
 =?utf-8?B?RExyWkhVVVIwWmx6UkR2eTZuZWhYaFNNNHZOcnN3ZytnZS9wVTA2REhRTEtP?=
 =?utf-8?B?Y09lV251SXdubjBRZFNOU3Z3RW9OZWVNSUVySzU5UUtjTXF3cW9VUVcyb1Ji?=
 =?utf-8?B?WEtrWi9PNUp5SXExeDJRZkVFZWlNWUhNVUFCWnlJOFdKdlpLQUtyZnJoakV5?=
 =?utf-8?B?WHZlT2lGUEtuQ0FTU3BUU0k2VXhna0hkMWs5UmpWMHRjVFZNN3c3MEtpbWNK?=
 =?utf-8?B?SVFROGdTYmx1MUNycC8vZ2F0K09ibFBvN3lZVTNoRDhaZ3BVT3MxS1dNYnZC?=
 =?utf-8?B?QVlaQzZndm1ESndPbGoxOHZiYytMazUvY0pmWW0veUFsaXRSM1VYZUd0ZWt6?=
 =?utf-8?B?NytTdWhPaW83NUNkOUp5aDdVc2IvZ2ozYkkrREREMHdML09GeWM5ZXdXcXdR?=
 =?utf-8?B?KzdhOXZzMFk0a3pud3pKV3JqVXA1TlRyejlkWGdMYVMzVS9pSjBKMzFlenhi?=
 =?utf-8?B?OHUyL1U4VkEybXppOGZVaDVRVEJXZjFSZ1hYblBDYTZVcDc0SlA2TGxhTlNR?=
 =?utf-8?B?eEZua282K2pHTUFwOU1QVUtSQ2l5d0hEOWVLRUF4QUhsczdZTjVlUmkvYTJM?=
 =?utf-8?B?MTNRWVpERWRna1ZEdFBlQXNJdXU3SFZWdG1pNWsrVHh6MDdzM29EVUxWUlQv?=
 =?utf-8?B?ME1DN0loSFFTOFI5OXRoUVNFOG1aVUl5NE9vcU1KTUI3d2lMVFJvOW9Na0U5?=
 =?utf-8?B?UFBudVY5QXJQdk03eTMxTkhldnFiWVJ5VkJwYVZISFd3dXd0WlE3VUlFcDZX?=
 =?utf-8?B?bEpLZDRmVzc0ejBCS0dCY2pIeTk5cVFlSU5XT3E3TWEwKzViK1NveGJsMGto?=
 =?utf-8?B?SUZkSFc5UWsweVU5ZW11RktOMGNuWmtobldDTEFXYTJMOVk0N0tDckNxY24y?=
 =?utf-8?B?M2tLQlB2MnpMMTR3WmlTWnp0MVVCTFhlcndSdVNqYi9mQU9ET0lqZkxVa0tC?=
 =?utf-8?B?Mi9VRW1hR016eVcxaFlXNDUyOVZhZDJnNHE3ZGNzWG4rSisvK1VZVG9pRVVE?=
 =?utf-8?B?VGNYQytodGZ4WHdIQXY1N29FZldKNXlMUk1OTk1PTDVWS1gxZ3pGR2NvU2ZH?=
 =?utf-8?B?L3pxZ1huZUp4bHN5OU9QSkRyODVmb3UvZVhjSHI0WHI3M2ZaSEFlYlRDQ2JG?=
 =?utf-8?B?WUtaNWJhdnh3bGZwZHNEZGZITmlhQVRnR0QxLzlITXd1RGRvZXRBeW0xRUtr?=
 =?utf-8?B?OG9nb3ZmNTFMU0RsbDNOSDgvaXMyMzRsTXZ2a1cyWXdZaVdaMlAwQ3lkbC9X?=
 =?utf-8?B?aGphVy9ndWFQQlpWYUM1V0pEWGZhclRQTS9FSmZZaDZOWGduSm44bW4zRkp0?=
 =?utf-8?B?SHVFL1FZYjdDZUQ1YU5pbUU3eTI2a241ZFBJVUs5WGpkRUFSUEpQUmtXU1hz?=
 =?utf-8?B?YnpEa3hzL2JIVFZrbkFIWG0vdWVNSmt6Y1RYRzFtKy95SUQwTVpSYjRnV0Zt?=
 =?utf-8?B?Y0dFRUlKWkVLaUxieEtDZmgyRExpVXFqdllwZnJuNG96aStabkdrWHhqeTRN?=
 =?utf-8?B?RjRzak55clZLSldOdDlJRVY2UlR3UDYwVmhRSGhlMXJHTndnZjM2bVhRVkJC?=
 =?utf-8?B?S2tuNHpzRmhLb3pBUWN2U1RMNHFORFBZR0xYZFgzQmtmR004WDJsRVZhaC9V?=
 =?utf-8?Q?qHH3nmH+DLQ15kDLtPQRVgAg6ttJ8UWA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2lyWFlGbTlIdHhuSHZqckhySmpwNWoyQVJvbmErVHFDSE9BemltdnRNb3Y3?=
 =?utf-8?B?eGVYamJiUzJyZDBsZFRPWE1wK3ZwTEtoODF0MWRtY1QxdVVzU1AvektIRWRy?=
 =?utf-8?B?Q2ZtQTJMVUI2eFNKZEdhbEpIQXovcStHSlpOa0U1eHp5NC9CbDdQTDc1V0VL?=
 =?utf-8?B?VHJVUU5Gc3ZON0V1OEYzWXU4ZC9JRllIYzlWazREVXE2Y2lHZ0syY1hoNUdV?=
 =?utf-8?B?TjdFcUxqQjRqeU9QN1FaRXBlVHMvTTY2TjdzNlZGYng4SkNjNEsrVnZnbGpK?=
 =?utf-8?B?QUJWNGw5MkQ5b2sxMk01aG16NmZlUTFLWjJ3bnFoWHlsVEpIR0FUREpPQlJm?=
 =?utf-8?B?cHpoZC9pcHBmVTBidE1xQklQLzhaTXZwTTVqQzRjMks5S1dUdjFOLzNWZjJ4?=
 =?utf-8?B?TnMxME5HdHpRakNYcUpCL3czSlhZeE1HVVJEMnpGQ2hGN0ZseC9HMTJNQ2JG?=
 =?utf-8?B?TGJtdVh6M0VYSkppSW9kTmRNVmtDbkJ5LzZ2Zis1YnJOamVoQWcrZWNqTEhm?=
 =?utf-8?B?ODN6RWJKZEYzT3BqRHJpVjZWSG9LVlk3S09lekRmaW1rSHNTM0pOYnhPRzl4?=
 =?utf-8?B?dWdBc2E0OVpnQjdrcTBLODRDK3lUdGxkVEFPUXo0L3VjTXJ1WExCTXFSOUxa?=
 =?utf-8?B?eGhmanlQY3RSeHp1RnNpdXl4V00wZ0FyR04zWmUvMUtkaXhudTM3OG04bkRO?=
 =?utf-8?B?UDdPTnh6VytGMCtpRmdtRGdjaWpNdmtIdGIyRC9kMVEwVkp4MkZYd1oyWko3?=
 =?utf-8?B?dVdhaytTYi9qK2lBZTZNTVU3TGhRY1dIUDRnaGFrQm5SSWY1VkgwQUtRYnBu?=
 =?utf-8?B?dUMwa1NaRXFFeCtiRkNmbnBBZERnZFNJcjArSFJDNnhiZWdSUDZBTjZVQVpp?=
 =?utf-8?B?bTlaTmM2bUJpQWY0K0ltc3dBOFlnNkd2cmVFZ01yUGwvSGJ4bXl0b1ZNMlcv?=
 =?utf-8?B?UWhIcjNtN1RweWlrdkNnL3F6K3UyaXkxSkIzWUlabkl5ZHZQZjc3N0dialNQ?=
 =?utf-8?B?ay9pUCttTU9lTjByamxjYVB0TEtUNlEvczJkc1RUTjZnYmRlMUdLNjlaRTFo?=
 =?utf-8?B?cGlxSCt1bG9BTGhBdllJQ0hvbmVubWMvS3ZPTzF3Mk9SQktveTNlTEZXRGxh?=
 =?utf-8?B?dFF2TFRFUDlMMGl2aDhhVE5jV1psSDlXS0E1WWRzTDA1by9wVW9BejFoT1Yw?=
 =?utf-8?B?dHdtVm01ZXV0UWJ1YXZnSW11Zm9meEFPa244MTBmcWdHbWUwenpOcGphZnFS?=
 =?utf-8?B?L3VzVENHZWxENDNSdDlLWTdKQ2IvR0Q5cTRJaXZTQy9TdXdBZGU0M3BwMmRx?=
 =?utf-8?B?NjBWUUxPTzJpQVZEUy9OSzZmY1VnTi9NSlhrOUpzZDVHN2NFQThRczZZMnZu?=
 =?utf-8?B?UmFzdDNqeHgyMmlaYUpTakRpWGFYZW5admV6aXA5NWtINmg2WTlWK09BdCs2?=
 =?utf-8?B?dm11WFNxUXBoS3FMT1hERFlySUxvSUtjcnVlSE11UitiMzZFMTBuNVRXK3Ay?=
 =?utf-8?B?ZHlSZk5CMlp6TDBuQk5oaysvTW8zMmE2eHgrMzhGcEJBNmVIYlY0bWRhUHBj?=
 =?utf-8?B?QlZWWWhvZUd4T24wdHQySnVlQVJEbHo0TkdBV2hUemFsVFA0OUpocDdQdSs2?=
 =?utf-8?B?dVJOYmhick51WCtjRTI5ZWJ6OHAySFROT0xtRUk2aFFaYjZZZFJKemFHRERQ?=
 =?utf-8?B?UlBqMkM0dGZ4ck1jN1Zyd0dGNnFHU1dwWlY3TTFsU0M0TVZMNEdhTGNEeE9l?=
 =?utf-8?B?Mi9JaHlBZTdEamI5bGs0N0FneDQrclpiVHpkV09mWklHVG14alVqOE0zKzdN?=
 =?utf-8?B?MnRmd3RxZllabEE3aElEcjFyZDlLeU9VaW1tMCttUGVwU0t4WFFLbWUxcUhQ?=
 =?utf-8?B?M1Vqb0kweW1ZTDRwRk1JVFE0WHpPdjQrVUUxM2pUZjlnMTNTZHltK21Vc1ds?=
 =?utf-8?B?QzlldlNsL0hLMHBZbTJrTVJERTFIWVl4VXIwWXlQZjQ1WDJoNmtoTk1pTTlo?=
 =?utf-8?B?QjczSmJDWVlOWG83aTd2ZjR4QnhCc1BEWVZQa25vdEY1OEdJc2Uyd2dyOWpX?=
 =?utf-8?B?UVMyMFFJZWhnSGhQREttOFVnaFBPaEZlUmgwYmZIZGpQTWVIZHJDOU55S2Qz?=
 =?utf-8?B?akVHNzdRQjFPeTdNNXpEbENtbzZ0NzVJQi9OUndYUmZqUzU2RTJ1Rit6N1FY?=
 =?utf-8?Q?99dbKCoxFWwPQcvV4m+rHy4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a03956-4a1c-4541-8e28-08de084bd1a2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 22:24:46.7469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuez87rpXkrU6une+lwDVQlf1Kcp/0uIWyz0zmEFyceCMuMeRDpyeS+MWqg8LlzELTc5cAHX7p1XF1OgA840+VZLJwta6bmmg1HzAwYPL/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
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

On Wed, Oct 08, 2025 at 02:17:56PM -0700, Ashutosh Dixit wrote:
>Convert test_non_zero_reason to take 'struct drm_xe_oa_unit *' argument, to
>enable it to be run on all OA units.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
  
Umesh
>---
> tests/intel/xe_oa.c | 16 ++++++++--------
> 1 file changed, 8 insertions(+), 8 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index ac15da09a3..8ee8a85ed7 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -2631,15 +2631,15 @@ test_buffer_fill(struct drm_xe_oa_unit *oau)
>  * Description: Test reason field is non-zero. Can also check OA buffer wraparound issues
>  */
> static void
>-test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_buffer_size)
>+test_non_zero_reason(struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
> {
> 	/* ~20 micro second period */
> 	int oa_exponent = max_oa_exponent_for_period_lte(20000);
>-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	uint64_t fmt = test_set->perf_oa_format;
> 	size_t report_size = get_oa_format(fmt).size;
> 	uint64_t properties[] = {
>-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
>
> 		/* Include OA reports in samples */
> 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>@@ -2710,7 +2710,7 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
> 		 */
> 		if (!oa_buffer_size && last_report && (offset / report_size == check_idx)) {
> 			sanity_check_reports(last_report, report, fmt);
>-			pec_sanity_check_reports(last_report, report, metric_set(hwe));
>+			pec_sanity_check_reports(last_report, report, oa_unit_metric_set(oau));
> 		}
>
> 		last_report = report;
>@@ -5131,15 +5131,15 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 		long k = random() % num_buf_sizes;
>
> 		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
>-		__for_one_hwe_in_oag_w_arg(hwe, buf_sizes[k].name)
>-			test_non_zero_reason(hwe, buf_sizes[k].size);
>+		__for_oa_unit_by_type_w_arg(DRM_XE_OA_UNIT_TYPE_OAG, buf_sizes[k].name)
>+			test_non_zero_reason(oau, buf_sizes[k].size);
> 	}
>
> 	igt_subtest_with_dynamic("non-zero-reason") {
> 		igt_require(!igt_run_in_simulation());
> 		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
>-		__for_one_hwe_in_oag(hwe)
>-			test_non_zero_reason(hwe, 0);
>+		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+			test_non_zero_reason(oau, 0);
> 	}
>
> 	igt_subtest("disabled-read-error")
>-- 
>2.48.1
>
