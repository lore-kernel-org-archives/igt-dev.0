Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6F2E7718B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Dec 2024 06:50:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720B110E417;
	Mon, 23 Dec 2024 06:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bJMmu/aR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530BA10E417
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Dec 2024 06:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734936620; x=1766472620;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OrdiG3xrdl2jn0OKLeKqpjn4mJi71i40K/785JMUqeA=;
 b=bJMmu/aRbEBC5CSjrNFzigqy1r/pc6MVszdjENU+oB9WZuFJYjz8uQXW
 uZ1FVJBdcKDMoYlfdHOllpesIG6GTd5lOJEK2dqyfVnrDGHquqDxY+Q28
 9dxFGS7LdgOg8H6KbDSDlFmoYBqh/XKjaLHDHcaZ/NJEgToLYwinpe7s2
 cKKZBXBwFN0V6wZmCSy5lJFL0Nin4b9xKCQMNpRToiFmf2a7Soyc+zBee
 ygi8WzZm9D7bnHNxwaJDQINrK49fWLssLFf1VQD8w6kFppywWg9bcAnI+
 2cKb+y6oCJBpwHTY78NY6OcrbbDdFdQIvwhQbFh94sESDB6LXjhjeb2mj w==;
X-CSE-ConnectionGUID: r85jGJhsSfeoEhEWCRDZDQ==
X-CSE-MsgGUID: seLsVuGzQ2ipMt3Plq86bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="39175686"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; d="scan'208";a="39175686"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2024 22:50:19 -0800
X-CSE-ConnectionGUID: qsGetNabTB2sCw7JNRFeiw==
X-CSE-MsgGUID: 9uv5M6jjTFSfzYG7wkEyMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99980285"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Dec 2024 22:50:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 22 Dec 2024 22:50:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 22 Dec 2024 22:50:18 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 22 Dec 2024 22:50:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXAVAFk9ZDo/2PYwdQuXyGBUtoK2srMPgR2XO5YLQt41MokVKyoHfeLeSofdYfHufj/1OwnREoBqYjKMsmWQ0hDaUH7mOzzGYbUgWG0X7gctXOxGdm+DDVLJCJFeGerIuhyKPmK4p3SO36Oh/BzfkCpSa965WWCxtiD9bXquzxmXZSkkEV+oPjdxTutmFG3PsyCxhHHgMDOTWwq23fzcL7mAv/9vTJnUN9XWyk8mQ4PBnmr+qI7TUpm6rW+4joA7TCJ8DeU6+/g6h5VccEZqLPCobj5nD3PvKPaiPL3nE/sqFmwKaicqQanmYlBPGxHEEb7cREymPXCTwKlGgNIJoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhZCzdhnuNuMlKMRfwfTzxJxxxBiA7n/Iumr0OXDZJs=;
 b=FVpg7yUBvIBiBN+1EczErOCyzsX/WTVCmRooEkh5TDz/cxhfzXrNIQZBjwPRwiRTtttPiS/OvcSkRCwpchn/IyFaMqOfHQhLNs+dSV50xM+d97EdsOoXjByunBRAkF0Ytg+iUXteyT4OOemeaMuu035LTh6PGyb2TxH7i1JvAoeyIHNd0u0x6wKOtxK2pDc7HFCDmH07fKSf6OkWRkpv8UP0aiRGEuzStoM0vi33feXjN4x89kFVm1fwRuxek3Vi6PAEMsU+/tzlrVcjYLtg9QT8xDpUQvqVTcuoKU4ssRWeiJqwg1FK4cq8CThfli5KVmFxsiluVCyreymzLgA9VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM6PR11MB4724.namprd11.prod.outlook.com (2603:10b6:5:2ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Mon, 23 Dec
 2024 06:50:12 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8272.005; Mon, 23 Dec 2024
 06:50:11 +0000
Message-ID: <d8cdb59f-1a68-49ef-9b66-5508527c159f@intel.com>
Date: Mon, 23 Dec 2024 12:20:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_cdclk: Refactor mode setting and CD
 clock verification
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241213060225.2144633-1-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241213060225.2144633-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::20) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DM6PR11MB4724:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b2b9a7-1fcc-4fd4-eaa1-08dd231e0c0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGUwWFFZV0dpdmVvU21SVHBWRllnNXcwZ3RXU3IzTTlqMGVHWDhnaWx1MU1q?=
 =?utf-8?B?UnhUalhKZ0NwWnFYSmVhdDVhM3pNY2tFQmNDN0Uvbzk5OWNDVHFpVTBXTGwy?=
 =?utf-8?B?SU1wSzE1WHU5c2xJTDJwcmRmOVdRaCthSlNibk9PUnBnS3dSYjdqQVg2d1Ay?=
 =?utf-8?B?SlU1M1dOSVE0aXc2Uk5vL2xqUTVLVnJ0T0ZQZFo5ejZkL2lXSWozRVJvRERF?=
 =?utf-8?B?Z2w4ck9yUFZuenVvY25STVVJczI2RGVJYzUzcEJZYnJnL1VtZkJkSlRzNEpB?=
 =?utf-8?B?QXk0VHR5Witaa1FvTGllNnNXVU9DbjBCM1N4RjB6SzR5WWlyN0JRWitodGdV?=
 =?utf-8?B?VUp1ckw3WHNwcXoySGtLd0c3TFB2N01wMTcwc3Brdm9LK0txTE1ybWZSbDV6?=
 =?utf-8?B?Uno3azhRUlN2SnBvL2pPWDhiQkNYRmhSUE92NWRzdVlvRnRjdnBjLzFGM0xR?=
 =?utf-8?B?S0YxWXU3UlVZaXdtWVdsODJ3YkQ2cncrU3lUOUlzd3hDNFhUdVNXc25CWFM1?=
 =?utf-8?B?Mk1nTXl1MEx1VTNldWxLQ0s2TWd1L2lZcGxEN1AyblVvNExJdzhKNkFUN3VD?=
 =?utf-8?B?WWN3dG1IeWpuZjdKV0RVaHZpejFLd0Z0OUJnOUtSZkJsY0drQnNGVXRXTkli?=
 =?utf-8?B?RE9hMkNxbWxsb3Z4UExxRmp1YTdqaURMNDFxV3FoVDFNUmlzUjRIWVltaFl5?=
 =?utf-8?B?a0lBc2hTZi9yanFqZ3dpRTFBdFdSVGQ1Qk5TQ20wbVFqWWc1Tk9PVlV6Z25n?=
 =?utf-8?B?MDJ3bXhUYzBmTWJwNDRObFhQN3REV3pzRTJOaXRkdjRKRThtRnZsQ2JYbVhB?=
 =?utf-8?B?NTZNTllOSXk5V0pTbHpaTVE5NXdyNWZGbExad1Bnd01xenk1Z0VydEhYcUtD?=
 =?utf-8?B?M1dqTDJ5OElkTy9iTXkvY05aNmFkYjltQSt4QmVGMHc4MlVSSHJZQXRqWEx1?=
 =?utf-8?B?WnJ5T2FHamQ5TktSUG9iV01id3paWVlkZG02bVQ2RW1iUGV2bTNvNzA0cFJh?=
 =?utf-8?B?SUNybjlwemErVTBDdjhwcUVPNnRtSlVlUmluRWNUMW95RjEzbXlrRERXcnBR?=
 =?utf-8?B?RStKdmlVVnQ2WFY3cTFiTWFxTm1wdkl2SkpsZ2hhNmdXcDQwbGVLaUs4aytD?=
 =?utf-8?B?Y1k3UVIxU1M0WGFoR2ZrY0wwbFRlWWRBNDl2dENKR21WazhSUUdGTU8xTmRa?=
 =?utf-8?B?VUY0cUdMcG1kVlNZdlc0cWNwenJZeFBOdGE2cXBNcHppNFk0OHJoTmc0bER0?=
 =?utf-8?B?QlllbnFlMmtJRWd6ekFWV1VDU0FnOUNSSDBER3h4eFZER2ljM2ZWWWgrS3NK?=
 =?utf-8?B?TThybFJuMFlOdFN2RnlmNnRWSmhIRU5Cemt3U3A0T0F2WDVGOTlRdmdUN0dn?=
 =?utf-8?B?OGovN25DcW4rVHB1WFJQcTFha3lVb2g4OFZvRVhWcXBKOFZtdUkwVWNyOHBG?=
 =?utf-8?B?dGFrSXVCd1lscnUxMS9MOFpHYXVlbjAzb0gyWXJDWUgvWnZBSXU2U2Z1d2dR?=
 =?utf-8?B?ZDcvN3ZuUHhHRkFsWnlWYTlnTHczdkRFT3grMDdrRDQ2aGhqVjNuZXdvQTV4?=
 =?utf-8?B?SFFwUlBBMzZQazJOeTh6SlA5eEdEeWRld2VLczI1ZUZ1UDZ4N1lKc012RmZE?=
 =?utf-8?B?MDJ5M3AvNkxueEpKTXIwcEw5TjRDQVFPM1FlTExGc04wL09QVkM3d3pXS2d6?=
 =?utf-8?B?OUpXSXk0Z2RmVWNuOHZVaW96ZUFEd01WMEdVMlBjNWhOOTJYK0xiTzNUeDc4?=
 =?utf-8?B?Y2RiM3hFNFNLY21hSUljQVQvb1FSZUt0ZmVRVXNYMTM5NXFkT3plM2VLRlVU?=
 =?utf-8?B?NUc1dnJ6Vm1VK1plaUdyQWduaGpsRHJxclJyZFBGNG1qMy9tNzRmVU5oK0Fi?=
 =?utf-8?Q?G1BDkBCypslkb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czE1Y2xpRFo1UXVOZ2dWZ2FMZTFxcXJ4Uk9GZ2NVY3FFNTVZSHJsRnpwcldK?=
 =?utf-8?B?U05rT0FUczhnKzhVU1JCaXBMbG95VWlydTQycUF0ek80V1JPL1hjVFdaZE1v?=
 =?utf-8?B?MWdwUTVwSlQ3N0lFbGovTzllRTJVUys5cENGQTN6WWI1cWJ1ckpURUVhVVdL?=
 =?utf-8?B?SG5hZzdYQ0ZwRFBtZTNjeEZDb0NHWXZMSDFlcTU4ZkZqL09EbmdNVFd3SVpm?=
 =?utf-8?B?UjFPOXBMSy85UkFwaS9FWHlZaC9ZWm5sWFRGcW0rdHNNcEZUaG90dFlLZDBY?=
 =?utf-8?B?T2pCRUQ4bEw3UHVQb1Bzd1dXOHJjbDYrRXpnMlA4ZHRPVlpZNzZEeTV5c0NI?=
 =?utf-8?B?YUpzc3V4amwzaU1kMmVhS2g4enJmZTBkU2hSc0U4cEtQbjRYOGhUYzBqNkJy?=
 =?utf-8?B?d01KYk8yQ0lIZzk4R1lXTkRJWUgyWmdvZ3VVZVAzMnhDM3JsZlc1MHNxVUlV?=
 =?utf-8?B?dUtUS0lRdExoRjlaVk5xMEFuWXhHT0k2ZUt5NnlxRHBZdUVnSjVTT0E2T3g3?=
 =?utf-8?B?QW5PZUlXZkRMdGNZbWNoVjBWcjMwNmlDSncwOE9qcUp1ckpRYzBYaERNNzZu?=
 =?utf-8?B?d3pYOGt0RGRVYkpqUlJkUmIvUjMvZUVlSi93ek4zMzVpZHhIKyszMWpYL2Na?=
 =?utf-8?B?dUZORmhWQUlnV1R4NW9nbGV0RnlMK0RlVWl4a00rTnNmcm5YQWx6MVRwU1Rv?=
 =?utf-8?B?QlhVMG0yNldrcHBQbXVDSktocHZiNU00SE5SUE1zUmpJUERwZld2RSt2SUJV?=
 =?utf-8?B?ZTIvWStTdktKS3U2QVpKc1k0V2I1ZWJYbk5qdEFydUlYUGtoQm1CQnZlS0U1?=
 =?utf-8?B?STBDKzFJV0pDS2x3THNIclFwQ1FzUmRHMWtycHo0NU9RcEhZeGFXL2o4L3Uv?=
 =?utf-8?B?Qk1iUGtkakRRbWVSUzM2V0FKRitNUXFNMEcrMVkzSkR1Ri9lNGZyR1ljbzFT?=
 =?utf-8?B?RWV0OGVjbFROWlRzZ0Y5QWtuZGhSeDh6SFlQaEtoK2huUUJlSGdzSThUYmlD?=
 =?utf-8?B?MDRxaUY5QzArSHBHR21NcHhWb3c2UlpHb0kvV0dsVmNxaTNQTjFMMVNZODlM?=
 =?utf-8?B?Y25iNjgzZFFaak00YVJNMlBRSkRKMGNuQWtHMWRPWjRLeVJYVDBxL042cUJh?=
 =?utf-8?B?VXQ1VUthN3pQVDlwSDdTaE1SY2ZMN0M0WTU4QnNqTEZtUXBwTFZaRDNYdFhi?=
 =?utf-8?B?UmM0dlA1U1lqSlhpaFlpSGJIbGNud2xlUWk1NFF2YitPaEt1WHcxYUVUVWZ3?=
 =?utf-8?B?UUR0TEVDZ2Z2K3VOOXhZejZ1TmtaVzNDSFVvVkVkc2wzdkVreVh1K0pVTWh2?=
 =?utf-8?B?c2xtWW0rQ1djYjNLcDZoQS9MdWZqVVpWYkVjSTVvS3htdi82akJhK0Y0b3Z6?=
 =?utf-8?B?b0Z0K21PZnp1UGJaUlgwQWdQb3JTT1gvZGlIdjhFRnNwdG1ZL0RrME9TeUth?=
 =?utf-8?B?SWc3TkhmWTRzNXZpZlpMVExrT2lNWGpEaHh5VEgwcktYN3FYY1VHa242VGZO?=
 =?utf-8?B?Y21icjhTVWU4bTRCM1B2Vlp4MzJmYndGZkhjSlhHa0o4QTVtYVhEd3VrQXli?=
 =?utf-8?B?SnAzTzJBWkdXekp2RUU0ajRZTUQrSkpTZ2h0MGZBai9MRkJvdENieG1hZzJz?=
 =?utf-8?B?R1BWQTJob2FUbUcvaVRSYzVFNVBHYzhDVDZNbmV6QzZKcEVGVy92cSt0aXU1?=
 =?utf-8?B?WUx3TTNLcDBNSlpIRER0MWxKcVJYMzdKS1EwUGxkRldzUUNnbFFUd1ZKb084?=
 =?utf-8?B?S2xrdTRVbTdrUTMyUWYxbVJRSERRUEdjODk1Uit0Q2lBZWlzRUEyc3R3ZlZV?=
 =?utf-8?B?VUtudHkyREFSY3NqT2JHOTNXbGF0ZWh5aTVrMWx6cE8xZEpsc0drSHdlRGdK?=
 =?utf-8?B?VmdwbkkrUnF1RlQxVXlLVUpjUmlkbmRNQ0loVllqNjlqbFhsaFhkV2tEU2JU?=
 =?utf-8?B?NllzZDdEczlRcVArNFp2blIwVkxzTlVSRXZPVEsxcTMyN2ZOcndua0t4bWF4?=
 =?utf-8?B?UjhJaGV0blNVbkI1Ym11dWd6aThjZ0ZxWmFiQmpJc21Xb1haZEFlSGwwdUNs?=
 =?utf-8?B?ZFpPWVczMEFPakdxMU1yMkl5ZkVwUFc0KzJhbGxyQXE2RjlLcEl0SVo3N084?=
 =?utf-8?B?OTU1TXg1T2Q2VE8vVVhuR0FOL3Z3Qk5ReCtUK09SSGk1Y1ArZVBHUDU1OGV4?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b2b9a7-1fcc-4fd4-eaa1-08dd231e0c0b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 06:50:11.8271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qde7n1GTBuGzmlDUJdomfDiLXnTTkW28bg4AWjp6QG9pSKCYtdKHuTYJnXgXrHdseBv+9sVnN4dgcw1omaRKOdAZx+1KEM4gFz/QpZXev4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4724
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


