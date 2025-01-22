Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCD5C02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 12:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7ED10E39E;
	Wed, 22 Jan 2025 12:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktL/rO90";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2357510E39E
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 12:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737550317; x=1769086317;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=G1T/GM946KzWGYm8CE89OBvZBsLkuEIe8xgaHPvIOqU=;
 b=ktL/rO90cDpmsTiHKGthCTOLA+6crMsG0+p21Dn5qBjsKFZgZhtHaH5r
 X1It0YF7hAKbKvMYCvmrWbBiDAESTdXsO4F7HF9PDGpiGp6acbyLIwEA6
 u7hauslbJzDGUh4MQzLzu1vZRnZRkkpMB1LUqjReLrfsdBzdjzek0kH7/
 OOCJlQrSkI8V4xkhnW9KBJxryqcv6i/xMavYJ2CCpj39JHFYRQdh+izu9
 nDNGk4uz4y69hKnAaYVKJAaMjkBTn4OnmtM0cAfZ9Nyz42OOf4stvTI7Q
 lltvPvGTGTSAj4s2XkOCeUZm3JuZ30nQxo6aDU1crFUQRB1APMs3hez2R w==;
X-CSE-ConnectionGUID: 8l9qveqlSXmCjrxWrM31DA==
X-CSE-MsgGUID: TqtlX7QnSumdn9aiUV3cvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49416401"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="49416401"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 04:51:51 -0800
X-CSE-ConnectionGUID: 9fmt3PWtT32gOK64rMyGeQ==
X-CSE-MsgGUID: Rv3KBKlLS7eL5S2VPrOlcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="112163949"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 04:51:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 04:51:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 04:51:49 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 04:51:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iY2qt7/cj4cmoUqYj2iMzB3bJz6PlG3GjezsArO5+TZ328SkF9DQ8e5If8MY0OW2hPXNf3bzpKVJ8TAHNsW5ASA44+3DEt80wdt8fD41f4XV+pyqo4GPEG1FRp6MpzzI/fB3zYgmZ1pWs9dVO6Aiqm8us76Re3OFiQCYmmvdeJMf/Mhp7GFRQa2myK9+iXLlEjroEDv2Pg2QG7XmakIJZsU/omGlb7cdSzGHPS/AI4DEUR3qVmTnu8Birg8OZC4BxoJb/ScHRjaQhPNSmna6JrQIItoCu8ISxcyHNF14yJMidHbVMShVaQ6BVIFUcgdzU1asRo9tMd9GtnZrzSUfzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WauVZ2dljvBrzITPzMm7qQCimUdSxY1qVsNUueYtqW8=;
 b=QwVd+JC/sbSN1vWJ/zvUuUJpmKF0Rn69Y2IOlCbAsNkocOCfJZecf/kZ0MKux2kD62d/PiTXucaZmUe9FfDPzSzHVgmqIa5DbkwXommdeMOY+bo35Srtb1lIdn4wuiR0fcobyq4SHRIdu8GUHoBHVU09XwhWUM3nv/+svgqnKTY0ZcbL1v2w7Y/w9wJlJ24PJ0THlbabSsWbmrf4484LFtgQk7t1ovka7RnubUWVOxSgYPr551mHKBvt1wKU64bl4YzfdhNhd1tYO0940u8imTllW/UP2dtpVJcDuCplkGhnJWWl1uDOvqAWf5E7cx3Bsp6FXny77YJUcNA1N2DJ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by BY1PR11MB8056.namprd11.prod.outlook.com (2603:10b6:a03:533::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 12:51:47 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 12:51:47 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250121225733.808978-8-lucas.demarchi@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-8-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 7/7] runner/resultgen: Add cmdline to results.json
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 22 Jan 2025 09:51:42 -0300
Message-ID: <173755030291.5500.6239544066129101929@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:303:2b::11) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|BY1PR11MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: b7100e40-6607-4260-6529-08dd3ae38800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDZrbXcrSGM0WkgySUZmazVabW9XTWpuRWorbzJMb2lxQ1B5cDJZMVZXeDhu?=
 =?utf-8?B?d0NKWHZDY0ZRVDB6OUV0TXJJQ2FFdlRLTFdZd2g2bWY2cDh2ZDFhNmpNL3VI?=
 =?utf-8?B?S0FMMThtK3lwT1lZZnFkbFplejJhV1dUelVzaElEMHhNaGdmcTRvRnllY0hF?=
 =?utf-8?B?ZFMvWW1xZ0w4cU5wS1RjSndRdjBtRC9obFF2ZldmL0FzNHhRQVVNQzlOV3hh?=
 =?utf-8?B?eUJXZnF4WUQwSlhoYm9hWmZlMk5oRmVBVk5TMlVjQ2duRkJGUWJOUFp5ZElE?=
 =?utf-8?B?WGZpYXhSOHZ4NFRoTFBDVHIxRkhTVDVHaGV2ZGs2WmdRSXVBMEpuZithcnY1?=
 =?utf-8?B?TFo3MDR1bzQvazk3eW9CbVk1K2x2eXRmZzBQNFhEdFRCMXlhM2VOZ3pGU21t?=
 =?utf-8?B?ckhQcFpWd2VQL0w4SEk1WDM2YzFJOXljUWpMaEJnMW94bEx4NHBHVHFSZUtN?=
 =?utf-8?B?WDZhWEFQWVRzYXZpNnZDVnU1VEhTL2E5OUJ6MStBT3l1NzVEMnZva0F1cjYr?=
 =?utf-8?B?MWdESDFtcy81NFpOcnJRTEU5Ymdyc2RnUlFYZ05KZmJraHF4amdXNW9ZTXkv?=
 =?utf-8?B?NDZQZ2hJTUUzdjQ0eTdrSUJNK2Ivb1VCTXJQU1AvcnVtVTc2ckhpcUdzeUIz?=
 =?utf-8?B?Y0xjaVVWQXZ1V2RlWkF0dTR6NUVoUWt0Q3VNemdjMFNIZXpzVThhRnRvNFdh?=
 =?utf-8?B?c2JJMmJEVUJmbDlvc2VOUG43Q1gwcG1USjlnNXVhZVlpOUNaNzFGZk5HMy90?=
 =?utf-8?B?clJoZ0RuenQvRkRkNDQ1bE1iQjBnd3Rucm0zbGpkMDc2T1ZHdWZkdkwyVXZJ?=
 =?utf-8?B?M05pb2tGaXVMV2wzc1NjTUxwNG85eXdveU82aFBDQllnTEhkbWVnVW5TSXAy?=
 =?utf-8?B?NzRMbkQvaFJlSXlYKzN0VGJ1MkJUZUtDcXFWaXVid1Fsek4rVEJsU2ZIUU0z?=
 =?utf-8?B?NEZRYjFEcWFWV2JmRFZyUWttOWowRXNYc2JhRU5Pa3FZNzVmRHk1QzhReHl1?=
 =?utf-8?B?eVFOamNlbUZNN2dqRG1VUjVGM2ZSWGJMVXgvUnJiYk93dm5ReTdYOTQzckYz?=
 =?utf-8?B?di92VkpkU0ZGNFNSMFVzUExWUjZUNFk4RW5wdHZsWVJERzZOQWZCNkFQZXcy?=
 =?utf-8?B?cDdIN2s3cFFabVFmbzhaZTN2RVczdEVCc1BlYzdqMTIxOENLZkhSaC9RMzVk?=
 =?utf-8?B?U1Jwc2pUNUtybE5PdUxhcnNEeEprdFdVOE9IWDdCWVh2SFE5aC9EQ3lBTCts?=
 =?utf-8?B?MFNoQmVFb2lzRG9PdjBvT1RzU29obm9lTUlNMkpBMnZXc0JJT1A5NllaQWlo?=
 =?utf-8?B?NXFYaEpKb05YQTFsZ1ZmK2k0TXd2RndmOGcwWHdIWmluUFFxNFJqaTNlK1c4?=
 =?utf-8?B?c2xRUFh1bXRibmgrM2JIbWtvTnRzYW9zUzdMSWo0dzhLdjNHbkVFQnNadnQ0?=
 =?utf-8?B?QlVUR2NRdnJJTTZTSU5lME1jZVNwWHRhMTlsemx5MUNnSjlwdkFYRjFXWWJW?=
 =?utf-8?B?L1A3cEcraEw4NTlJU2RiZExTb1ZjVVE4QVRPa1Y3SjdocUhxMEtUZ0NqK2Jw?=
 =?utf-8?B?VnRsMHZmcXdzNVZSd1JRaGxwdVhick1sMFAwOVY3YVZVY3puVU1NVnc2M29I?=
 =?utf-8?B?TDJDZ1pKS2NWbnordmt5LzArZG9PVndQWkFJcGx0dVhnd09XaHcvY0pNMlZV?=
 =?utf-8?B?TXBnR3ZHNW8zTUhuYnFKYWtGOXBmN1pZMCtnUE5EUy9GUUdZa3pTVmEySGVI?=
 =?utf-8?B?OWdvWUFZdUVtc3BiUFZQYjArK2ZraDFVcXVXRTlhRWszNEhVMXQzc2JiZEJw?=
 =?utf-8?B?TGg4MlZzR0FsYVo5OURuWEFYSUlJNUxkRElXcDkzbHlSb05DMThvcFlHZ2wz?=
 =?utf-8?Q?6rK0RGanDGLHW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVBENEROOGJsbzJlRStkckNDWk9qcndWQUpLb0dYWWJDbzJXY3VybTdLamor?=
 =?utf-8?B?K1NUbDhFR2JOUDhsYTZzMmtrQ2JqTENGZUJBV25CY28rUUJxb3VBMHZHL3Vw?=
 =?utf-8?B?YWxCb1l0REJnU3ZRRkx5aGhGMERJS1Z0MW54S1g5em1haVQ5RzZoWHBIdHJU?=
 =?utf-8?B?eGZvS3gwY040cmx0RVV1VUlpZ1RZc01TOE8yQThkMnBLUEc4a3R6L1FKWDN4?=
 =?utf-8?B?Z3MrTWlxcm51aS9FNmpkYWhWTjJUSkFPN01YejgrRU1pT2U4R0p3bUZ5dnlW?=
 =?utf-8?B?STZnQkVRNmgvR0h5cE8wSzZtd1BpMmhnL05QNjhMN0xHYlVPQjJ1cjMvaWUw?=
 =?utf-8?B?eERsRkljWmFqSHQ0SUFOdE1DTUQxN0dFL2ZaZTRVZWV4M01sR1lzc1ZDZklG?=
 =?utf-8?B?OHErcGFkSE51OS9KWUtnTkZhL0Q2MnhhcFdmY3B4cVZKSnZiMDd2WG9ZaERu?=
 =?utf-8?B?S3BMbG9VMFlmZHV2Y3hOeHdlYXFPdGRnZDZ3ZTR3dmIrWGtoWkhEN3JtMGQr?=
 =?utf-8?B?NnZQdjEzVGNkaFZvaDdsUjdEQTh5TERKc1RJeUg1Y3RHWVk5V0R5SmhLMEs1?=
 =?utf-8?B?M2JjUkFKQURhYzlMWlBZdTVyZytRR2htRitaRjVwb2dWYzRHZkFVRnA3UWI3?=
 =?utf-8?B?Zi9CZjltSXZNU2ZEdFRyU1FWd3YvSlZaTFg5eW1OSktxcjVOenBMSWsvMWhC?=
 =?utf-8?B?SlZKL3VhVHk0by9vdHdPNnhSc2ZVKzdOV3RpRFBBMDdWWW1PN3JoUXcxZ3lQ?=
 =?utf-8?B?VzFQVDhwdDloWWRlcjRNT1lYMXNoQUdTbWhtamNXTEJmWVVhZ1Ayb0YvY25i?=
 =?utf-8?B?UUpOVmRBVDZEK1RSL05yL3pyQ3M5SHlwNmpyRnphdEpXQVN1ZVNoWllvM3V1?=
 =?utf-8?B?ZHVqdm1PTldJbXg2OVdSd0o1Y0NpWDYvdDdKQjc0UkVOK2ZhNzRpa0cyYjdB?=
 =?utf-8?B?NGovSTQ4SlNpNi90THMyblhSRnlCZlpxZ29tNFVTQTZ5MzFCdWQweHFGdStu?=
 =?utf-8?B?eUxKa1J2emJ3UTBhVExjU04vQVVGMnpFRnovZXoxbHd5b3poUHhTOFFnYytF?=
 =?utf-8?B?OUFlS21aUEh3VTZTT2ZQa2xDRTh6T2I2dkJRMXpqYmg2MVdIUXl1QjJQSk9P?=
 =?utf-8?B?WStFUGJKN1pTbUNQdVRhZlhOc21JREl6TzNiOW1KaHlxeERiRFJkZ0VDcG9Z?=
 =?utf-8?B?c05KSExWS0h6SkdteFhqemxvNWx3N1JORm04VFkwUzFsZjJVcFlGREJZVzdD?=
 =?utf-8?B?MGZZNTl5Qmk2NjBjbUs3LzNFd0tEaHoyUjdWQTdTNE9JNG4vUXVuYmJHVmZL?=
 =?utf-8?B?Z2x4TjNvYmxXejE5YmE2eDFPQTdBQnd0bnVOS3Bwakx2RWY4di85MjNmR2Z2?=
 =?utf-8?B?WGhMc1dOSHljek5jRlBjTUpQOHpnNzV3Qm5EN3hlN2I0VmwzZjRwY3BMeW1Q?=
 =?utf-8?B?ODMyZGdkYmpSZEFQeW1Qdkt2Nm44YUdSZW84VWUrRXFIUjBWeUh0Ri9uWFFa?=
 =?utf-8?B?Qk00dFdlcnQrbTNoZFc0UDNzdHZDcW13aWlTVHI0Q2NLRFhZVHFUMEQyVEpk?=
 =?utf-8?B?a1ZGZzhFczFwdGx2TklJckhWZ1BMRHJWN0ppOXdra0ZQQTNCbHhmUmJWTTh6?=
 =?utf-8?B?SUptd0RQSWNjenJNQ2trSWQwZC9aNXNER1hEeVRZdmc1K1BZenl1dTA3LzhC?=
 =?utf-8?B?WEFSWHZSbzQ3Ui9ySWhiZ0ZncGxWZmgzWkhCRGZ3bkM1TGJvUUE4WisyWU40?=
 =?utf-8?B?RVlxV3Y4eWI2UzIxckYwQ3dOTSszeTAyNll4SU16UW1NODlwQTFjc3pXdUgw?=
 =?utf-8?B?K0NpTkhaUm11akhDZE85VGs2MW5KYjNWZ1pPcy9YOUcvWk5tSGVLc0lBR3lo?=
 =?utf-8?B?RklUaVVMKy85bHVPeXdMdHcxczlLTnRJQXRUTFVIS0ZrNDdta2p0ZjFHK0lD?=
 =?utf-8?B?OGlSeWZwaDNxWDJRY0dEUGNPR2NGRzNQQk56WHU3WFRvWm1BS2JRRWFXT0pF?=
 =?utf-8?B?VmZlT3hiSndIUjk4SzJ1eXE5VEVzTHVWMU5BZTJXVFQ1ZW8xYnRrNWtweUdG?=
 =?utf-8?B?eFAyQ1dGM0Q0WFliekFvZXJUTys0ODN6MTBGNnRlY2trdW1FSDhzYjI4Z09M?=
 =?utf-8?B?MUU0RGNPUUtDdUNlOFJGcGIwOTg5OVlPUnNRNExnaXhnc3ZpUTZRTmswVzJ5?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7100e40-6607-4260-6529-08dd3ae38800
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 12:51:47.2241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfEm82WO0FDjW2/X6FfJ1NiosIab/LXxf0Pryht6n+we7KL4mLcU+IFNn9fVq2VbG8xgasvDu9WaefiBVqTRtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8056
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

