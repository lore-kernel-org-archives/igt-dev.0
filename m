Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1993AC61CE8
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 16:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDABC10E14C;
	Mon,  9 Jun 2025 16:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YSULJ991";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAAE10E14C
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jun 2025 16:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749487070; x=1781023070;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LWl9z+9xhiKfLwviPqrWb4+xaxkIAmgkU/T1I5MKPYQ=;
 b=YSULJ991PptOhKZRRNQSin1uV/n4KVuVFhg6EsaKynBIWVOcSRLVniwF
 rjltCz8zNm2fY2wqSpbKBprdEt1fq/Nc2KPKw40JoJXP9MVZuIjzMhTbN
 Hsd6cJKUOcE0wkZMdxPAj4Qy7RffPFbrVNvABRdTdpq/dOAi53tmWOVY1
 j4/SXd7oKiGR21D+vYkSsYrKGqOijrj8Fn3oI1l2zanAAStwQWpbP/Bi4
 pWBOJcL1jkogmpkD7E0bC5cJrwLZuByXADUZD/YgUI1jpiCj6VoowW8Cv
 EKzSIiQ9n9NTylFuTLBZ/ctIOi9tv0leLHv2407I0Ym8Colsezdhujq7k Q==;
X-CSE-ConnectionGUID: /cEl+ChJR8627sVDg2DxIQ==
X-CSE-MsgGUID: 2BCHpJefRGC03mRIgGsKTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="62225059"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="62225059"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 09:37:48 -0700
X-CSE-ConnectionGUID: nCzyZ8GaR6GQfcpIvzEKKw==
X-CSE-MsgGUID: BLx41g+MRWSNf/vpDfOvFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="147137311"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 09:37:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 09:37:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 09:37:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.84)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 09:37:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DyTOVtEda03pNn9FK9KI3W5g5lmmyh04TGUfVQvbof1VyHBTE+bXE4GfmyMNWrxIj8wcIgXOdQdGJSQz7CGOXTOUjcrxCMMllh+LvaqUxROrgQ8yWDmJ8f2xW2YNQGVdA3mpzk/dBuDpVGi7egn0+IZYpiD1zS5xyG0xLvhtRRPpdmY0kZGvJv7IbbcrWRfqSThLDBRpkBtC/h3zB6twYVnTGhRiJdJZv8sJGCcLPp2sVaWUBkB4M/17E+p4daBUcRocAoVnls4zfEbG5wGw4OlLrC5vMqxFT1gqZXc44fc3FJdBfAPvYye6W1NoMLFwYR3VdOc2WucXEi2svteGug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AlRqK847G2U33qpuQN7B6sPdqdc4pjgtgJY4c6DwOQ=;
 b=nohJ7ETf33Q6QvsZyHmCPbjqcZkla6k5eFD4hLYze3Hxyfw83bTIF27bgRwzcsNr6bWhnug9QGVfPEvh18eKuFGGFZ/3BVzL0OVEEsdzY0Uc/KlJ/NIegpvIN+AtWemEpXrUqcDGpvOo/5SdtSESLnqKXhvJsO59jYY+XPebEKk25u6b+4GAgnQoxDwnoPUPxQ6zc4kSLXN4P7Mnp5j8NKG6t+GcEj4SYYLreF1I3UQjRTEuwZShdBEqjsFurjaXcXcbNw9eL9b1cfLO8BLJNPCO26XnZAFTQIo0+c/mZXj6LqDETUk0F71VvaR5Rpzqr/RGAgpnW408xvetmFoyDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS4PPF00BBED10C.namprd11.prod.outlook.com (2603:10b6:f:fc02::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 9 Jun
 2025 16:37:34 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 16:37:34 +0000
Date: Mon, 9 Jun 2025 09:37:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v3 1/5] tests/intel/xe_pmu: Validate engine
 activity on gt reset
Message-ID: <aEcNwyIxXSIOT9Ke@unerlige-desk.amr.corp.intel.com>
References: <20250606101008.1949955-1-riana.tauro@intel.com>
 <20250606101008.1949955-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250606101008.1949955-2-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR13CA0056.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::31) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS4PPF00BBED10C:EE_