On 12/13/2024 11:32 AM, Swati Sharma wrote:
> Add conditions to filter valid outputs. Encapsulate the
> mode-setting functionality in the set_mode function to reduce
> redundancy. Remove redundant framebuffer and size setting
> operations for the plane. Simplify the CD clock frequency
> checks to ensure it increases after the mode transition. Clean
> up unnecessary plane operations and redundant framebuffer
> handling. Enhance the readability and modularity of the mode
> transition logic to handle multiple outputs more effectively.

This patch is doing more things along with refactoring like skipping if 
there is only one mode, and checking if there are minimum 2 displays.

So lets refactor be one patch, with no functional change.

Then add other enhancements etc.


>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_cdclk.c | 112 +++++++++++++++++++---------------------
>   1 file changed, 54 insertions(+), 58 deletions(-)
>
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index 382b3e9d1..93276f45e 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -54,6 +54,7 @@ IGT_TEST_DESCRIPTION("Test cdclk features : crawling and squashing");
>   #define VDISPLAY_4K	2160
>   #define VREFRESH	60
>   #define MAX_CDCLK_4K	307200
> +#define MIN_DISPLAYS	2
>   
>   /* Test flags */
>   enum {
> @@ -269,90 +270,86 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
>   	igt_remove_fb(display->drm_fd, &fb);
>   }
>   
> +
> +static void set_mode(data_t *data, drmModeModeInfo *mode, int count,
> +		     struct igt_fb fb, igt_output_t **valid_outputs)

