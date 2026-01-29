Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440AFD61010
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 12:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DFC10E856;
	Thu, 29 Jan 2026 12:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NpmGVW2L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AE110E857
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 12:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769689971; x=1801225971;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Tt+lP1jWN2UyDi8YthCcpi3xbt2KgZX/zlhwAXRJuOM=;
 b=NpmGVW2L0/kRaKIZuOSYFKgtFKki1d7vakfqucBLF/52fzo17sZ5c30N
 fCQK+VdZmeJ/SqBjgZbSePBAF2XLe+IqdbXOccFCvBxajllD87iWWnf85
 zwZm96HJany5HhnH//MZF7V3mNTHrKSvpbzewjmd0ULN4dUjcJUMNbdVI
 v7hjevtw060rHHcYZxzLrTBl+JKSp1EMWtB3NiIighX9tjb/Z0graR6pQ
 FeMrbK2BN3Nh61f/nK3DtGr/7dMN6Ej5S5xK8TQ7NzqLpStSY06S2YJ5W
 R7s9bcYQokcf2lx79HTnx/nRoKBB6fevBxZb2dJgecdcKVm0duchF7tM0 w==;
X-CSE-ConnectionGUID: 7XaYNwpGQj+k3F8i9cuFuQ==
X-CSE-MsgGUID: aBugXM/VRIaey7N359AGfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70127384"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="70127384"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 04:32:51 -0800
X-CSE-ConnectionGUID: uyqgso5HQqKQU+8Yuium2w==
X-CSE-MsgGUID: 9dXAoXhxS5SjSwJ302dBAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208989467"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 04:32:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 04:32:49 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 04:32:49 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 04:32:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkVWKafVt134itVTL9bd+yCYCEseYRQjf8gg21zp2QambxUnigOZNTxG3Jg2o95GTAziESe/7IHYY8a+SJQzichXyQTrgxlMkxGW7dojY2jmbdq/+hm2sq444hCcS+sVNXry1CLyUyyE0e0zdsNw6LF/zjvHbTjXbTplybp9XcVIIOo3UfLdKc+2NzwhnS0kkjgfy9kBIpdsqupoghkok1s4QGHGSCLZTn0jarKiY8M3MgbQEWR9YFYtkP01plEXVq5tLMvX+jKEi26VET+xDiC7Z2l+I9z4x3rxjL2XH8OqXLf1wHNs9s8HcMdFnTCkTJJMq9jchRDxU5EHhxNXxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xy5yvX2L+AM+5/yCaHCmNylFdA1Z5nJ4VmYdvgIz6lY=;
 b=oVluR0WE8P3O1XfDWzGKhdKrHrsPjWtEThOA1SdB8CRfcxXyjsoFzL+tk8xDzRbdfzLSF+NJcdyZlsERofA8BJdNr+t/8dqw/qr5YsmeRdQHJwLbZf3sNS5h+xrBUSpVyMmGpmnRXv5jWrOmpY7HBiFdAmigz7pbIDsF0Onmjwpj8OB7PMumkt0q7UQ461OYWfDgLvttDhSS08E3tqNhBKZfNQ5pB+X2EBz1yhEztMr6ftYduIeAibbEAiiTacJkIGrBsa1ZfZbJw68iDybbaOnrGKh3e1SgfBUwDoVvT/1xGSyABXSKc/U+JBLvhHBGP6WpNZSCf+80gq6Wd7yZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DM3PPF4D011AE7D.namprd11.prod.outlook.com (2603:10b6:f:fc00::f20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 12:32:47 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 12:32:46 +0000
Message-ID: <d9703fc1-5c55-410d-9001-e57d386db8f1@intel.com>
Date: Thu, 29 Jan 2026 18:02:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Update NVL display blocklist
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260129114440.155214-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260129114440.155214-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DM3PPF4D011AE7D:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c8aba10-2487-430d-d8c8-08de5f3281af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|42112799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cW9ubGMvbWN6UDFCRGFDbks3WGFWclo2Y2hrQzZHL3FrM1YzcnRTNThDY2tG?=
 =?utf-8?B?b0czVThYVG9SUFBhM2hmN0dDbE8zU1pmNFJPTGx3WVJRaFp4VHlGc2NEZFdk?=
 =?utf-8?B?VTQwdU4vZFZ1NU1uSFgwOUVNYUc1TklXUm8xR0J4Tjd0V3J3aXJpMExNUFFM?=
 =?utf-8?B?Ujdib1hBK2wwbmVJVnZTaVdWaCtSZ3ptZFlqS25mS0ZqdnI1Z0EwVzdNRXpW?=
 =?utf-8?B?WVhLYmluTEZycTYrZ254TWFIdkVHT2FQQ2ZodVQxbkxOa2h4VE5xS3A4cnZs?=
 =?utf-8?B?VitwSCtkSzZNajNGUUY5YVJrWmN5Tm9CelVZOTJ1U0R5TjNLYzdiRHMwd2hz?=
 =?utf-8?B?Z2dCM3h3U21zOGxBVUFJUVo2Um5pS2RoOVBLeWZxQU1vQStDblRRYTRYdkdm?=
 =?utf-8?B?WVo1WGZCQ3N4cEpjT0JleTMwWm4vNVNYTU42UWtRUDR3M2Y1SVkyMllYaElm?=
 =?utf-8?B?dG5sbTZkTVZQK2R3dkwxTXZBeGtPdlFxaitrSjdHZXJGUzYrVVBTZmhyWkJF?=
 =?utf-8?B?RzA5RXJCSzlxSUFkb2lnTzFyeUEzaEpGVkNZTVNRYzhnb2JQV01HT2dqcnBB?=
 =?utf-8?B?M3Q3SWVaRmw4eW8vZmVORlVPRkZyYXRsWDVVZDY1ZW03aWJuMTh0TkZiSStJ?=
 =?utf-8?B?NXVuc200RHAyZ1ZKN2pYcEY3YldrK1U4UjY0Vlprck4zNjNDRWR3K0J3M2Rt?=
 =?utf-8?B?ZWVDWTdReHAxNVhpbkk1Tkg1aWJ0QTBXMjloU1VxcHdwRUNOZVdoVFpRdk9H?=
 =?utf-8?B?dWxMWnkxMlRHQ09zak95SGxMam1RaWg1TXRaekFnbkUrMnpHcHZSWDVlSEZI?=
 =?utf-8?B?L0R3OUQrUXV4N3RUN1p4djVXYzNxalJZRkRGa1VtSHVzVmpIbEwyUENiQm9J?=
 =?utf-8?B?WTlUT0xydTdTdzA4aFViMGhleWozTmxiOURaSWFMbldseWx6MzBXZVloNEJW?=
 =?utf-8?B?dk8vTG1nQWhDMzF0YXdIQUNBc1RUdUhFeHppYm9vWDNEQ2Z6dXlrTDlMajlX?=
 =?utf-8?B?djlwNUduWDhCbU5Wb1VGalBQQTRQOWhremZjNjgxa0RkZFdvRElicWxMU3lG?=
 =?utf-8?B?RVQ0YUQydGVSbndkVWhGMndMQ0Q1THB4blFYYnhvTUZ3WWx4WVNpajY0b29L?=
 =?utf-8?B?VDI1NittcWlWbmtOUVZBTitiQmEyUDNTZGNjOEJYZzBwaHl0bURYSEwxMzR2?=
 =?utf-8?B?UEZWNVhBd1RxM25UWlorMWVZUDlta0RTbmNzZ3JYUG1QTGF4YkhTb0ZjOU9Z?=
 =?utf-8?B?ci9XUFVzWEFvcWNtSkhITDFQN3RZTGlxV3MvTkQ1Z281ZXF4cEtHQll0RmtP?=
 =?utf-8?B?UGdWL0hyYnZoS3ZUQjlORVJYN3VBSUI0QjVOYmFIL2RXR0JEbk4zZXF2blZP?=
 =?utf-8?B?YmkrNEVlV29OZjVDc0JjOTZJMTIwbndRNFJaSjUyN1JmSWV5RUU5aU9hNExw?=
 =?utf-8?B?VmpmZHhKN3hoRHdFNVBNVjdWYXZhODFFdEhvMUh5SkJheFdIUTAvYVNFUUVa?=
 =?utf-8?B?RHIzMGpteGZhb2NBUmhaZGU1cnpZVHVUVXQwc0V2M1drZWpEdWh0Z1Y4UmVh?=
 =?utf-8?B?Sm1XVU5SM0xCd2YzR1BlejNGZ212QnJpcW1pbC9xSVlNOU5YZXZSTlEzcThH?=
 =?utf-8?B?ZjZKM2FiVHpCanZPR2NPb2J3THF5aUtrMVJCLzE1S3d6c1gveTErb1ZxbXlZ?=
 =?utf-8?B?M2hDOTkyeHFoMU5ha0E3UUxDbWNlSlRqN2RaUEZjVVh1dHd1b04wSERSQSt0?=
 =?utf-8?B?eEsrYVhNWk1EUkV4YVBmcmQ3ejd2R2pKdUV1andMdHJ0MkxlSm1pU0dlUm5Z?=
 =?utf-8?B?NkFEazVZY2VkQ2NtZzFZLzkwR2lGODFmUmRROTZFUDN0L096aGcycnJVdHRO?=
 =?utf-8?B?NEk0ZzBTRnJHazVMeWpkOGVXbmxLQjBwdzBUakxNTW52RkRlSXNKNk4xRDFK?=
 =?utf-8?B?eVpPdDU1NDFxbDR1OHJrRnAralhrM0pmTUVmUnhSYTBieGkwNU44elpDNUkx?=
 =?utf-8?B?SmhEdFY0YTVlTFhSSis4NGtScjNWT2s1Z3crWmhqRFBoOEVjKzZ5RUlHNTgv?=
 =?utf-8?B?SmdOdHVISmI4aGZKNmdCT251eU1Md21OTHZBdk5HNDBRVlFBTlJYdEpEWFIw?=
 =?utf-8?Q?7Dxs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dktJRDJMS2diV3l2RzIwNnlTRTRDVXNjY1VtZzJPYTJjVENTNGhlRnhFVGxL?=
 =?utf-8?B?S0VhaHNCQ0ZXd0NnN01CSGdkSnR3QjJMQzhPRzUydEhoVXYwcUlqVng0NEJx?=
 =?utf-8?B?VElicjRJZDZORU9jYVNOQngwVUpTRCt0L01HVDcrMkx6QS9NaGtJU1dlS09G?=
 =?utf-8?B?MnBnRmMzREhOTG9POFQ5WWMzb3NBTWUzRXRlNndGMWhvTURNbi9XYUhrZHc1?=
 =?utf-8?B?TCtMWkhqWWQxNGp0WS9aREU3NHN2QUQ3eFkrL212WlNERTFxQ2kwTENzWEw2?=
 =?utf-8?B?Y2FrcFpCbFNxUUhIYWEwb1NTcFhVSk1ieFNKcmNmTEY3K0s5UkQ5TFRVRUhV?=
 =?utf-8?B?YjllYW1POFhUUDNvNEFqaGlBN2tNS3BRWWRkR1JZSmdFT1lCRS95cGxRUWhx?=
 =?utf-8?B?N2krSGpvbGk4ZklTaXdKZUloRjlFWnJZZS9uTFduZzJuaUE3ejFYQzE0ZkM5?=
 =?utf-8?B?TjJZZmpkcmZxalpRQjNaQVRxQzNyc2gzRFJLN3hLZy9OS0Z1ZFZEQjR1dUhp?=
 =?utf-8?B?YlVZNUpwUHNhaGZyTTF1QUM1ZFNWNVJuMG5HVW1scE1CRU5LdmR3VXdHYTJq?=
 =?utf-8?B?SWRGeWVQYjhMVGhjd0V5aE5TS21lbTVySWZZdW9ZUGUvb2dQSlVOQTZPUlFE?=
 =?utf-8?B?ckNxTFVuMDFuN2RIN1NVSGFaQ2VoVmt1d1Jla3JkUVJNMHkxQm9idXA1U3JW?=
 =?utf-8?B?RVh3SW9wOWNwYWtuQzZkMGUyQm10QW5sWVBxY3pneFcxSENxM1VSYlF3bzVY?=
 =?utf-8?B?SWFMTkR2OHRHNGlzZ0pPTWlhemFnQzdVQkM1Y042eGJ1V1VtU2lnNkc4Z3d5?=
 =?utf-8?B?Sk12TXl4aGNZMERUZWkxK0dYYk9FdDRpRHVsNzE1bU1UMFVNUEphaitWOExu?=
 =?utf-8?B?UFBOZHNrdHFrZjFBSGFqcnVweU1wUHFkUmlEZ2hhYWgvcWNTUWtxRVRpMS82?=
 =?utf-8?B?UjBPU0RLS3RiQzlsYU9va1R2Zm1CTTY5UnJrMkFpN1N5aHZKT1JtMEY5UHZP?=
 =?utf-8?B?WVFESVF3dXhrdVBQWWFzbmo3ZE5ON2k1QWlIaUdpOWI0azRjb0huclFlREw3?=
 =?utf-8?B?eEhYU2l5dENJMTNBNTVoMWlZYjRFR1owSXNpOC9XOHhuV3Y3TmZqM1ZPNVdY?=
 =?utf-8?B?UnFlTFc2cFdtOUszR25QaFBhWmdVdkFmY1JXZ0pWL0VVdGU3VXF1bXkxd2FQ?=
 =?utf-8?B?N1RJSldiWVowM2s2b3orU1lUdElzMjk3dFluV0diWVVVYzgyOG5vUUdJL05n?=
 =?utf-8?B?YmgvclBXUGZvRzlXUW9WUEQydG9YZmdtSVJnb09BMXBncjVCdzhZV0xGYy9o?=
 =?utf-8?B?ZXhISnowMVprcUxtYUV0cHE1eXZadi9iWmppc2tPdnVYeGZsNUVUNHZwakVq?=
 =?utf-8?B?TzgySDJCNkVLYnlHb0d4R3FGNExEdWxDWTMreVAzOUNhTjhCV21LN2ZKa1Jt?=
 =?utf-8?B?MExteDhXUHliZHBVUUJhcCsrT0xkUnBNZDM4UWpmdEIrVUxhTXZSUGwxTklL?=
 =?utf-8?B?cTNUajYxbFRnQ0VydnRXaElRblQrdWlWWUhRbVN5RTJwM2xSNkhHZGNCZzNP?=
 =?utf-8?B?QzVEN2lsV3ZOM1AxbzZwUlhaMkRNYk1HbEVacHRocnB5ZlNUOHBEbnJKL3VM?=
 =?utf-8?B?MWx0cUdDdGZqUmhGa1V1WW5pM0ZmVnFocTlKZnlhYnUxbkdncSswSlhzL0k3?=
 =?utf-8?B?REJzQ25zS2VaOVdOeHB5NzNJNnJWbVhyaHlRek0zbWFKNTlxek81aTBxYXhm?=
 =?utf-8?B?TGJpU01xRXpkTU1GR0drbWpJQWxLR2dySUIvU05BaGRzS21Ba2h6eU5RQm9Q?=
 =?utf-8?B?SHQ2V3pCT0I0VXozYldrVGJNblF1dTFobGJ5Y2M5WUcvQWtiMnFXbXNJdWlk?=
 =?utf-8?B?TU94ejRJTm04SW54eVV2UXZpMWUycmJSbndoT0pWa2pnWmExb1BGbFBDQm9t?=
 =?utf-8?B?NjFIdkNPUEc0MVQycUIwb0VpaHRvSk10NFNObnFSa2VoTnoyZ3hKZDUyei9t?=
 =?utf-8?B?NzhKQ3dKOEI5YWFHbVZSNGl1QkxJV0xGL2FQRjNyTVVqMk9hMWtSbFhQanhm?=
 =?utf-8?B?UmpDRWt2MGJlemtmSndxd280U0Y4Y0xia3lGUjFaL3VlZDdJRFhOY2wrRDdi?=
 =?utf-8?B?cWtjOHhZV1hPcUJBbWx6clhBTVBsZ1NWTEVjWHE1TlZzbXZIejQ4MjdiamNy?=
 =?utf-8?B?dXRqdmtibUJCYk0yakF4RnFyZWFKL1N5OHhOd1JCYnpzeWo5SEVReEdRSUI2?=
 =?utf-8?B?MDlPVHZGaVhOcFE3Wm9HZ0JPLzE1M1NtSHdUOE1MQTJvRE5NYmNpb2xKOFE0?=
 =?utf-8?B?Z2J5VmhwK3d6cmxNdHBVV0hFbUFtN09acDB2OFI1NE56emtGSk1zdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8aba10-2487-430d-d8c8-08de5f3281af
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 12:32:46.7323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImN3z397R5vWMxaefRMzCJAIm/LD1P8Of1enfVNunsQdD+0N0i7tLjpvK93iqVrgTnbv2phPIvLdBCAa0LmOmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4D011AE7D
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

Hi Swati,

Nit: Good to have a unique commit subject line so that we don't have 
multiple commits with duplicate subject line.

Can be updated during merge.

With this updated,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

On 1/29/2026 5:14 PM, Swati Sharma wrote:
> Add deep-pkgc test to xe.nvl.display blocklist as valid skip.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel-ci/xe.nvl.display.blocklist.txt | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-ci/xe.nvl.display.blocklist.txt
> index 41d9eed3e..749514129 100644
> --- a/tests/intel-ci/xe.nvl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
> @@ -130,3 +130,7 @@ igt@kms_psr2_sf@fbc-(psr2|pr)-.*
>   ##############################################################################
>   igt@kms_pm_rpm@package-g7
>   ##############################################################################
> +# Valid skip: Deep-pkgc IGT not applicable
> +##############################################################################
> +igt@kms_pm_dc@deep-pkgc
> +##############################################################################
