Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3B6C71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 11:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F4B10E3C5;
	Thu, 12 Jun 2025 11:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cdi+RLGx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF6E10E3C5
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 11:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749729399; x=1781265399;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=chAiOtz/DsdofUzx11zg4BYM++HR64pUCC8rZTMnHgY=;
 b=Cdi+RLGxOsZLGNtWfEe5w92EI2o/g5hlqkjTEjvsBLYfBAX3QFlI8THK
 crc1DInuhV4kAAzv2uhGTVW7AqoW+IZ/Jy/bBYt2pcbYvYmIE12kfoHJN
 +YZ3LP4FXLBokS+SYEI6Q0W3VqVc5JPrDPCMfBhh+z9bkRx/gH+gFkRwZ
 UZAqucGHeNNQ2lYrYY3kgS4Qi3P8Zs4eDPrgdgBhb9ZCzTo78Xmbcol+J
 ziVjCEqkY+0BmOD++7j0DsH7MmxGJtPaotVLQv730+nU/xaDHW1Mi77Pj
 iN08NsiWQb7jTGbJRzbDd/Ty4WJJwtOAboEez3PCRqL3SOVx9+5mjivfd g==;
X-CSE-ConnectionGUID: IWXouPaUR+Smipg0drqseQ==
X-CSE-MsgGUID: tY/TnAXTR5majgI6VatKXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63312950"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="63312950"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:56:39 -0700
X-CSE-ConnectionGUID: eahVcBeuRnGTgnv0Mbtkew==
X-CSE-MsgGUID: cjhiFB3uQPuz7bo4Ue2eVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="178471223"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:56:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 04:56:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 04:56:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 04:56:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzaFiWIn0oxnnTpww5dpBRkrJqWPG1/FvmvxR3b60OYuH2oAsR83IKLQrMNr+lvvYj2/suV8tpF5weir36jp5TrwIb90c45BTNKkrNjV44naD7TzZYzrkoB7PM8Zl/v564OeoFY06MBdxA7NpSsJMyoddYIAt9+9jsRcQ1VazQ8JHv8MC0ZdFnPofrEi7vDbctT1syUpeQr0AzpS9N1OtwMJDgT4uJ1cKJQHpvCM9Hbeh/ASQh8l6moltiFxoGObxV3SaR/H1Iehp4RGpdjEjM2wbzhlpRpnDn5/N8OqGGI4NVX+2w48IbFiyPpXJYT6Rt8Womc4D8t+Xyuq2O48IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8p54Yxsdi6O0qLUAW/PThzt/EUXE8lI7G8m/zel0HY=;
 b=XnP8UX4CHAHqdZKSxat0BBQ8MoD8sSYX4v7rMw6cCOpzMnxFGu6+LJ6d9L/rZgsecgLNN8Uwwq8gaIZ6olN9TQNaq47TfOL28drLmAnQuGnz4lImMpnLE/9FOu+VfGcvhXR2mfcRvrBD7G8C95+7IjrqD150pPEqO1e8BpALg9IGCl/0ibpn+kBasUi17F0GuYiZX2ztT5wJ/HE0T5gZeRnYk4uhKoTXdV9PnGe3ensEI8WhVs41LnNrgzdyzsQWxwe985bLsyZBJBPQpCYP5sZiIc+e7IKbFpWG4vkmXkbcBBY6wd7TwF0NhOUWSf0JUotLC0ks85RJziu1mjvXSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by PH7PR11MB7499.namprd11.prod.outlook.com
 (2603:10b6:510:278::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 11:56:21 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc%8]) with mapi id 15.20.8813.022; Thu, 12 Jun 2025
 11:56:21 +0000
Message-ID: <f6e3f845-2118-4a55-b4a9-9fde4e1da976@intel.com>
Date: Thu, 12 Jun 2025 13:56:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,3/5] Dockerfile: bump fedora version
To: "Knop, Ryszard" <ryszard.knop@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "rk@dragonic.eu" <rk@dragonic.eu>, "adrinael@adrinael.net"
 <adrinael@adrinael.net>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