let count be after data, as this is count of modes and valid outputs. 
Perhaps a better order will be:

set_mode(data_t *data, int count, drmModeModeInfo *mode, igt_output_t **valid_outputs, struct igt_fb fb)

> +{
> +	igt_display_t *display = &data->display;
> +	igt_pipe_t *pipe;
> +	igt_plane_t *plane;
> +
> +	for (int k = 0; k < count; k++) {

lets use i for iterator.


> +		pipe = &display->pipes[k];
> +		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +		igt_output_override_mode(valid_outputs[k], &mode[k]);
> +
> +		igt_plane_set_fb(plane, &fb);
> +		igt_fb_set_size(&fb, plane, mode[k].hdisplay, mode[k].vdisplay);
> +		igt_plane_set_size(plane, mode[k].hdisplay, mode[k].vdisplay);
> +	}
> +}
> +
>   static void test_mode_transition_on_all_outputs(data_t *data)
>   {
>   	igt_display_t *display = &data->display;
>   	int debugfs_fd = data->debugfs_fd;
> -	drmModeModeInfo *mode, *mode_hi, *mode_lo;
> +	drmModeModeInfo *mode, mode_hi[IGT_MAX_PIPES] = {0}, mode_lo[IGT_MAX_PIPES] = {0};
> +	igt_output_t *valid_outputs[IGT_MAX_PIPES] = {NULL};
>   	igt_output_t *output;
> -	int valid_outputs = 0;
> +	int count = 0;
>   	int cdclk_ref, cdclk_new;
>   	uint16_t width = 0, height = 0;
>   	struct igt_fb fb;
> -	igt_pipe_t *pipe;
> -	igt_plane_t *plane;
> -	int i = 0, j = 0;
>   
>   	do_cleanup_display(display);
>   	igt_display_reset(display);
>   
> -	for_each_connected_output(&data->display, output)
> -		valid_outputs++;
> -
> -	i = 0;
>   	for_each_connected_output(display, output) {
> -		mode = igt_output_get_mode(output);
> -		igt_assert(mode);
> +		const drmModeModeInfo *highres_mode;
> +		const drmModeModeInfo *lowres_mode;
>   
> -		width = max(width, mode->hdisplay);
> -		height = max(height, mode->vdisplay);
> +		highres_mode = get_highres_mode(output);
> +		igt_require(highres_mode != NULL);
> +		mode_hi[count] = *highres_mode;
>   
> -		mode_hi = get_highres_mode(output);
> -		igt_require(mode_hi != NULL);
> +		lowres_mode = get_lowres_mode(output);
> +		mode_lo[count] = *lowres_mode;

I think it will be better to set the mode_hi and mode_lo later after we 
set valid_output.

If both are equal we are overwriting mode_hi and mode_lo.


>   
> -		igt_output_set_pipe(output, i);
> -		igt_output_override_mode(output, mode_hi);
> -		i++;
> -	}
> -	igt_require(intel_pipe_output_combo_valid(display));
> -	igt_display_reset(display);
> +		if (mode_hi[count].hdisplay == mode_lo[count].hdisplay &&
> +		    mode_hi[count].vdisplay == mode_lo[count].vdisplay) {
In line with above comment, use highres_mode and lowres_mode to compare.
> +			igt_debug("Highest and lowest mode resolutions are same; no transition\n");
> +			continue;
> +		}
>   
> -	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> -			      DRM_FORMAT_MOD_LINEAR, &fb);
> -	i = 0;
> -	for_each_connected_output(display, output) {
> -		pipe = &display->pipes[i];
> -		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +		valid_outputs[count++] = output;
> +	}
>   
> -		mode = NULL;
> +	igt_skip_on_f(count < MIN_DISPLAYS,
> +		      "Number of valid outputs (%d) must be greater than or equal to the "
> +		      "minimum required displays (%d)\n", count, MIN_DISPLAYS);

