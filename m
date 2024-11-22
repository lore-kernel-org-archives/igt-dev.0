Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2905CE6918F
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 19:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA53A10EC5A;
	Fri, 22 Nov 2024 19:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUJLH1DS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECE710E300
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 19:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732302325; x=1763838325;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sbylnE5AKdEHQhA5CcuUxz25wb/1prNb8D9dbb/Vpds=;
 b=SUJLH1DSNz9/QjYKeBppEuO6DuZVFTfbqTYT/tFnXfui1qhUYpPIcmiY
 j7tYpJYYm5q5d7bp/F2sMCiwIZCKv5aNxTyoqoX9iZZZ1IJqLd6NSQF7w
 YmMcn6ERnxZXfKh8G9gjArjCOhGePWKraIKEJwYNbVnIztSQZqFT68IFL
 x4buKzCxIshtxkGJeX0JPjznwPa6iQ0hkBJRqeL+/7l/+viqrJsCvYtk4
 IJmSTZpihtVtnl4SBzUf+5RvdrSMaWhalogxGK46VMR+NyedkVIhP4gex
 mKboIoZBLDFoUUR96ipnFljymACRlQFg9nU90OxmYB8lDoPvqw2cwHJv8 A==;
X-CSE-ConnectionGUID: R5FpQyI4QxqTwkXkTmum/g==
X-CSE-MsgGUID: MSmZy2VNS1+tWWZb2j68LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32525961"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="32525961"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 11:05:25 -0800
X-CSE-ConnectionGUID: 6cwlnTGkQAS3pJw3O8bD2Q==
X-CSE-MsgGUID: f2pLZBEUSOuIDm0xDGguzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="90791939"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 11:05:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 11:05:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 11:05:23 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 11:05:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKTKuBld70gKj2rZjzSaPsBno4PXOjk2/60MWLz6Xm9CziYL+48uwQGFJhbNT+aQPftGaPFEXlkodNxXkQRRnPuYJU5iqo3NZlJF6agknTRH6dOaBLOio+HzbqpIRP9szZjEvnmCwBtkQdkxoJt66/TE3HsW8ZV/5D2lwMzvxmoNsfEp3cN4jCLJ8s6p4LMYaIaJynyRRDVg3A9RD963rPuiLJ7fkBz/lDyPM6Lz8oeBbgVdu3V2jFLYfMdcCrHVWTCn9fprMWPoyaZDFhOx1FxKlS1OLala+OxAL2E/5ykMMt1nPABrBbzQgZt4bXqMNaA1m+YtWz00dmtkBCNsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aagq/4oPjbRHtSwpxnpAVUMQBq6aMGm58/m+XlE9RN8=;
 b=LTqLJTy91Zhd5HtLlQBTmthkcL4J/P1Tx4gHJXe3MW3QtmwpRImRdePOyV7mkE4Z9zCWBya/TVNWUFqVsQicnNOLKRgEc5/t8EOG9XJk5KY6SVQvoSB7ymr2T4+Efb5xLmcHAGmMtrZ0VVpCJ4sMEp6bu1ZdLqExU3yVPfxaEWmcMdhsLRXT9p9HtIBl+VFkapwB6o460b+MXkooPW482W42Dbl5b/dz5MSM+MDmb+6qGwyHTekMt4w9ZHw4fZG6mBQolDhubOOBintbnpK/QaqXMrARwsG20dalnAMtpOi9EyHSlXEKZ1hdOWb1oBR9MH9oaNEkE8GLQ1E90WTpdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CY8PR11MB6962.namprd11.prod.outlook.com (2603:10b6:930:59::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Fri, 22 Nov
 2024 19:05:20 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8182.014; Fri, 22 Nov 2024
 19:05:19 +0000
Message-ID: <6b563be6-ce89-43aa-a8ea-b6ba82f2c559@intel.com>
Date: Sat, 23 Nov 2024 00:35:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_rpm: Fix cursor_fb3 framebuffer
 creation format
To: "Samala, Pranay" <pranay.samala@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
References: <20241122040958.145956-1-jeevan.b@intel.com>
 <PH7PR11MB60538FC20BDF122A76648177E7232@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <PH7PR11MB60538FC20BDF122A76648177E7232@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23d::28) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CY8PR11MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: f92c705c-0892-48c1-f102-08dd0b289bab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTdsTHRINTZSZjdkZUZkOGNrYXd6WWNMNTRFVFZpQy84d1FhUER3OTBwV3dV?=
 =?utf-8?B?cFoxcFpMclJLMUZZY3JXRVZ5dkUwcWEvSnZsQ0RIM1JLWGdncllMdWdtYnNu?=
 =?utf-8?B?VElxYWpwQXVmVlZVV2tnUHQ2dkdZQkFOWVRnRlZmZlZaTHE0akVaL25RenIz?=
 =?utf-8?B?d1IyTUsrZG5MZWM2VVVuN0o0TXV4U3BQeG1CUFk5UGNCSzhIVm92d0Frd0wx?=
 =?utf-8?B?WDVWbTJMclJIUEQxR0U4dWQzWTRzMHhWN3l5T0c5d1l0SFFSbEtFVFRLdy8r?=
 =?utf-8?B?dk5raXpneWJJTXVGMUdFQVF1QTAwSktXZWpNbEs0aEJseW42OUdhRm5Dc2pZ?=
 =?utf-8?B?dlpOekM5cnV3WVZaQndXMnZEUyt3WmZYazcwVEtaejVFSXh3YmR0ckx2UlJy?=
 =?utf-8?B?bkFVeHZidUFSbTk0bm1TVEtiRGFEaXo4azJBSEt4UGJzSi9TNFdobEtJU0tC?=
 =?utf-8?B?WTBSTk5HQ3BlcjhsUFliTnUyVVdicGVPYnpISXl4K0t5djVCQUhiWFUrL2NC?=
 =?utf-8?B?YUpoLzVld0piTXg2VnZJbGRyRTZtb1ZocENsd1V4aFFSVWlBZmdOSVNEMnAw?=
 =?utf-8?B?Y2hUY3BSM1VpT0UyZWFMQWpzMVJjWk1Ma3hDMlN2SE1XUkFuUk0xQ3dxM3dM?=
 =?utf-8?B?RUNOK0J5TTJNbTdUUEROVFRUR0cxcWtkeW11b2p4c2RHK284bVBhb3AzclF2?=
 =?utf-8?B?bFIwNkY4MzR6di85MGl2VEZRbXF2bVRoSXlQOTVuMXpXMHZ3MzZadjh1L2lY?=
 =?utf-8?B?OGFTK2JFYTErYUpjQVdjNzdZNGU4aUtMSGk1clFHNEZaekxmaXNQenpPZUZS?=
 =?utf-8?B?Smxqb0NYZy9zM3h3VmI5bFZHSW5oRXc1ZlRtWWZzL0crUDVaL3hGcFI5a3pE?=
 =?utf-8?B?SkZnVTRBU2R0WjBpdWc2QUZjYWkwUGhseXpvdEkxT2UxenBRM3I4RFV0UjNY?=
 =?utf-8?B?d24vUlNwQnVQc2h0MGFvdnh5dUVydllWczRYNXpYYmVJL0hUYlJlMEFwZFI2?=
 =?utf-8?B?dDdNMnMrLzkxWVFCRWN5c1NZM2JObzBLVVJqYnRLWDhIUFpIczlPWHNlQVVu?=
 =?utf-8?B?Q1IrVHFkb3hpV1d1RXVYWUpZaUpERDFCajFFTGVaYUJxZlpKWFRDMGdBZXVQ?=
 =?utf-8?B?bThOK1l0cFloeUxGOUNUanVBTVFmOUc1b1dxMFBPRkZQK1IxeE0wMW9WeGts?=
 =?utf-8?B?ejRZWWxFUmd1amdhSURDU0dwVk1GSXppb0lkMkkvYnVoNTdYZ29uejJxR3VM?=
 =?utf-8?B?VTJ4d0h6eDd5eFNGdVl5WHZ0NWhYMG5hcXMrWmFnajhma3FsU25jRnNVTTVT?=
 =?utf-8?B?WjE2S3VvUkFjN1lvK2JZRWd4Mlczc1ZrV1hwajk5b0daSDIzMmVRTkVnaUpa?=
 =?utf-8?B?bVZrNVFSQUtSOHRnYjNaWUU0Mnl6UDIvalFFcFBZTjU3N1cybS9kMEZ6c1Q5?=
 =?utf-8?B?SVlLSDlBVm9Gby95WjlEN0p5WlRoODk0UlRrS1ZoMnl3R2laNEw2NlpYQzJw?=
 =?utf-8?B?bFJlTXpXMXBUR1dtWmNuR3NaSFFBOTBBUUs3OWwyYmNUcWQ1dml2LzdzRUZj?=
 =?utf-8?B?Sy9rOU5DL202VEhIeEVCRXFqc1dsV0pEajNKK3lPaC9OR21RVmZiV3MrZzJy?=
 =?utf-8?B?d1FScmh0RXRnM3p0N0N2ODZ6V0VMM3Z3STFYcWprWUMvTFFwS1I4YllBZ0xY?=
 =?utf-8?B?ME5BUGUxRDN6cEFhNnV0QXZPcDFHTWZpNzFLb1lvZzl5QVhjNTdQL2xBbUxv?=
 =?utf-8?B?dGNiSGxWV1VGMitkQUJ6d3U0dzZkejZKOFo0ZVBoOFo4UmY4bENsaE95OGxM?=
 =?utf-8?Q?tTWWpEPZSr36U/NA7eGQR0TDf1+MiYkjBC1p0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjZzWTc1WUJtVWZFdkxvWXludVhYWUtCbUxlUXNtOGwvaXZmWFl1Z252QkFR?=
 =?utf-8?B?L1YrVXJ5MnR3ZitMRWs1UlhxNjRoNWhWQ0NkM3FNTnlBclhubkNuQlpTK1VI?=
 =?utf-8?B?Y0FSNENlWUtkWGU0eVUyNDRyZmZTZFN1RHB6N2N4azBrNkR6TnJZU05YWjBv?=
 =?utf-8?B?QjJ6VFhZbW82K1lwQkdESkxmek1lRmtxWGdORDFiTlhGRndqOUFTUlhIYXkz?=
 =?utf-8?B?c0l4ZVhHbDk5UXF1dmpyam9HK0NJamY4ZkZJOWhNcHVIdGJIUHczSXNCdkk4?=
 =?utf-8?B?TEQxR25HWmdSK05tY01VbGFOem9wbU0wcEpUd3lhK2JaV0gwYW5rTlFhcnlh?=
 =?utf-8?B?TjI5OXBCMURKQjFUWE43dDlsZ2ZpZ0cxZ3RUV1FnazY1bnkrbTVBTFNFNXAr?=
 =?utf-8?B?N3lCMngrOGZMTWtVMGExeXNyL1JrRHlyK01lZ2lpWEpSUUQwVlc2ZFhXTVVq?=
 =?utf-8?B?VXFqSDY2eWVnOXRRSDZDbkVjTWhFL1c3UHVaSjN4ejNaVTdpUXNycSt6Y0Mv?=
 =?utf-8?B?OHdyK0pZMjc3VUJEWmFzTEg4ZzZWSmRST0VYYnZLcXpsVjhseFNKdmxoendT?=
 =?utf-8?B?OElRdXVNYloyRWtFaDI1dUR1SE5jdlV0OCtmY2NCalZJZ0x0MEJiazdOckNp?=
 =?utf-8?B?enpERU9seTBQdkVaS0pmY252bEFEWlBHelcvV2pMaDBtL28rZTlBTHNRT3Q1?=
 =?utf-8?B?RjJLOG9TdmlEMjVTUnpHS1hzV3FEZDgybXM3VitDQm9MNFBsY3M5WmNhM0pt?=
 =?utf-8?B?Z3ZCZFVVejBWRUtNNTNTZHcrQThMOS9oNTNwbkVTSGZvUjEwZzYrR0xkaERm?=
 =?utf-8?B?anBja1o5OC95MnhTYTFyK2tGSG9ES05VckFyU1VMbE1zZkFkR2RqWnNGWDJu?=
 =?utf-8?B?VE9TWXQ0MElVUW0vcnJyd2RMY2VkNnpTRklHOVNKTTNuMy90bGxyczVwc04z?=
 =?utf-8?B?UDZqSG1lNFhQY1pKL1h5Sm15UlFmYjN4MFlKVE9uWlQ5NW53aUZBelcydGdG?=
 =?utf-8?B?d2NQbkZaSjFtaUZKYWJNSEJyM3RqNWFhMkxzRlppRnRvckY5YlJtSTZoQW9i?=
 =?utf-8?B?UW5rdWxnQWtqdlFoUUFyNVNhMWpOTlh1bUEwRjRacWM3T2J2NGFrdHBXcHJV?=
 =?utf-8?B?ZXhuY2Yzd3dCZmdrUDc2UmlyREhFNTRvekhYWFl6RHZoVFBUVlBlRmRlNExi?=
 =?utf-8?B?ZVAzN2NCdnlHRnd2dW1VaGY2V1NSYS9hcWtXek9oL0RrMnlDWHBva1ExdnNs?=
 =?utf-8?B?bXFBR01PVjVYMXlRNWlRMDVVUGhJVHhSN29NV3dlQ1VYYXZDMXBLVGltUVVC?=
 =?utf-8?B?OE9VTnZpdXlhRzljaldmOUZGQmZHNE83RC9zVlM2ek5WdDJwZlJ1MmROcnBU?=
 =?utf-8?B?Qnk1Wm4wOExmNDU1YTJqa2o4b0l2Q1BJQS90V3ZZbFJkdG1Zc3VyeWg4Rzlt?=
 =?utf-8?B?WFBZb0ltakxVa3NVS2FPdkx1NDNJL05SOFBraXJ0N3g1NVpzSFcwdEVJOXFn?=
 =?utf-8?B?QXpTVVRPdlBJN1NpWVpCU0pZMEtsUHNXWGpuS251a1kyNEsxR0RrVDB0NnBZ?=
 =?utf-8?B?WkFQRytlQXdHcFBsV1YzZkx3bXVZM0FNcW5adVhBb3c0Rjg0c210cFp1U2Fj?=
 =?utf-8?B?bHcyeXhyS0ZYVXRzZERINU1GZFExamIyMk9JeW1zSk5CZjJ4aERTYnhZdWFi?=
 =?utf-8?B?K1ROWkhMQ2QwbzYzT2pKYitTWW5PNE5Dcno1cHJsSXRoZ08xNTZFM0d1YmVS?=
 =?utf-8?B?MmF6cC9lcmZXUm9aV0JMRlltbmxOZUpBWlozc1F2Q1ZYOXNhVnNST29Cc0p0?=
 =?utf-8?B?amVRL01CbUZuWDhZbG82amVrUDVaODBZRUdTazVUOHMwUC9vN1Awbjg1bWhG?=
 =?utf-8?B?N1drY3hQRGlrSGNFemJKMS9qakhFYktFRElDSTVhQjN1cFM2aldnSFJFZlZl?=
 =?utf-8?B?Vm85MS9FODdrQXFDZE9Kb0wraW8ySjNqT0Vqa3BYMDh2MTh6VmRLUzlxbXAv?=
 =?utf-8?B?Uyt4ZnRuK3liNkdpZ2xEdG9Ibllsb2lWaHRTY09EbVhCNG0vc1VvRndPTjRr?=
 =?utf-8?B?N3QzbXRJUTVlQzlFanVXOWlFK2RYcUpjOGFWU0VaaDF4SnpyeFN5MGlRb1li?=
 =?utf-8?B?cHdJWUQreFJUb2VqTFVDUHdNRWJpTUJtTU53OGZOVVpaTnFaa2ZMRlhtazN1?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f92c705c-0892-48c1-f102-08dd0b289bab
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 19:05:19.8016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xX90+4FA7fB9iU2D60lmePZ/o+Ir61lMQZX5dPVcHSv+o8ioorA86FIj2V5IYSAXek0uzhzuuvJ6ZLK4VLAuwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6962
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