References: <20250611-bump_docker_distros-v2-3-90791ecb953d@intel.com>
 <1ffdb2f8ca93af11c528316ad331ef7adad718de.camel@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <1ffdb2f8ca93af11c528316ad331ef7adad718de.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0149.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::33) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|PH7PR11MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e472d0-df56-4e30-d7cc-08dda9a825dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnU0V0F2enk2cXdPSEo2TE5wZnptZlpDQ08vUWZ1ekhHb25qOC9ZMHVUQ3do?=
 =?utf-8?B?M2JDQ2dHRFppdGYreHNqVDhlQmhKK1NPREJnZVFRb0ZDYWJGa05GRmJKNUpS?=
 =?utf-8?B?MXpXZGNyUnpHeU1BLzZwTTBMamFiQkJJNU5yUWRNcURZSGlZMVB1SW1qMkpi?=
 =?utf-8?B?ODNOQ0VjZ29vNVJvK2xCTGRXSStIV1d5cm5vU29RVXdLdVV5Y091NVZPakJx?=
 =?utf-8?B?V3lXR0w5NjczUmxqZGhpVlVRN0RrclZmd3MrSmVxVForUzFIQkh2NzBodDlE?=
 =?utf-8?B?a1V4MUZKR093UUJqRU41M1MxWDBHU1JvYVNIaDR5VWE4MzFSMEdBendLcm9B?=
 =?utf-8?B?Z0ExTUw3ZDZtNUxFRTI5Z2c4MzRTMmR5cll0aERjUDdleXVPNWZ2bFYxcHZu?=
 =?utf-8?B?YVFMbm1UZW5PTFpwTUpXTmFvaU9JTFVTemhiQWlQNWhvWUJFeGZCTWVQYm5n?=
 =?utf-8?B?U2xGY1RnMXF0TWFPRTJjQ3VVR0tIVExnRFRuOFdlMmkyM3NqYTljMlFMUklk?=
 =?utf-8?B?K2U0ZE9OQm9SemxHSGxzQnpscE95dm0vRU5EWFh3VWNnc2lFbmNndCt0NW04?=
 =?utf-8?B?dUJNekhSRHBZei9XbWVzZ1ZXcjhTcGlacUFCaHovUjhGcmpzL29GbjhVb25M?=
 =?utf-8?B?UVVkTFZjM2RjT0xSVlNsUmJyZHdaUElHR1JhSlpkOVhVZXIza1VGR09Jb2Jx?=
 =?utf-8?B?OXJyQ2RzUzIwelZFMTcyYTdqQStnYzY2SVdIQmVwY3R4QXVGdlZJVGZ0R3Yy?=
 =?utf-8?B?TVJ2R211SWFseml0Sno2SDhVUzFleklPalVsMTFHY3FHczhvRDc3ODh1TTQv?=
 =?utf-8?B?WFAybkxZaE1FTFd5T2pmOG93YUVnWVFSWmN3L3ZXYkxNSnduYjZHaFpOcHJ0?=
 =?utf-8?B?bWF2b1pwYUhvZkJpazNxTk5RU0RVWHZZdDZFc0JKSGpFL0g0YkkxbVNSeTN3?=
 =?utf-8?B?aHZPNDJ5V29udnJuamYvN0IxRDh3ZDZFVjE1RVZvdzZMeVQvZ0JNZXdnUFBt?=
 =?utf-8?B?RkphSEw2dUxZODV6TE5nWG5XMkRwWlNJMVpjKzlrMDM3OUNNZU8xNGsrbGUx?=
 =?utf-8?B?a3RFem9hNUo2Z1JjR3FXQ0NNQlhRVUlNc2xqakFUcGcwcnlrdGI1NzFSYzl3?=
 =?utf-8?B?ZzZjQ0hBTzFLYnJSdXJjYi9DNzRLTlB3RGYxdUV5emh2TDkxNmNmd25ScUVN?=
 =?utf-8?B?VFlWTlFidjhnSmhCSG9SUkx4cWlLMkNhZXhoRHlXcjNpL3FLRmV4LzRzWnpq?=
 =?utf-8?B?aTB6OS9kc1RlR0FMTkJCSnVzNDFvSlBLOGhieHpZaXVtazZWakRLWFBiQ254?=
 =?utf-8?B?MGdDNlVJeUc0RlRlWjVrWW8yMjhPd2kxdHFBYVQ1NEM4bEI4NTR4cUhIaE5a?=
 =?utf-8?B?S1NiNlhkK1lPdE1TMk1CeGJqVjFXZWZJbVIwMVZSOE1SV1haV0NHOWhkUkUz?=
 =?utf-8?B?RWM4TjB3S25rU2tMbzljVWRoNkVWWGJXb3F0blZOMVVXWk43WDcvalRPUmVN?=
 =?utf-8?B?ZDduU2JSb3ZWMDE4ZzF3VTd4UEhkYVBVOHFkRk85b251Ym8zUDlnZmMydWlM?=
 =?utf-8?B?WDNTWDdTMTR0T0pWbjAxTGhWV1I0L3RpV0dNZXIyeXlVb2V2UGVpVWxadkJN?=
 =?utf-8?B?WjlqNVpTZnZZYjk0d243MUVuZGVmOXk0SU5mSkdubi9QVGNEVXZYZHhTZUVr?=
 =?utf-8?B?UmhWV00rRDB5SlB4SklVU0Q5RmRUa1NCdHgwNFQ4TEhKTVloNVp3aFNPRkNM?=
 =?utf-8?B?UlB0ajhpbmlycGdCQ0ZkbkphWk5ndHdlejhMRHNQelRIQVlEMDhBUmxmeFZK?=
 =?utf-8?B?bEZxME55YVhBRG5XNmtXYU8zYkduRWR5ek1seWdFc0VWQ2hLSG12MTk3b2xk?=
 =?utf-8?B?bVFZeGMvUlRYNDVlZmpscjZTeVdRdS9XemVHU1dDaVJobmsrMUttbGlEeTFx?=
 =?utf-8?Q?rkoFBd/D6tk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEF4SWMvWW9pWElYemM2SUJkN3dRcTZrR0xhZ1dzQnRWNm9Uc2JyN2sydHdv?=
 =?utf-8?B?SWNYSnh6QlZobGlzdFVGT0lWazhoMU1SL2ZBb2NEczJweUhQMFVDd0hZVFVk?=
 =?utf-8?B?c29KVDgyZUFLcHd0T25pSXJvVjdiMEtCaDd4S3hPSTJSUXFTd2lwZ1BKR1ZT?=
 =?utf-8?B?UTErUnpkSGoyZ2Q2TUREcHJKalpaUG1HQWhsa1VmUjYrQ1VmQUFPazZZSGxB?=
 =?utf-8?B?VmxvNzZRbEllZ0tuWmNRb2o3Qk5EMlpvU0dZeUp1anIrYnBFUVVkbDExdGJr?=
 =?utf-8?B?R0lrTE43L1ZDTXcrb3RlT2J1MTc2YkoycWprWlFtMFpyMnFhTnVyQi9JbTBZ?=
 =?utf-8?B?d2ljZmR3OVRodTVHeGorblB1U3FYL05XdnRRRkRWZVhaZHpVMlNYQkdGc2tQ?=
 =?utf-8?B?c3JoeEdNbzFjZkxFWFR5SWFobHFWVXpqK2RPWGV2azBReWFuVjVBKzRTeW92?=
 =?utf-8?B?dmFBN0xmaWlTNGo4QXJwaktabVl5a2lFN3FQSm5qUldjMlhxVytCMTh3YW5B?=
 =?utf-8?B?ZzcyQ01jUDQ3dVAyczQyMzBEN1I2VzRvVHUvdW9DeFlFOEhSbDZqNlJneHRa?=
 =?utf-8?B?S1hRb05GZEUrbHVpNE5pNVZmTjRRNW4rY0xrKzdrdDNUNE9VTUJ5N0tkOVFx?=
 =?utf-8?B?ZkFpSDJQTysyM29WY3J5RmNPbkRrT3dOVmFFdkFYblREczcrVWRhQ3ZlKzJW?=
 =?utf-8?B?ZzhRQlIwYWFRWk43TVFlWlltZ3hyei9qcU5UZndQR1dLbDhZbW5tVUZhK1o4?=
 =?utf-8?B?Z0Y3LzlRaThOckZUTmVnOHNvMTVmMUwrdG9ObjJqS3RJTFErU3JTZFRWOXU4?=
 =?utf-8?B?ZXJuZk5OaFE3YTdJNStDa1l1QTlxMDVXeENGaFptMUx5cVdvckZPTjVjT25Z?=
 =?utf-8?B?QTZ5eUJHUEJ4UkFCR25YWUIxNmErOWt4QUZqSisvL0d1UU9NYmZQSklQUmpa?=
 =?utf-8?B?b2FGUFRJRnVkbDVTV3NtcFBaZkpvWktoK091a3EzdC9maXllNDVkN3RxU1p4?=
 =?utf-8?B?OG81UnQ1MTF1QnBHYU9NREdXV0FjM2tXRmRnQW45Y3RyRHNGLzMyRzdEVXFZ?=
 =?utf-8?B?OFlqNUlOSXVzSnNLdDVvd0ZINFlxemE5VFZnRFZJTmNYdEhYemN0Y1JsdFhP?=
 =?utf-8?B?eVdQc3pwSE9lV2VQTzFHTTZnRmFUTGsvODVDY1FEQUJuSURzaGMxMEVFUFln?=
 =?utf-8?B?RllPZzc4R0IxSSthU0plbmFrTnkvamlTUUhydXI5YWg3ZFVjdGZMUjN6NjRZ?=
 =?utf-8?B?WXVzWEdWVndqcGhCK1gvWUxXb3R1Z2Q0MDVRKzIrSnc3TDdESHRiVW91RE5t?=
 =?utf-8?B?MjU0WnVkREluRkpud1N0dVk1SmtBRTlPTHBVaGlMUWtvalJFV1hVemJEV0cv?=
 =?utf-8?B?OUZaandvTTVUVm9yYVhPMWR2UXE4eEJzd2F1Q0xqYnBaUS9GR2xyNTB4NzRa?=
 =?utf-8?B?eXozMkd5OFMwTUtndDFpQzA0YTd4aFVENDVFeWVYb0UvemRZUjh4enNudEJZ?=
 =?utf-8?B?OEVMUjV3aDU1cmFjOG4xSG02KzNkZXZ1SEp3RVRpN1U3dFlKcmlKSjc0VVNP?=
 =?utf-8?B?K2hPWSs1RklNM2gzUG9xcit2c3BQOFVVRHNHbjBpbk9SM09DRTRnZXNLS2JN?=
 =?utf-8?B?ZUZCOTNRdTZTV1NJZ2ZwZjhNVzV1dFZCaEhpd3EyWFY2Tlh1ZjNNQ0hna29N?=
 =?utf-8?B?Q1R5bXd2VWs2NW1pYUZ0cGVlTUpxRjhkc2E5RUVENDZieHo2OTdGYkdxNU8w?=
 =?utf-8?B?dHZDSGpWQzhLbktIeWdJOFB4M1JBUUFqZzgySkJPeGpGN0tPY0tSb0Y4TjFG?=
 =?utf-8?B?bHptbVFpMnBEM25kZ1pNWkh6Q0tLUExaK2hRK1hWeXFjdDF5bS9Nd1Ivb3Vj?=
 =?utf-8?B?TzFSd0tIVFRWSGpJcWRNZDk3V25iN2txSnZIU3M0dDZOaHFtSHJPSXB0eUdm?=
 =?utf-8?B?ajUvQnBhd0N4cGJMMllGemh2WEdUTDJZQ05VOEtNSG5yTFpjMnRWMHpOL252?=
 =?utf-8?B?Y3lxQ3FucjhRVzF4V21HeFBvbnhMSUl0K2hoMHNJMnlpYU1vREVhQnRKRXFm?=
 =?utf-8?B?UXZnVWNqMnVLbkR5UEdtaDRsTzVCejlPMjVXYW9DZnhPYUxrdXNnMjFpUVpy?=
 =?utf-8?Q?BAh0cGUKMz3+PU2aqgvbyeuTn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e472d0-df56-4e30-d7cc-08dda9a825dc
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 11:56:21.4192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3P//bjzZkcranTor1p2xdSMKziXvmhaU+NZ5B+7Bx0Qe1RwREFbtNz0AeHbFqNoIARy+jugA6Th/aHIxh/nLAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7499
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