I think what we mean here is that the count should be more than 1, 
meaning there should be more than 1 output.

We dont need to have a macro MIN_DISPLAYS as count >= 1 is self explanatory.

Regards,

Ankit

>   
> -		igt_output_set_pipe(output, i);
> -		mode = igt_output_get_mode(output);
> +	for (int i = 0; i < count; i++) {
> +		mode = igt_output_get_mode(valid_outputs[i]);
>   		igt_assert(mode);
>   
> -		mode_lo = get_lowres_mode(output);
> +		width = max(width, mode->hdisplay);
> +		height = max(height, mode->vdisplay);
>   
> -		igt_output_override_mode(output, mode_lo);
> -		igt_plane_set_fb(plane, &fb);
> -		igt_fb_set_size(&fb, plane, mode_lo->hdisplay, mode_lo->vdisplay);
> -		igt_plane_set_size(plane, mode_lo->hdisplay, mode_lo->vdisplay);
> -		i++;
> +		igt_output_set_pipe(valid_outputs[i], i);
> +		igt_output_override_mode(valid_outputs[i], &mode_hi[i]);
>   	}
>   
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> -	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
> -
> -	j = 0;
> -	for_each_connected_output(display, output) {
> -		pipe = &display->pipes[j];
> -		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> -
> -		mode = NULL;
> -
> -		igt_output_set_pipe(output, j);
> -		mode = igt_output_get_mode(output);
> -		igt_assert(mode);
> +	igt_require(intel_pipe_output_combo_valid(display));
>   
> -		mode_hi = get_highres_mode(output);
> -		igt_require(mode_hi != NULL);
> +	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> +			      DRM_FORMAT_MOD_LINEAR, &fb);
>   
> -		igt_output_override_mode(output, mode_hi);
> -		igt_plane_set_fb(plane, &fb);
> -		igt_fb_set_size(&fb, plane, mode_hi->hdisplay, mode_hi->vdisplay);
> -		igt_plane_set_size(plane, mode_hi->hdisplay, mode_hi->vdisplay);
> -		j++;
> -	}
> +	set_mode(data, mode_lo, count, fb, valid_outputs);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
>   
> +	set_mode(data, mode_hi, count, fb, valid_outputs);
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   	cdclk_new = get_current_cdclk_freq(debugfs_fd);
>   	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
> @@ -360,7 +357,6 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   	/* cdclk should bump */
>   	igt_assert_lt(cdclk_ref, cdclk_new);
>   
> -	igt_plane_set_fb(plane, NULL);
>   	do_cleanup_display(display);
>   	igt_remove_fb(data->drm_fd, &fb);
>   }
