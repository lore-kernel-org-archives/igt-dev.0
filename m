Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82845CE7B1F
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 14:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F7610EAA2;
	Fri, 14 Nov 2025 14:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XvaVsBh+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED4A10EAA2
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 14:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763132372; x=1794668372;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=HV/g3cVc/Eh5GaQ5z3PWaT/B2ESy+GUOI7o48LI7Uvs=;
 b=XvaVsBh+KoO73GomEX2uZukW4DoyUagusQRXR4N0UQwHbGa1zFewcdtn
 1My6Jjlp866rRKvuBg28LeH9IW/Zl8S+rTTmsXfaqX1uEYermjhmbX+g9
 D9xWYRoctvjgReitOVHxRUnybZhFHNHWxn+LDR4ThvYRxAnIZSaYto4Qw
 /Z7+pZ6hupHQ2Ovr9+fvDb/mrONGCKzbQn3WfRQa8ogWT+TY+nPwIsvak
 Pnb1xcs4Ik/xJADCpUEE7aptae3YoW4s4TLWBlcvE0SukTEA6Si30dDoC
 6OKq7B+lxlGaUZPY6LWNk67HMT3jHyJjD5we1vS1wW+x9W8fmja3eZMw1 g==;
X-CSE-ConnectionGUID: +Aj8BFL6Q0+MTD0DykCsPQ==
X-CSE-MsgGUID: n230Qi9eQ8SNpE1qwSxIRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="87874502"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="87874502"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 06:59:31 -0800
X-CSE-ConnectionGUID: QDiLgdjNQtS/9OeNep0QJg==
X-CSE-MsgGUID: +Mqd9uBtR12hOrroQNIWWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="220438761"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 06:59:31 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 06:59:31 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 06:59:31 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 06:59:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxn1m9UdzfStQPlYRrggehonjpvdGtLFjPyXdHDqy3Ux/Ed7CFFgDW7PrkcE8C5ALEP0CSiAYM3nt1clNsDa/hikwUOhW2F1aKxs3+EzMWy6vQO/dK9D024shgRomJFx5SJU0/HI7SHdZ1/BH5WBnRNfDIwFRq+f/wt/VWHqdA3tNeNKcIurfvX608MliR8/zElRad5OfjOZ6YLf2nfoGGl4dRI5m7gOuNX2CgFrEuw8coOWuPWbXRwSUc0rlBBQbCsm7m0XIoSKJfJSv6CLELjXeJgwMoRJqMUdPBNclMX7hrqBzlUmNua+nqRdrbkJJitrCVqMitnbyhvBCU7Q8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0QueVXVo8b679nLV9dYre40osl2uVK5+tpGcluqtv0=;
 b=yygOCe5bvcEPricYmgMjq/4wnSWXGeucv1sp4tVgPjwE4Nno5CeJCO/oWM336TXffpMxVPDAJwQ0GKvKc7SLxgqnJB6PavaZFxsBn061jfoliogvD5OZJJRamNCiIn1AFXHqZZLVU18jX3RfpFGKSSSbzIcbvkU3iQXF9tLH7Tu3FGf6wwuxlG31PzNVx0Hb+QeO2Qfs9YHqF4FTiRwS87vi8yTJq5mRn57kIJdTTkHtHFs40NtReBr01hfAGSe7X4PfXxA+1B+mxmKC7Bujm/Mq0tB4DB0Xf+kEkm4J5V6PFY3G5vbQFzMfKMum2VYfC96PuwgksNw6uxWGiaTjjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CO1PR11MB5060.namprd11.prod.outlook.com (2603:10b6:303:93::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 14:59:27 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 14:59:27 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <56ffeaef-b0e8-4b7b-b7e1-d3fd9687d7bd@intel.com>
References: <20251029-rename-igt_pipe-dot-enabled-to-valid-v1-1-2aea1e009732@intel.com>
 <56ffeaef-b0e8-4b7b-b7e1-d3fd9687d7bd@intel.com>
Subject: Re: [PATCH] igt_kms: Rename igt_pipe member enabled to valid
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>,
 <igt-dev@lists.freedesktop.org>
Date: Fri, 14 Nov 2025 11:58:59 -0300
Message-ID: <176313233944.3698.2570333446085488402@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CO1PR11MB5060:EE_
X-MS-Office365-Filtering-Correlation-Id: d258a3e9-5d1f-418a-1fca-08de238e6843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1VvN082TUlpb3Irbm5hdUNMN2FuS0ExZWFjR1pvbGlQTzRvUkwyajZGeFYv?=
 =?utf-8?B?aDhkK1IvYUdMSjI3YjN0emVnbzN3aStpbnFPc2VDcGVFOUZqelZEaVlWRUNS?=
 =?utf-8?B?NFlCTHo2dUovRFlTd3FReWc4UUtldVkwVEJwTDZTSDZJK0UzNnlaM3VSYjBq?=
 =?utf-8?B?RkY3WUM5aEtPQ0JHOUQ0enBRcmQ2eFVnblYrQlpWRDVZNVpsK0t2bmNsSWpR?=
 =?utf-8?B?bVM0UVFNUkk1S3ptaU53bis5QTBvUFk1RnNxcWtnSlhkamY1cHNEOHZkTU9T?=
 =?utf-8?B?Rm00QWhMQ0hmUWsxSy9FNmtNdWUzSG9EZVJ5c01RcVIvODYweENDVW1nOGpq?=
 =?utf-8?B?RFVXOUsrNUJZaGM5ZVdHeU96RWlGc2ZLMDVtcGxEcUZKYllXS3RjRUJWT2xX?=
 =?utf-8?B?S0oxaG1GS2FJN1FwSk45VjJFQXJsR2Z4YTN0NGg3WFhmRFlvc2VlQ0VEaG9M?=
 =?utf-8?B?eVhBYkgwQUxROXBWazVNYWp3dHNUY0Rsa0JsSWJEdXl4WFhZY1pMYnJLWFpi?=
 =?utf-8?B?d2JFSlVuMTczUWIyU3NSQ3g4MkJSdzRrWFhobFp4a1lRNDlsRUx3a1FIRXhT?=
 =?utf-8?B?a0dxcURhRmJTUzg3ZzQ2SkNrOXl5MXZRMjJYU1lpMzBpWXZBWk96VFRSTFBF?=
 =?utf-8?B?S1pSMFlLVlFLQllIdkdyTmZWc2ovK0NNQ1NNUXNyamtCZTFQaktPbWNGSTFu?=
 =?utf-8?B?Y0hna1lJRVZaRm5ZNG1DRnBIU080THBmTzNIMjZZZE5tcHdBcFp1NlRUSGZL?=
 =?utf-8?B?NDcxV0FRM1Ntdk9WRGRlcHg5dTZKRjlzanBFTUhML0lNVCtFOXhsbitPSnJQ?=
 =?utf-8?B?YnN5Vkl3a3ZkNWdxdnZMeEJXK2pKTXFUZWZOTUtGRGhZK2RFT2FWaHpIYzl5?=
 =?utf-8?B?TW5ob0RKVVBibmRZejhvbmlKQTZBMHNEVXYveTdUZGhHaVViV21WalFVQTV0?=
 =?utf-8?B?bFd6ME9ySmFIY3kvZm4yTVBrT3lOOFRnN1hKQnhFVVB4aHlpMnIwdWRVK252?=
 =?utf-8?B?VVY3SkVwc0hzR083eGV6TkN2V1F6Qnd0Q0IzdEM4Z01qZzFXUlZSeHlsZktw?=
 =?utf-8?B?Z0JsU3FPNjlCeG04L252RitnazlJT2hEN1JuOFRsYnBJSlpsUDFFeFMrSUox?=
 =?utf-8?B?RWJ0UTh2UW41NjYvNFROeTloWHhpU3BObFFqNXYxTEZrVFdhU2prbjk4amJp?=
 =?utf-8?B?by9hTVRzU0VYWWd6ajJJVDROYXVNa09SYWM0R28wMUZHOGl1UnBXSDVVaTVr?=
 =?utf-8?B?a2xENVN5dDJYd0U5dWZUb21mTzFuREg4UGxibUJlaTFVSjI1TEFudWsyTWhp?=
 =?utf-8?B?TGphZkZSRWZUZ1VNSTJHbW1mR21ESFl5SG16MUFCcnk0U0o4S00yNlZQRzFP?=
 =?utf-8?B?K3ZtSnBvb2JiTGRZL3FCS1JVYUlQWG9MVGR1cWFPTDFRSnpwNi9UczlaNVBu?=
 =?utf-8?B?SzNSMTRqYTRvWHBQaGVQdHE4OW0wSXVjdEhJY0V6VURZTWcrYnZIcGxWRzZm?=
 =?utf-8?B?NzB4bEhnakRKcXN2cWVrRTUzVXE2N3d3cHBaS2xaMTIxL0xUMC8rbEMxWEhy?=
 =?utf-8?B?UXVuVzhvNGgyQUhMTmNySzR5RnBKSW41NzIvbWxib0FjeEZRMnl0dzRKdWI3?=
 =?utf-8?B?aUNYSWN2Y0ZyZmNTZ0lOWUlkU0JTZlp2aVlybDIzdGFsbDJJT1N4eCtlZTc4?=
 =?utf-8?B?MzVJenl6T09OdzhxdDREYWZSOVNhVjFqUWFrMmc3eVg1SDVvM1BMSXBzSHV0?=
 =?utf-8?B?b3hWREZMWjc4WWI0dmpIQnhsemtISkM1Vm5NSTFFZHo1YTFmbEdWRGhZdE1U?=
 =?utf-8?B?bXhkODdOQmp1UEFhdDZqVnNxN0RtNE0wSnJENE04YmRUeHlmeGRrbnQzdjYw?=
 =?utf-8?B?eWd6My9UajRwN0NVa0pyMDI0NHBlelNacVFZdFpBckNUQS9Qc0RFRkgvWkEy?=
 =?utf-8?Q?NyO94x35pMbQ6MdCIUfLI5yWE30LDG+u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkZnVDJJcmZjdm1Da0pKb1VOc0psc0tiaDRibmdDcXNma3kzWlRPbjB6cXhU?=
 =?utf-8?B?VDRIU1lMYXZOdVRtOXgrNHNBalR4aWdBU09Jd2UxaWdGTE1maWNPaStpWDFO?=
 =?utf-8?B?V21pbDluUkpEZFBZYlgwUTdMbnRWMnJiNWlsTDh3ZlFRSElZeHIzS3RRL0VI?=
 =?utf-8?B?amRCRExvdlR6bVE2cjBGdkxZUG9FUmRBN3kwM05wZXdDTkNkbVVkSTFmdTI0?=
 =?utf-8?B?akVsM2w1a25qN1pIejRwcDUrcFdlUUR5R0t1OVArQWwzTlg0c2JtN0pwYW81?=
 =?utf-8?B?ajFTcFlHejJkZGFzenFjUkMvYzJMUmNhVHZrN1J1dVo3Y1RjL0lBZWVwNng3?=
 =?utf-8?B?MEU1WVRwZmhaTnhpT3FRRm4vNFZUMEllUjBBbFluZm1jNi9rYUtLckhUSzhU?=
 =?utf-8?B?cGxyaG9TamowaGNuZ0VuOXd3OFZod3hwVTBOMVp4bG9PeXJ3VFIvM3NNTkR6?=
 =?utf-8?B?bHBSMVNldmMwa2VsM0lrakJHdXNtR3o0RGdwN1NLSkhWQmlQV3RwYTZHVTgw?=
 =?utf-8?B?VkVTSW1MdElSZ3RhbWpwcG1CcytxbW5RTzVQU2RvSnFGZloyblp1QXpUNDlq?=
 =?utf-8?B?bi8xYjlESE5nY0RkWEtTNzRjWTFyaVBKVVNPMW1kR3BwQnF1ZE1qdjE2NXNE?=
 =?utf-8?B?TmxKZnY4bHhYTEh0ZkRuMkxhcWdOUXhqUk50MDQydlBoZUhjdWU0ZDFjMTRP?=
 =?utf-8?B?TDVnVmdhU01ISEZDeGIwam1ZMkwrWHNlZldnY1hIT3hSQmtiMVU4QUoxV1R5?=
 =?utf-8?B?M0hEVU1JbXRYV3FFejFBL0REREVUSmpmaW4zNTU3akV3QTNhN2ZnN29ZMEtJ?=
 =?utf-8?B?ak1GVFlRNzRtUWdlNWJiaUdta3hnbCtpZDRhZlBaR1dYcGRlQzZmMFlHK0xz?=
 =?utf-8?B?QzBUNTJlSS84WGxrOENFVCtyMTAvRnZEaHpIekJMQnFhdUFNRExWZlpQRlFM?=
 =?utf-8?B?Y3ZRcGdMSDA2YmQ5dFRlT3Q4Umw3YXM3T0YyT3dpcm44Tm5IT1Y0QVEwNTRM?=
 =?utf-8?B?SmFJNWZuZDN1OVlZbUFYbFVPK3U0VVBYU0ZGMHllcGdYODkxdytHemY4eGgx?=
 =?utf-8?B?Q0JMT1d4SGl3TldGUkFXRDBwaWowTGlZTkJPVWNXTlF5b00rSlFwdWZJOCtM?=
 =?utf-8?B?cGpjZ2FoSFRFeE9CTjFmcy81cFVQajNKNUczMCt3c3oyWkZoSXZ5UlRYZDRw?=
 =?utf-8?B?VTIxZ2E1S05iUFMyM21YSFNTbGo1TENkL1V5eTl4ZjVxV3lMbksrSW53blQr?=
 =?utf-8?B?RzJpKzFQc1RDUTBJSmZIaTNSZXB0L1c0VlNxZ0xqdldVdWx5c0ttelRIcGF6?=
 =?utf-8?B?ZjFJNmJQbE5maWVENFY0VGE3bFA0a0crY0VWMXFra3VJTW1PakoxY2M2Zzcy?=
 =?utf-8?B?QjBDaUF2YXVPMnFsRWhjQjBEYng4VEkrZEM3bURXdEpiYUhaSDBKTlJ4dGpQ?=
 =?utf-8?B?ekYvVjFZcmcyc01zSkVqQzlCQUxISE9MeWhxNmhNUWZYV3R1OEZRUlZvTWFY?=
 =?utf-8?B?NWRhODBmTFozSUxqd2txdmV6V0JOR3M5MGVEREgrek5wWG84MHRPbnc4T2xZ?=
 =?utf-8?B?aXpZVG9wRUdhWEowRHpMc0pmaTdSbCtDSmgvUWo1NndoNC8wZ2hOQnJDcFhI?=
 =?utf-8?B?ekZaRUpQQ2ZEbDB4RTAxb3lCN3VpOC9qeWxFSmkzd2UyUFBkbEM4VkNxODJo?=
 =?utf-8?B?eWpXeU1ZRGZtbHNwR292MnhDNkJ3MmJBbWpFT2tlaWdCQVBhYjZzSjV6MTRn?=
 =?utf-8?B?TEhDUW0zK2VpQTIrcXdPNzFYakl6c1pNUVVnSFdkd2RXOXExSG9jYThLbkZu?=
 =?utf-8?B?MU4wWnNHeUFoVDZYTUVwMXZVazJtVnp5MUpsYkVQclk5VmU5c0NSTTZJbllm?=
 =?utf-8?B?WHVJRjVRZWUrZU9YUE1hUHRrMVB4Wjk5UGFhbW1aMXd1eTAwVU41TGpZdjUv?=
 =?utf-8?B?WUtDTmZpMmJhQUE4ZTQ1M2NlS21wWjIrNHB1Z05oN1ladVJKVVhVbHdtRzZI?=
 =?utf-8?B?a2NPMmZ0ODJraVNSMjRRRjdFemFvU3M2TXdVZmpKQVlpU21MOVVFQ1BnOElp?=
 =?utf-8?B?Q3RONkxSSDhvNzBScGtKdmw1cFhyc2NWL0Q0c24wSEZJVklTYy9tM3hWR1BS?=
 =?utf-8?B?RlhwdVlwUWNNWWI4UVhETG5ZSE96bklTZ0J1cUhlVnpZbitJc2haN2FHUFBu?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d258a3e9-5d1f-418a-1fca-08de238e6843
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 14:59:27.6040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/YCLKemle6oDmphvmAQvRPtMnr5hO8bNqc7YJVkhQL05nSyVgEEJu3lkN0XeBgEHkekD7qT5W7pd3Wb/CzQ0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5060
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

Quoting Vodapalli, Ravi Kumar (2025-11-12 09:10:27-03:00)
>
>
>On 10/29/2025 8:11 PM, Gustavo Sousa wrote:
>> The boolean member enabled was added to struct igt_pipe by commit
>> b743593074ba ("lib/igt_kms: Add support for display with non-contiguous
>> pipes") to allow having array of pipes in struct igt_display to be
>> indexed by enum pipe.
>>
>> The chosen terminology can be a bit confusing, because one could
>> interpret it as the pipe actively processing pixels.  Let's use "valid"
>> as an alternative name for that member to avoid the confusion.
>>
>> Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
>> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>Reviewed-by: Ravi Kumar V <ravi.kumar.vodapalli@intel.com>

Applied. Thanks for the review!

--
Gustavo Sousa

>
>Regards,
>Ravi Kumar V
>> ---
>>   lib/igt_kms.c                   | 17 ++++++++---------
>>   lib/igt_kms.h                   | 19 +++++++++++++------
>>   tests/intel/gem_eio.c           |  2 +-
>>   tests/intel/kms_joiner_helper.c |  2 +-
>>   tests/kms_cursor_legacy.c       |  2 +-
>>   5 files changed, 24 insertions(+), 18 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 2eaf483d47d2..3b22d60f5942 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -2714,15 +2714,15 @@ static void igt_fill_display_format_mod(igt_disp=
lay_t *display);
>>    * @display: pointer to igt_display_t
>>    * @pipe: pipe which need to check
>>    *
>> - * Skip a (sub-)test if the pipe not enabled.
>> + * Skip a (sub-)test if the pipe not valid.
>>    *
>>    * Should be used everywhere where a test checks pipe and skip
>> - * test when pipe is not enabled.
>> + * test when pipe is not valid.
>>    */
>>   void igt_require_pipe(igt_display_t *display, enum pipe pipe)
>>   {
>> -        igt_skip_on_f(pipe >=3D display->n_pipes || !display->pipes[pip=
e].enabled,
>> -                        "Pipe %s does not exist or not enabled\n",
>> +        igt_skip_on_f(pipe >=3D display->n_pipes || !display->pipes[pip=
e].valid,
>> +                        "Pipe %s does not exist\n",
>>                           kmstest_pipe_name(pipe));
>>   }
>>  =20
>> @@ -2970,8 +2970,7 @@ void igt_display_require(igt_display_t *display, i=
nt drm_fd)
>>                   pipe =3D &display->pipes[pipe_enum];
>>                   pipe->pipe =3D pipe_enum;
>>  =20
>> -                /* pipe is enabled/disabled */
>> -                pipe->enabled =3D true;
>> +                pipe->valid =3D true;
>>                   pipe->crtc_id =3D resources->crtcs[i];
>>                   /* offset of a pipe in crtcs list */
>>                   pipe->crtc_offset =3D i;
>> @@ -3507,7 +3506,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_dis=
play_t *display, igt_output_t
>>  =20
>>           for (i =3D 0; i < display->n_pipes; i++) {
>>                   igt_pipe_t *pipe =3D &display->pipes[i];
>> -                if (pipe->enabled)
>> +                if (pipe->valid)
>>                           full_pipe_mask |=3D (1 << i);
>>           }
>>  =20
>> @@ -6841,7 +6840,7 @@ bool igt_check_bigjoiner_support(igt_display_t *di=
splay)
>>                                   }
>>                           }
>>  =20
>> -                        if (!display->pipes[pipes[i].idx + 1].enabled) =
{
>> +                        if (!display->pipes[pipes[i].idx + 1].valid) {
>>                                   igt_info("Consecutive pipe-%s: Fused-o=
ff, couldn't be used as a Bigjoiner Secondary.\n",
>>                                            kmstest_pipe_name(display->pi=
pes[pipes[i].idx + 1].pipe));
>>                                   return false;
>> @@ -6863,7 +6862,7 @@ bool igt_check_bigjoiner_support(igt_display_t *di=
splay)
>>                                    max_dotclock, pipes[i - 1].force_join=
er ? "Yes" : "No");
>>                           kmstest_dump_mode(pipes[i - 1].mode);
>>  =20
>> -                        if (!display->pipes[pipes[i - 1].idx + 1].enabl=
ed) {
>> +                        if (!display->pipes[pipes[i - 1].idx + 1].valid=
) {
>>                                   igt_info("Consecutive pipe-%s: Fused-o=
ff, couldn't be used as a Bigjoiner Secondary.\n",
>>                                            kmstest_pipe_name(display->pi=
pes[pipes[i - 1].idx + 1].pipe));
>>                                   return false;
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index 7121ab985fd2..52154933b25f 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -455,8 +455,15 @@ struct igt_pipe {
>>           igt_display_t *display;
>>           /* ID of a hardware pipe */
>>           enum pipe pipe;
>> -        /* pipe is enabled or not */
>> -        bool enabled;
>> +
>> +        /*
>> +         * Indicates whether this pipe struct is valid and can be used.=
 This can
>> +         * be false when the pipe is allocated as part of an array inde=
xed by
>> +         * enum pipe, but the respective pipe is not reported by DRM, m=
eaning
>> +         * that the pipe could not exist in the underlying hardware, co=
uld have
>> +         * been fused off, etc.
>> +         */
>> +        bool valid;
>>  =20
>>           int n_planes;
>>           int num_primary_planes;
>> @@ -694,7 +701,7 @@ static inline bool igt_output_is_connected(igt_outpu=
t_t *output)
>>    */
>>   #define for_each_pipe(display, pipe) \
>>           for_each_pipe_static(pipe) \
>> -                for_each_if((display)->pipes[(pipe)].enabled)
>> +                for_each_if((display)->pipes[(pipe)].valid)
>>  =20
>>   /**
>>    * for_each_pipe_with_valid_output:
>> @@ -713,7 +720,7 @@ static inline bool igt_output_is_connected(igt_outpu=
t_t *output)
>>           for (int con__ =3D (pipe) =3D 0; \
>>                assert(igt_can_fail()), (pipe) < igt_display_get_n_pipes(=
(display)) && con__ < (display)->n_outputs; \
>>                con__ =3D (con__ + 1 < (display)->n_outputs) ? con__ + 1 =
: (pipe =3D pipe + 1, 0)) \
>> -                 for_each_if((display)->pipes[pipe].enabled) \
>> +                 for_each_if((display)->pipes[pipe].valid) \
>>                           for_each_if ((((output) =3D &(display)->output=
s[con__]), \
>>                                                   igt_pipe_connector_val=
id((pipe), (output))))
>>  =20
>> @@ -1220,10 +1227,10 @@ uint32_t igt_reduce_format(uint32_t format);
>>    * @display: pointer to igt_display_t
>>    * @pipe: pipe which need to check
>>    *
>> - * Skip a (sub-)test if the pipe not enabled.
>> + * Skip a (sub-)test if the pipe not valid.
>>    *
>>    * Should be used everywhere where a test checks pipe and skip
>> - * test when pipe is not enabled.
>> + * test when pipe is not valid.
>>    */
>>   void igt_require_pipe(igt_display_t *display,
>>                   enum pipe pipe);
>> diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
>> index 9389efb9683b..3544cb1fb3f5 100644
>> --- a/tests/intel/gem_eio.c
>> +++ b/tests/intel/gem_eio.c
>> @@ -1032,7 +1032,7 @@ static void display_helper(igt_display_t *dpy, int=
 *done)
>>                   int pipe;
>>  =20
>>                   pipe =3D rand() % dpy->n_pipes;
>> -                if (!dpy->pipes[pipe].enabled)
>> +                if (!dpy->pipes[pipe].valid)
>>                           continue;
>>                   output =3D igt_get_single_output_for_pipe(dpy, pipe);
>>                   if (!output)
>> diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_he=
lper.c
>> index 17a22d34a3da..d2a3117fec26 100644
>> --- a/tests/intel/kms_joiner_helper.c
>> +++ b/tests/intel/kms_joiner_helper.c
>> @@ -105,7 +105,7 @@ void igt_set_all_master_pipes_for_platform(igt_displ=
ay_t *display, uint32_t *mas
>>  =20
>>           *master_pipes =3D 0;
>>           for (pipe =3D PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
>> -                if (display->pipes[pipe].enabled && display->pipes[pipe=
 + 1].enabled) {
>> +                if (display->pipes[pipe].valid && display->pipes[pipe +=
 1].valid) {
>>                           *master_pipes |=3D BIT(pipe);
>>                           igt_info("Found master pipe %s\n", kmstest_pip=
e_name(pipe));
>>                   }
>> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
>> index ed1c77d5593b..865853c38fac 100644
>> --- a/tests/kms_cursor_legacy.c
>> +++ b/tests/kms_cursor_legacy.c
>> @@ -294,7 +294,7 @@ static void stress(igt_display_t *display,
>>                   }
>>           } else {
>>                   num_crtcs =3D 1;
>> -                if(display->pipes[pipe].enabled) {
>> +                if(display->pipes[pipe].valid) {
>>                           arg.crtc_id =3D crtc_id[0] =3D display->pipes[=
pipe].crtc_id;
>>                           do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSO=
R, &arg);
>>                   }
>>
>> ---
>> base-commit: 7cc368821eaceafddf710879851ffd76f97ecb4e
>> change-id: 20251029-rename-igt_pipe-dot-enabled-to-valid-227274664767
>>
>> Best regards,
>> --
>> Gustavo Sousa <gustavo.sousa@intel.com>
>>
>