W dniu 11.06.2025 o 14:30, Knop, Ryszard pisze:
> Hey Andrzej,
>
> On Wed, 2025-06-11 at 13:06 +0200, Andrzej Hajda wrote:
>> Fedora has not LTS versions so in this case we bump to version
>> close with release date of debian bullseye.
>>
>> v2: updated description
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> Reviewed-by: Petri Latvala <adrinael@adrinael.net> #irc
>> ---
>>   Dockerfile.build-fedora | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
>> index dc5d1b16b48880694167750cd3990bd7d7154d43..00f45857c20f82320500e7230e72c9522527e7a9 100644
>> --- a/Dockerfile.build-fedora
>> +++ b/Dockerfile.build-fedora
>> @@ -1,4 +1,4 @@
>> -FROM fedora:31
>> +FROM fedora:33
> As you've said, Fedora does not do LTS releases, and this one is 5
> years old. Realistically, nothing that uses a recent IGT checkout will
> be done on a Fedora version this old, and IMO there's little point in
> building this in parallel with the Debian toolchain.
>
> - If you want to support the lowest common denominator for LTSes (like
> RHELs, etc), you might want to target AlmaLinux instead. It's a RHEL
> rebuild, has a LTS release and has a chance of being actually used in
> the wild, unlike Fedora 33. Bonus points: Alma 8 (oldest, still
> supported release) comes with meson 0.58.2, so your Dockerfile gets
> simplified and closer to what end users have.
> - If you want to have one ancient and one modern distro, just target
> the latest Fedora 42 or Arch here.
> - Or do both if you want to have wider coverage on LTSes AND modern
> builds as well.


Good point, I was quite unsure which one to choose, especially as I am 
not familiar with Alma at all.

However the update to newer version/distro I will leave as TODO - 
current patchset is working/tested

and is enough to unblock some patches depending on new meson.

Playing with latest/another distro will require more time which I do not 
have atm.

Thanks for reviews and comments.


Regards

Andrzej


>
>>   RUN dnf install -y \
>>   	gcc flex bison libatomic meson ninja-build xdotool \
> Thanks, Ryszard