On 22-11-2024 11:11 am, Samala, Pranay wrote:

> Hi Jeevan,
>
> Add bspec id. in commit message.
Hi Pranay,
Here there is no need to specify bspec id since its a generic change, 
nothing specific to

platform.

Jeevan,

You can update subject, here nothing is being fixed. You are just 
updating fb format,
since there is no specific need to use X tile.
>
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan B
>> Sent: Friday, November 22, 2024 9:40 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: B S, Karthik <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>
>> Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Fix cursor_fb3 framebuffer
>> creation format
>>
>> Updated cursor_fb3 framebuffer creation in the cursor subtest function to use
>> linear tiling instead of x-tile. As x-tile is no longer supported on latest platforms.
>>
>> Signed-off-by: Jeevan B <jeevan.b@intel.com>
>> ---
>>   tests/intel/kms_pm_rpm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c index
>> 990c50915..aeeaf69f7 100644
>> --- a/tests/intel/kms_pm_rpm.c
>> +++ b/tests/intel/kms_pm_rpm.c
>> @@ -1199,7 +1199,7 @@ static void cursor_subtest(bool dpms)
>>   	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
>>   		      DRM_FORMAT_MOD_LINEAR, &cursor_fb2);
>>   	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
>> -		      I915_FORMAT_MOD_X_TILED, &cursor_fb3);
>> +		      DRM_FORMAT_MOD_LINEAR, &cursor_fb3);
>>
>>   	fill_igt_fb(&cursor_fb1, 0xFF00FFFF);
>>   	fill_igt_fb(&cursor_fb2, 0xFF00FF00);
>> --
>> 2.25.1