Quoting Lucas De Marchi (2025-01-21 19:57:33-03:00)
>For easier repro scenarios, add the cmdline to the json: one can see the
>exact command executed to try to reproduce a CI failure without needing
>extra files.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> runner/json_tests_data/aborted-after-a-test/reference.json | 1 +
> runner/json_tests_data/aborted-on-boot/reference.json      | 1 +
> runner/json_tests_data/dmesg-escapes/reference.json        | 1 +
> runner/json_tests_data/dmesg-results/reference.json        | 1 +
> .../dmesg-warn-level-one-piglit-style/reference.json       | 1 +
> .../dmesg-warn-level-piglit-style/reference.json           | 1 +
> runner/json_tests_data/dmesg-warn-level/reference.json     | 1 +
> .../reference.json                                         | 1 +
> .../dynamic-subtests-keep-all/reference.json               | 3 ++-
> .../dynamic-subtests-keep-dynamic/reference.json           | 1 +
> .../dynamic-subtests-keep-requested/reference.json         | 3 ++-
> .../dynamic-subtests-keep-subtests/reference.json          | 3 ++-
> runner/json_tests_data/empty-result-files/reference.json   | 1 +
> runner/json_tests_data/graceful-notrun/reference.json      | 1 +
> .../incomplete-before-any-subtests/reference.json          | 1 +
> runner/json_tests_data/normal-run/reference.json           | 1 +
> .../notrun-results-multiple-mode/reference.json            | 1 +
> runner/json_tests_data/notrun-results/reference.json       | 1 +
> runner/json_tests_data/piglit-style-dmesg/reference.json   | 1 +
> .../json_tests_data/unprintable-characters/reference.json  | 1 +
> .../warnings-with-dmesg-warns/reference.json               | 1 +
> runner/json_tests_data/warnings/reference.json             | 1 +
> runner/resultgen.c                                         | 7 ++++++-
> 23 files changed, 31 insertions(+), 4 deletions(-)
>
>diff --git a/runner/json_tests_data/aborted-after-a-test/reference.json b/=
runner/json_tests_data/aborted-after-a-test/reference.json
>index 0776f7582..50ba9e6e1 100644
>--- a/runner/json_tests_data/aborted-after-a-test/reference.json
>+++ b/runner/json_tests_data/aborted-after-a-test/reference.json
>@@ -3,6 +3,7 @@
>   "results_version":10,
>   "name":"normal-run",
>   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-=
06) x86_64",
>+  "cmdline":[],
>   "time_elapsed":{
>     "__type__":"TimeAttribute",
>     "start":1539953735.1110389,
>diff --git a/runner/json_tests_data/aborted-on-boot/reference.json b/runne=
r/json_tests_data/aborted-on-boot/reference.json
>index 75f194660..238ec6fff 100644
>--- a/runner/json_tests_data/aborted-on-boot/reference.json
>+++ b/runner/json_tests_data/aborted-on-boot/reference.json
>@@ -3,6 +3,7 @@
>   "results_version":10,
>   "name":"normal-run",
>   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-=
06) x86_64",
>+  "cmdline":[],
>   "time_elapsed":{
>     "__type__":"TimeAttribute",
>     "start":1539953735.1110389,
>diff --git a/runner/json_tests_data/dmesg-escapes/reference.json b/runner/=
json_tests_data/dmesg-escapes/reference.json
>index 91c573106..e74dc89e4 100644
>--- a/runner/json_tests_data/dmesg-escapes/reference.json
>+++ b/runner/json_tests_data/dmesg-escapes/reference.json
>@@ -3,6 +3,7 @@
>   "results_version":10,
>   "name":"normal-run",
>   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-=
06) x86_64",
>+  "cmdline":[],
>   "time_elapsed":{
>     "__type__":"TimeAttribute",
>     "start":1539953735.1110389,
>diff --git a/runner/json_tests_data/dmesg-results/reference.json b/runner/=
json_tests_data/dmesg-results/reference.json
>index e9e011853..81890f7d2 100644
>--- a/runner/json_tests_data/dmesg-results/reference.json
>+++ b/runner/json_tests_data/dmesg-results/reference.json
>@@ -3,6 +3,7 @@
>   "results_version":10,
>   "name":"normal-run",
>   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-=
06) x86_64",
>+  "cmdline":[],
>   "time_elapsed":{
>     "__type__":"TimeAttribute",
>     "start":1539953735.1110389,
>diff --git a/runner/json_tests_data/dmesg-warn-level-one-piglit-style/refe=
rence.json b/runner/json_tests_data/dmesg-warn-level-one-piglit-style/refer=
ence.json
>index 8d266cdfa..16c97d3a1 100644
>--- a/runner/json_tests_data/dmesg-warn-level-one-piglit-style/reference.j=
son
>+++ b/runner/json_tests_data/dmesg-warn-level-one-piglit-style/reference.j=
son
>@@ -3,6 +3,7 @@
>   "results_version":10,

Hm... Are we going to continue with 10 as the version after including
another field? Are there guidelines on how results_version should be
handled?

>   "name":"normal-run",
>   "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-=
06) x86_64",
>+  "cmdline":[],

Well, cmdline is not supposed to be empty. Shouldn't we have at least a
fake command here? E.g. ["igt_runner"] or even with some common
arguments...

--
Gustavo Sousa