X-MS-Office365-Filtering-Correlation-Id: c75d85c0-2325-463b-9f5b-08dda773ef6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0c5YXFkaTVGb3BOY3lVQ3NkTTdDZkZFcHRTaW96V2hBSnJDemVKKzc3L0Fa?=
 =?utf-8?B?QlM3aXlVQnl1TlNvYk1nSDRoTUJ6RG5Mc3o5cVAra25BYXMzQXlvNWpNM0Zy?=
 =?utf-8?B?ZUJxdFNrNlRNTk5TVTRZRXJ4VGhzL2NmdDZQQWxkWC93NmJ3K3JvSW5hd0ZX?=
 =?utf-8?B?UFVQZWFpZHNPMFU4VENXdlViOUg4Y2VuUDJ5WUN5Y0JlTXVuWGZkb3huQ2dp?=
 =?utf-8?B?dVpJbDdEK3F3c1pxY0lXeWEzcVZLaHF6Y2tsd0RiV1dCWXNKeGRwNEFjL24x?=
 =?utf-8?B?UVY4UEtaOHE5Skt2VXhWOERsdTJsV2EyWDRRVWtkZTNWLzRJODFRN3JiSnoy?=
 =?utf-8?B?ZU5GVnhSd1JOeFZ1UnNJYmlPM0NEc3pPb0FaY0MyWEx5cEp3d2VWRFZCUytj?=
 =?utf-8?B?VFl5Q09lUk84S1RuV0pzbUtEK3djMTRaQkNHd1V4bmRtN2tpbk1GamlXS0dZ?=
 =?utf-8?B?Q2FRQmM2NDVmUldJZXR5blhkVHlUMjlQTUhFSzJFcmxNNnNHYWtmK0FzQ2RW?=
 =?utf-8?B?ZUkrMEp2RmhrSVlqVlVKdmZJOHgwSkpDUW5mMHcwV1d3SFdpbjlwNU15UmtN?=
 =?utf-8?B?UzMyM0JvZjBTZ0R1VS84TUVSV1FxMzZWQ25PMGh1aGo4SW5hOURBSHFyazVY?=
 =?utf-8?B?WXltb2dyVzlGd29vT3JHL0Z1dTUveCtRaVdGWDBYaDllN3RhNmxZb0VKNnho?=
 =?utf-8?B?SmZLN2VDdjZZb01SL3gxNmZhemRwREVFRmxYdXl5cy8wbnprUnB3a0trNk9x?=
 =?utf-8?B?YlU0bjd0Z2IrUXp0bkpCRTUvd3d0YmxzM0wxRHg0WEwvdzNGd3FCWndxbENU?=
 =?utf-8?B?ZlN3OUNrRGVYZUJBeXFjbFJLL2MwV2ZZdm9pdWw0c2Nlc1l3U3FhQmhzZzV4?=
 =?utf-8?B?bjJIdnN4RmhKN2c1MWVrN2UxblVuMncyRTBDSXBtM0JoQnhxU0FzOVRvdHl3?=
 =?utf-8?B?ZlNzcFFXSGpCMlJGRm1BNGQ4Z2xtbFNRbUp0M3BVNlBCZ3FYYS9XSGlQTXhL?=
 =?utf-8?B?cURKV0lnSWNjU0U1UDVBUVJUVEhoVkpobVFNY3A2VnhUbGNLYWxzUExyTGx6?=
 =?utf-8?B?Y0NxQ2VVY1BibTNGRmgxZXREUFhIdTJVb1pFUlVJZ044WmpqQkdZRXgxOHRM?=
 =?utf-8?B?MmJrMW5lTDdIY2pMQU1hWmMxekNSb3liN2Y5SStZckJOYXpTbWNYOGpZRUk3?=
 =?utf-8?B?c0l6K05RczdQTGpldWsyR2paYjRocGxNb3BsaVJRYjhVc0FwSmtQaUN2MGc1?=
 =?utf-8?B?TzgwUmZ0c1oyS0NFV0dEV0w1WnpaRXBWQllxVllXSVNnSTI1NkRCZTI0YW4x?=
 =?utf-8?B?YnNJUGpMVnV4djVHc2xWdVVnMWZ3czloMFRodWtnUFNmUlJhenoyNTZOZlJh?=
 =?utf-8?B?UFRMem05aU53a3hpSVU2THhUZWFob2lLVGhaUTdBWWlvaVYxR3prUkZyYmha?=
 =?utf-8?B?ZEx3cmljRWNGcnFGZFpDU1NIdEttMjJhcHZUancyN3ZUcjdKblRjakppRTJz?=
 =?utf-8?B?YlVTeDR3TkxDb0FwK2xJWVpSN2pZOEtXaWhZQzN5d0FHMHNueFNvT04wcTEx?=
 =?utf-8?B?cjJTMzB6MnVYS3ErMk0vTGl3U0hPTTVOR0ViVXNwMkdMbU5Cei8xWUZXUGZE?=
 =?utf-8?B?dlB6T1I3REgzbjZkVVhjWlgza3d2dDdtREJpZzFodjVMcEI1N3R3YUxhZzVl?=
 =?utf-8?B?SFJXNENQNS9xWitGMU5xOTdSWjQ4dThkWVRWWGNrTXFvZHhoWFZaemdpMGRE?=
 =?utf-8?B?V21FYkxVcjVneXI1TG1zclkxM0J1UnFNR3FzZWpkY3BqRFp2MEJpcDNybXU5?=
 =?utf-8?B?Mk5jOVFOMnFmbk11ZDFaakRrYnR1cTBNUmFxbERqRlFudXBXMjlESm5KN3hZ?=
 =?utf-8?B?eDF6Y29la0J4dnU5M2VjcEJ2bU5HNzZmV1hwbXQ0MFZ6WVdJSGtWWGptU0RQ?=
 =?utf-8?Q?dk4zYuqg+vY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnlmZy82aHNmT0tTTStQc3IyeXVIZ3BXSVJnRHlDTjJHOGcwbXlGUGQxMmRT?=
 =?utf-8?B?eHdYN2FFcUgrSVRuTmpmTkNkT2ROcHB4MzJzWjA0VnBwWCtXYVRNZFZXNXVv?=
 =?utf-8?B?TlNJclBRc3pwL1d4MFp3MGgvN3p3UWhwRTZMSW1WWTQ1ekszOU1kWFN3QTlv?=
 =?utf-8?B?VFdlTE1UYlJDc0FGVE55MmVBTHRORkQzd2tUby8waExXRWdmdnNxQ3BuV3Jj?=
 =?utf-8?B?UmZYcnBJOWp1UERCdDBqdDlVdngwVk81MVZneGhXQUd5YSszTkJna2NTZHRu?=
 =?utf-8?B?cW1CbEM0Q3puK2tPU2VSd2lXUzlBdVUxbDU4eDlvTjZ3S3lxUXIzODJMcnJN?=
 =?utf-8?B?c1lVVktiU2VWdC9OR0xMY2RyYm0ydmxNdmJGNEJFZ1VydlpNZnhEWC9MOVJY?=
 =?utf-8?B?QTkydUJFbHBrMmp6NXlpYnNpcjVjanowYlhKa2ZqSC9uV2R2eXhCdTdtb0N1?=
 =?utf-8?B?ZitrL3RGOExZKzJEMDB5a25GWkg2eFF6aDRZRzJSUFcwd081WFBpb3U5ZlBi?=
 =?utf-8?B?K3pkaHZmRTVFSHd1Qk9ybERGbHpvNFRsTXkyeTlVd01vNmdOcElnUXJYU2dI?=
 =?utf-8?B?b0JNYSt3emlJbU1XZ3owUE1ub1BqdCsvSkVFRFVmQ1lPcUc3eTYxeVh5L2Qr?=
 =?utf-8?B?ZnU0WTRTQXNuTnZHN1d2Q1dXUXdRdEVQWWhpVUVWNkxDTWpiWDFKVEp0bEIv?=
 =?utf-8?B?aGtmY3V0Wlh2QStFTzVCZXV0NkNqdy9XMXVlY1g1ckFHUE9LZzlKbldPK3Z3?=
 =?utf-8?B?ZzJiT1lxWUJGTUhsZ1FpRlhBWkJTRXRncWkrRzNTUC9UYUwzY3ROaHFIMEMy?=
 =?utf-8?B?aEdEVjZoaEF6dXNmamdOd0kzVyt0ckQrQU9jYlZHME5CSHlmNnlrM0RyblJL?=
 =?utf-8?B?ZVUvbzRaa1lIYjBBTnAzK1RMOVNCR1FVWTZvZ3d5SkFMckxSMUxqUUtob1J1?=
 =?utf-8?B?U2tHUEF2Zm5JTzFFTXBJY2FVVVJDc3BPWDlXNmlaWU93elg4eU16WW9vbUhx?=
 =?utf-8?B?VUJpMzN6RlU2MHQybDhnWGpzYXZIamFuRVY1eHdUbnByc3lWZUZ4aGplRUZl?=
 =?utf-8?B?U3lhc3gxVlRDZnFGN1NCU0pFU2lScmZFMlVoellhZXlhSlVxRFRvbEN5RFlx?=
 =?utf-8?B?VDBUakJ1YXNvbWwwU1NHYlc4N1FwUDU4ZEptQnRMaHZzMXhpWnQ1UTZyMldT?=
 =?utf-8?B?bzdta3p1aXlkd3ZkQ0tsTE5BV2Y1QUdqRlA4NDZBWCtvL2Z4WlNmSHY2TlZa?=
 =?utf-8?B?c1NNbDBDTHZRa0VMdUsrUkdpVFpUc1hWUG1GSFZXSlN4d1RabFd1TFVJT1NS?=
 =?utf-8?B?VmdXQjNodzRMaVBydFQ1Mk5kNTRzL0FuSmE2alc1WFcyNy8xUlNyRXNscDV6?=
 =?utf-8?B?Vmc1K3F3UTdhQm1ENytFR0hFT3g2YjNTNElQdjA1RktESEo2emEzV0VYSzIv?=
 =?utf-8?B?bEJMdGVrd0czUXUyajB5VWdQTzYzZjBhVVQvWER2SmJDcVNHU3liNUd3ZkhM?=
 =?utf-8?B?R0pyZTZRUXBzU2N2TEZ4K3E0dWV3K0xHd0ZNMWJwN3JMUmRORVZpM1REMXls?=
 =?utf-8?B?aXNxV28zTDh4bmZWa2lPck5LZWZndU9lVkJiNjA0WUxJdmh2WHFCdDg5UGdR?=
 =?utf-8?B?ZjJRbVRWNVpZa2ZYUU5Bb1FNWGdqeWttbnozTlN5STdvbjNWSFVYQkp6QU1i?=
 =?utf-8?B?REhlQkkzTmFuZ2d2MWZVeHV2dElrVEVkbTB0UkY2aWNyUVlaNEc4VzVKY2o2?=
 =?utf-8?B?bkYwazlWNWcyMXlib2lFUzFQeitDbWNtTzZ0T2hDa3NxR0hnU3paanF0R2Ix?=
 =?utf-8?B?LzR2MkUxTEZSQU52VU45Y1hyT3greGdJQkdiNm95QUEwMGJLWTBnbHJsYVlq?=
 =?utf-8?B?bjNOWDg2WGxYdFN1UGhDVE5NTUdmTzh5S2U3elRhclNsQ3ZyQk92cE5XR1Z6?=
 =?utf-8?B?L3JUWkZCZFdhZVFuZ2RyQzJUTkpDRnhuVmh0WEdDVElTdy9tV3dveEJrRkxM?=
 =?utf-8?B?b09wTDBWRXlVMUIxOG96ZkM3OU1YbUl6Zk9CSWZwZTI0ek1Nbnh6M0c1VUZB?=
 =?utf-8?B?V25GMC9WL2Z4dU0ySUxySTdWVkFvMmlFUjkvdUd1UzR0SjlFdy8rTXdFeGt1?=
 =?utf-8?B?NXlIbW0xWTVnL3JwTkhFd2JIZ0tlNzcvNlZQbktPanNkWFJVcVVrRFVOMUFr?=
 =?utf-8?Q?ifkRgY/Mzn+j/cIssRnWiec=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c75d85c0-2325-463b-9f5b-08dda773ef6e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:37:33.9320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m03e9DMRVVgy3Z+Pi6JxCumd1ocwDAwzAvrWI2N4FsPqVEgCgA/hSRrTCAVoS98qYL+C49dIHcV80WkXpVf6UleICrWDV6n+HMaWAzA7FrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF00BBED10C
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

On Fri, Jun 06, 2025 at 03:40:04PM +0530, Riana Tauro wrote:
>Add a test to validate engine activity is idle/showing load after gt reset.
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_pmu.c | 47 ++++++++++++++++++++++++++++++++++++++------
> 1 file changed, 41 insertions(+), 6 deletions(-)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index 02f23bd7d..d9b0d2c96 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -40,6 +40,12 @@
>  * Description: Test to validate engine activity by running workload on all engines
>  *		simultaneously and trailing idle
>  *
>+ * SUBTEST: engine-activity-gt-reset-idle
>+ * Description: Test to validate engine activity is idle after gt reset
>+ *
>+ * SUBTEST: engine-activity-gt-reset
>+ * Description: Test to validate engine activity on all engines before and after gt reset
>+ *
>  * SUBTEST: engine-activity-most-load
>  * Description: Test to validate engine activity by running workload on all engines except one
>  *
>@@ -75,6 +81,7 @@
> #define TEST_LOAD		BIT(0)
> #define TEST_TRAILING_IDLE	BIT(1)
> #define TEST_IDLE		BIT(2)
>+#define TEST_GT_RESET		BIT(3)
>
> const double tolerance = 0.1;
> static char xe_device[NAME_MAX];
>@@ -238,7 +245,10 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
> 		end_cork(fd, cork);
> 	pmu_read_multi(pmu_fd[0], 2, after);
>
>-	end_cork(fd, cork);
>+	if (flags & TEST_GT_RESET)
>+		xe_force_gt_reset_sync(fd, eci->gt_id);
>+	else
>+		end_cork(fd, cork);
>
> 	engine_active_ticks = after[0] - before[0];
> 	engine_total_ticks = after[1] - before[1];
>@@ -248,6 +258,24 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
> 	igt_debug("Engine total ticks: after %ld, before %ld delta %ld\n", after[1], before[1],
> 		  engine_total_ticks);
>
>+	if (flags & TEST_LOAD)
>+		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
>+	else
>+		igt_assert(!engine_active_ticks);
>+
>+	if (flags & TEST_GT_RESET) {
>+		pmu_read_multi(pmu_fd[0], 2, before);
>+		usleep(SLEEP_DURATION * USEC_PER_SEC);
>+		pmu_read_multi(pmu_fd[0], 2, after);
>+
>+		engine_active_ticks = after[0] - before[0];
>+
>+		igt_debug("Engine active ticks after gt reset:  after %ld, before %ld delta %ld\n",
>+			  after[0], before[0], engine_active_ticks);
>+
>+		igt_assert(!engine_active_ticks);
>+	}
>+
> 	if (cork)
> 		xe_cork_destroy(fd, cork);
>
>@@ -255,11 +283,6 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
>
> 	close(pmu_fd[0]);
> 	close(pmu_fd[1]);
>-
>-	if (flags & TEST_LOAD)
>-		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
>-	else
>-		igt_assert(!engine_active_ticks);
> }
>
> static void engine_activity_load_single(int fd, int num_engines,
>@@ -812,6 +835,18 @@ igt_main
> 	igt_subtest("engine-activity-all-load-idle")
> 		engine_activity_load_all(fd, num_engines, TEST_LOAD | TEST_TRAILING_IDLE);
>
>+	igt_describe("Validate engine activity is idle after gt reset");
>+	test_each_engine("engine-activity-gt-reset-idle", fd, eci)
>+		engine_activity(fd, eci, TEST_LOAD | TEST_GT_RESET);
>+
>+	igt_describe("Validate engine activity before and after gt reset");
>+	igt_subtest("engine-activity-gt-reset") {
>+		engine_activity_load_all(fd, num_engines, TEST_LOAD);
>+		xe_for_each_gt(fd, gt)
>+			xe_force_gt_reset_sync(fd, gt);
>+		engine_activity_load_all(fd, num_engines, TEST_LOAD);
>+	}
>+
> 	igt_subtest_group {
> 		unsigned int num_fns;
>
>-- 
>2.47.1
>
