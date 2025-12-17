Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9816FD65C47
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 13:29:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F07210EBB9;
	Wed, 17 Dec 2025 13:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U6G6R1ao";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B671D10E357
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 13:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765978162; x=1797514162;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version:content-transfer-encoding;
 bh=/r+y9BGm3nxgfdR9EaQ3oYpLuDKCjWiN7hlwgsa5QwA=;
 b=U6G6R1aoJxKjKh8MNCoWD4rLxswhdx0o3vCiHbyydlhHmE1hmb3sWI4j
 0+GA31WsrYYH/sRYgK4BD9zp1Nl8bTi73obPGE6GViCGuYo1qmSCecpPs
 g4rnoz/33JrA0nqkNbizjt0LV4fsJcG6aDUwdlBxHo8iwcEdUOmeiIQP/
 6cnwYXrYVzv+OWEumF1AmiG+d1JyfEMEDHP0hU9VnHhfauIwwijCbojvF
 j5WYDff8PY1EcAuTf/ZvIuz183ki6e4uaieI5urqOYlp1vcLibolro31/
 O2TTZcIQd4ChNGK9H8WtiNlPWrpHEduHPRo2ah73EJJ4jKY+IHKhZQEMg g==;
X-CSE-ConnectionGUID: 8Pyt0HpzQayL20AVRIiYjQ==
X-CSE-MsgGUID: nTwv0XrEShqM4/qW/j5cFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79032143"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="79032143"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 05:29:19 -0800
X-CSE-ConnectionGUID: ufLv0sNmQwu0X0OVrlA8Mg==
X-CSE-MsgGUID: AQ9CD3m6SUCH1VebTDHVWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="202498197"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 05:29:05 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 05:29:04 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 05:29:04 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 05:29:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sn9RssiimBsQd/RTvFVjyvAzDXNfpKTX/hJVrvHZwtZbOzd/l8/lJ8ayRRKY3UKS9SKeCmXQocTRMLSYKs7aHVVbdY6/vGA/1GcAXceE3o80vVenGah4q4V5zLI3ggcaNLKa3hp9XclvO/ExpFpPsOWuw8Q8Iujytb32tUf6wdBiWEia2GbE8xnrmE4Q+JxJ/6SnWXpEphBP1TFwsa0A5Xajbj6afu+HrnTVmB/ZR83XRInsixQSNE+NHMpWGSjkQ2+BihZl4DXGgWN0kFh95yy8vuHFDXhwv4UtBGaNjKFiBc2m2LVqpZixKU3hIVc6StrtEjCXquRuGXw27CtNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZ6hXqtp/NzBCR0PbaK1iRkbC7223hDq2D2mraABPvs=;
 b=DhIeinpomHUTpVeeqVZxW0cSWMt3/RO6QCzTUjVwCg7Kr4hUeQguwhxkTS9+y3lecL0wugSBSwTlpIb+y+L9zqOvrax82LT549vLIVXJvwxFzQrGxHv82hl5EnTIRPXxO1m87zhUdKuwCOMUhmG1tbRPj4ziXfSw0X73RMxg2hoTcmUMSMo2AtFvt0gi1Ol+DHpPmGAW3CWwpcGE8k7d784Q3BiMcJ9x8EuOAjsd3KQaKkfee/f3RmmOon+7TOgQZVaB/HrC+DuEbG1RNLcIhMIY8F6ZNYMTs36XVn2mIM6O914SU3bVR/u9S+CNzLJrJbgHk6ny21xDBz81k2KBfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH3PR11MB8467.namprd11.prod.outlook.com (2603:10b6:610:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 13:29:02 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 13:29:02 +0000
Message-ID: <ba09ea11-3304-429e-a7df-fc4da0c79b19@intel.com>
Date: Wed, 17 Dec 2025 14:28:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] intel-ci: add eudebug tests to multigpu blocklist
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20251216132249.478112-2-piotr.rudnicki@intel.com>
 <20251216154357.vwarupdxrkgqohaz@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
CC: <igt-dev@lists.freedesktop.org>, Himanshu Girotra
 <himanshu.girotra@intel.com>, <piotr.rudnicki@intel.com>
From: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>
In-Reply-To: <20251216154357.vwarupdxrkgqohaz@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: VI1P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::10) To DM4PR11MB8179.namprd11.prod.outlook.com
 (2603:10b6:8:18e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8179:EE_|CH3PR11MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: 2612ce21-6596-45b7-ac6d-08de3d703e14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Um1ZUWJoN1lhdmQvelUveFkrR3VUVXpxdkE1UTlWWXZjNnAvenZzK1ViL21z?=
 =?utf-8?B?VU1LUFBQL0l4ZjRueUxMa0k2SjFPNkJXM2hzVGRoSjRTditnU1BmQTFseDVP?=
 =?utf-8?B?QWNBTUFmZ21Ua2dBSTIrL1Vpa082M1gzcVdoYUx3WTJzRXRESHMvR1h2RjUw?=
 =?utf-8?B?cEd5cXVQWGJWT0R3cVRtNy9nalE1OHJaQ25yZGtsWGJaVVNHWGN6L0NrL1hq?=
 =?utf-8?B?VkdYWjIrNjBXQm1XeHlpQUZoOXNzRklFSWY2MGpmSUd4NGpPcnFnc1J6U2Vl?=
 =?utf-8?B?QVdaTGZXUTRYZzhoaW5lbFlXSzhWckZFd21YVnh6WUNqL01FZUIrZjZlUENP?=
 =?utf-8?B?MkQ3MUZKMWdYWmc5bEhPaXZ6b2FITEVSTVFQRWkvYnZ1SlpXekwvaGV0SVNV?=
 =?utf-8?B?c2NuUWpQamUxOUx1Qk14VENWWjNOTWFhZU1xMm5GS1J6OERYZURzVTIwUW9q?=
 =?utf-8?B?SnU0MFljVTdtUlhkTFdQWlhyYTJxbms5ZHFUZlBHTDJ5b2t0NmszYkVLdnMr?=
 =?utf-8?B?YzFidTMyay9kckNBaDdEcFh0ek9uNGt4clVZMHJJQkExKzdyOFdUOFFYd2ZB?=
 =?utf-8?B?dDlLQzFWVVJNRldJS2o5MmhXdlk4VjNkOHJLc1hnQlZnYlpWVE93M1dBR3F4?=
 =?utf-8?B?UkRpNzZHdUw5RWUyRy9JcnRzVXp5WnpCMTdIMUZqMDBWMU1wUWpnK0pEM1NB?=
 =?utf-8?B?OEtwQnRrT290VTV6dXRCYkMwYkZMRlRDRThUd2dwWDZXVDJPUzBpcUpndENy?=
 =?utf-8?B?MkNXQUQxOGFIY1ZDOWRIVHFGaFBtbnFPWmpxZGozblpiZ2ZENE8rODFZMC92?=
 =?utf-8?B?VXc2ZlBEeHBTZURJSGcyZlI2NzJ6OExUMFRHN0VTZmtuU1Z5T3J6Q25GSmJN?=
 =?utf-8?B?Z0VQSWRIMFlDV3NBV1d6SWJkNExmRWxLYW81N3ErdG9kc2lVdVVpRlRQaFNJ?=
 =?utf-8?B?a1RwcUNtOWF4eGJUZS9NSVAxWVJtV1ltYzZ5VnBXSnE3ditLOEdkMnd6bkJz?=
 =?utf-8?B?bFAzVGpGRndqVnJmZ2dZTVpVWVNBN2NsdWlMc3RMdWpacnl1dUEzY3JaeUc1?=
 =?utf-8?B?Qm1jcFdRbWUrRURzZm1ydG1oMGdoUEhSRXdHZWFaVm5yaVVJaUt1SkhWT0Y2?=
 =?utf-8?B?am1IRlk1YW9UMmltZndQemtQaDJLbmdtY2pRMnEyZmYwQ0dNOFk0N055aTA2?=
 =?utf-8?B?OURTU3BjY204cFJOTDYvdS95c2tjekw5UFcxVklBRitENzdNNXV1S0FudGZJ?=
 =?utf-8?B?OFozN1RqaVFJOW1wL052d2VWUHdyeEVtcUVvUWErZXM4MnVFZ2JKZk9tTkZZ?=
 =?utf-8?B?cC96MjlGMXNWcUUyZlBDV2xVbUxUSXR2T1VBOEFWZ2FKMCtITEtsNkIzMWJa?=
 =?utf-8?B?NGNHUk14MnMrTWZsLzM1Q1lvU2Y2VEprRjkxbnpjaVRMR0JiKzBZSFZuV1pX?=
 =?utf-8?B?WWZIWDNHWFlDYmVzVU5nZmxnQ2Vjbk1UTE5nMmR2OHo3S2xwR0V5WVFVcTFD?=
 =?utf-8?B?dDBDWU1jbUQvRXZPeGdvUDY1Z3NQS3FzaUdoUHFMeFJIREtMWE5BTUpaaHha?=
 =?utf-8?B?QVFScHVFb29WMmJPL1lZYUpQMDVoZkJFSXZPeXRscUR2aTFzUXF0dHpxdjdx?=
 =?utf-8?B?S0tPL1RDamdwT3lEUUV6dDdyeVdrZ2lpbUJwdk52Q2x4S1dxZSsrOEw2TTVQ?=
 =?utf-8?B?Sm5WbG5VcW1MS1JkemNEZnYwbWtncFU3dUU2blU0Z1ExM3E1dHVrTFFic0k3?=
 =?utf-8?B?aHlpWENML2wwYmM2OU5MSXBsVHg0ODBYb1czTFZ2L3AvVnozTC9uVzhBNFE5?=
 =?utf-8?B?Nko0Tzk0VCtvblR1RXFWejJzNEF0NStBY0dXRGNYMlNzYzJKYmt2WWpHdDhm?=
 =?utf-8?B?am55VE5wdk1ydVRETUw0eTIyTmtQa1UwTW5ZNm9YYk5KWG1UWjgrRS85ZFVY?=
 =?utf-8?Q?a4KUVEuDoxHQFfwbWBrZLchOmGGLPw2x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUJndlZYNnIvWkdCSUJkR3ozZjFVMFRBNE9iUmpQQ2VHNUpacTZidllBMWh6?=
 =?utf-8?B?YlR2MGNFLzBnT3MyR0lzR0l1L2NjZTVVc2R4TEt2Yi8rUFk2a3JUZmtDZHhl?=
 =?utf-8?B?RXRQWkxjbEdjNFNUQmt0bWVpS2gvMm0xcVpFSVVkb3UyUkI2UmM1UmJ3b2Zu?=
 =?utf-8?B?WGFSVEF1U2xRL2QzNG83YjBoTTB2MVkzcEZxb0xSMkpYNUNrNDhjQlB6cDJ5?=
 =?utf-8?B?eXF4SXdGbFQ3S2MyMWFRNS95L1Q5ZmZEMmNxa2lOYm4zUXZjK3VHcUdQZjJI?=
 =?utf-8?B?a09JU3ZJekdldDZxTmRGZG5SQ1ZtQ3hCM1ExRFZyc2dwWHkyeVN4UERSZnoy?=
 =?utf-8?B?QzBkNGRWNUF3cWJkcWliMUZzL2hrZ2NFZlk3b3RXUFEyOW9XYlJoYktIK213?=
 =?utf-8?B?N2VjM2wrVnE0YVhJWmdRSGpMb1BpSldjSFFMNVg2ZEgxUE0zeG5VamJiU0ZB?=
 =?utf-8?B?TGhNQkc5SVRSTnZjT29WeG5iQTUrU3Y0QktrYmZQRGRSZ0c2QTJ1WlYvMnpy?=
 =?utf-8?B?Z0xsTHNFVkJlVVdsUEVHR1pNUloxUVRxYTVPeGgwNWRoSzBPWVhOV3c2MlA1?=
 =?utf-8?B?RWFnV21PWEk5TVhRQ3BDcmxYUC9CaTUvczVna2JWS1E2RXkzcnhvdnUyVTlS?=
 =?utf-8?B?YmVBbS8wTW9Tb2Fha0ZpRWhBUlZPenhNTjZWeGVacUZaVkJzekpJNitrUmk5?=
 =?utf-8?B?dituaDg3RUlkOHgzSjBsUUtGZytVbE55dHY0RytRNU9tZVM5dFh2YWVVeWpj?=
 =?utf-8?B?Q05NMGpDUzc4MUkzNElVOWZMd2FoNEVSQzluQjVFaW16UTA0Y2N3cUhtWmNo?=
 =?utf-8?B?RldBeWttcEt4aFFNUVB2TWFlU3VIdy9OY21nMG1HV1VRMXd0c3RVUjRQS1Zq?=
 =?utf-8?B?bHR3YldPUHpLbGl6T1d0OVlhbVB6SzZKRTdlb2Z0dFJ6OWY1c2Y2S29ScEI4?=
 =?utf-8?B?dmZNRnhyWTF6My9uM3RnME9rajRXMDV2alh0TE9QaWpheXVka2xxSGttTVlT?=
 =?utf-8?B?dGd3emFXcDJPazBTRWZFWjJjREw5bm83SGpnNUxQcjJLZDlhcGxiU0hJT000?=
 =?utf-8?B?dFk1Z2dJcnlSa3ZGUWNpWXNNT3ZWVDRVUHpOalhqdExqdkdIUVMzb0xPcWh5?=
 =?utf-8?B?Y21VanhhTG5MWkJKQW05STdhYjA0VzVTbW1tbC9jSkxFWStSTktHbi9OWW42?=
 =?utf-8?B?b3FzdU5HZVEzNi9GekNCS1lXUHBFV2syT2RqeEVDVWlRTWFIRDBzM1Fqbnp0?=
 =?utf-8?B?a2NSazlIcFgvLzF0WCtRcXd3YmF2SmVXdUorcWQzYkZHYTQ3SmYxc2hlWHc2?=
 =?utf-8?B?U2RCL3R2SWMrM2NmcFc4eUJVSkJqREd6cWZwUEwwYmFhZTFMVG84a3c2aVZE?=
 =?utf-8?B?NTZHb0Zld2pROWhVMHBNTWZFR2FaWGRQT3BnM3BSOFNTZTVKZ0NrZVNTaWV3?=
 =?utf-8?B?VEliVEEzREdQTVBrS050eS80WS8vYXlOSlRKc1N4QkFzZi9nS0dKcE9UbFdp?=
 =?utf-8?B?Sno5bTJIYUprNHZjNzRyNVJFb3pwU0RWNDdialo4Tm5YYVFvWDVkSTRZRUhK?=
 =?utf-8?B?bERGbkw5aWpZQU03VkVjQWNqUU5jMmNhcnVVZWF3R0tYOHVWQnpVa3hDZHF6?=
 =?utf-8?B?MmtnT3RtVHB0UEkvWmhVbkNQZ2cwZUhKcXN1dWdWVG5jbHhQU0xkeU1PRnpC?=
 =?utf-8?B?YktiZVRhWjlhcFAyRzBEMDdKL0pXVHBIN0kzWjAxMEpJZ1ZvWjNjek1uOFAv?=
 =?utf-8?B?c0taOEIvUW15ZVZ2VlJ5VW53ZzRZU1g5WC9yQTh0bjJPTmxSQm54aFFhNFFS?=
 =?utf-8?B?VkZIU0RLUGdmNnZnVTBoWHpGNGN5SFFVazBaM004MUZheFQzSFNWcStvNXln?=
 =?utf-8?B?WFFjaUhxMW11WkF6NDMrM1VZb1NYTmFjKzhqVGNEN0JuU1d6UlZJcUFGQWVp?=
 =?utf-8?B?UlVFbTZlWUtwMmI3ZjRnNnFWVnpGdkMvb3FmSjYwcWg3Q2g2bU5qWGVSUmpl?=
 =?utf-8?B?NllaWTdDTXBrYi9HdFgwV1QvUWlpV1drY3VyTVpGeGtGQ2pvZjlLWllqdjRS?=
 =?utf-8?B?RUZxMUYyY1Q0SEpZL3RMUkhjWWozV0VlaHhtSDlKanlFWmJBNE9hMEVGcGRk?=
 =?utf-8?B?M2N6aWpRTTFhODdkVm95NklvbXlkTllXOVZBYmszbmJOQ3JxajIwdFJWS3JD?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2612ce21-6596-45b7-ac6d-08de3d703e14
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 13:29:02.2898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szvaaJGGgr51h0RBviZCaQSfF05TSncg72Zi/7CG+0YMJ2M1y4G+hwvXYgQX9JaY6pptmAMrG0qHcqFPpf+LWRUZecMoWCmXSwp7kJLq9cI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8467
X-OriginatorOrg: intel.com
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
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

SGkgS2FtaWwsCgpPbiAxMi8xNi8yMDI1IDQ6NDMgUE0sIEthbWlsIEtvbmllY3pueSB3cm90ZToK
PiBIaSBQaW90ciwKPiBPbiAyMDI1LTEyLTE2IGF0IDE0OjIyOjUwICswMTAwLCBQaW90ciBSdWRu
aWNraSB3cm90ZToKPj4gQWRkIGV1ZGVidWcgdGVzdHMgdG8gbXVsdGlncHUgYmxvY2tsaXN0LCBh
cyB0aGV5IGFyZSBub3QgeWV0IHN1cHBvcnRlZAo+PiBvbiBYZSBtdWx0aWdwdSBzZXR1cHMuCj4+
Cj4+IENjOiBIaW1hbnNodSBHaXJvdHJhIDxoaW1hbnNodS5naXJvdHJhQGludGVsLmNvbT4KPj4g
U2lnbmVkLW9mZi1ieTogUGlvdHIgUnVkbmlja2kgPHBpb3RyLnJ1ZG5pY2tpQGludGVsLmNvbT4K
Pj4gLS0tCj4+ICAgdGVzdHMvaW50ZWwtY2kveGUubXVsdGlncHUuYmxvY2tsaXN0LnR4dCB8IDIg
Ky0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL3hlLm11bHRpZ3B1LmJsb2NrbGlzdC50eHQg
Yi90ZXN0cy9pbnRlbC1jaS94ZS5tdWx0aWdwdS5ibG9ja2xpc3QudHh0Cj4+IGluZGV4IDM4N2Mz
NDEzZS4uYjRmZTIxZDJlIDEwMDY0NAo+PiAtLS0gYS90ZXN0cy9pbnRlbC1jaS94ZS5tdWx0aWdw
dS5ibG9ja2xpc3QudHh0Cj4+ICsrKyBiL3Rlc3RzL2ludGVsLWNpL3hlLm11bHRpZ3B1LmJsb2Nr
bGlzdC50eHQKPj4gQEAgLTEsNSArMSw1IEBACj4+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4gICAjIEJsb2NrbGlzdCBmb3IgWGUgTXVp
dGlHUFUgdGVzdHMKPj4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwo+PiAtaWd0QCg/IS4qeGUuKm11bHRpZ3B1Lip8eGVfcGVlcjJwZWVyLiop
LioKPj4gK2lndEAoPyEuKnhlLiptdWx0aWdwdS4qfHhlX3BlZXIycGVlci4qKS4qfGlndEAuKmV1
ZGVidWcuKgo+PiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCj4gWW91IGRvIG5vdCBuZWVkIHRvIGJsb2NrIGl0LCB0aGlzIHNob3VsZCBhbHJl
ZHkgYmUgYmxvY2tlZAo+IGJ5IGV4aXN0aW5nIHJlZ2V4Ogo+Cj4gaWd0QCg/IS4qeGUuKm11bHRp
Z3B1Lip8eGVfcGVlcjJwZWVyLiopLioKPgo+IG1hdGNoIGFsbCBuYW1lcyB3aGljaCBhcmUgbm90
IChtdWx0aWdwdSBPUiB4ZV9wZWVyMnBlZXIpCj4gc28gdGhpcyBldWRlYnVnIHNob3VsZCBiZSBi
bG9ja2VkLgo+Cj4gSWYgdGhpcyBkbyBub3Qgd29yayB3ZSBzaG91bGQgZml4IGl0IGluIGZpcnN0
IHBsYWNlLgo+Cj4gUmVnYXJkcywKPiBLYW1pbAoKVGhlIHJlZ2V4IGFjdHVhbGx5IGFsbG93cyB0
ZXN0IGxpa2UgaWd0QHhlX2V1ZGVidWdAbXVsdGlncHUtYmFzaWMtY2xpZW50CmJlY2F1c2UgaXQg
Y29udGFpbnMgYm90aCAieGUiIGFuZCAibXVsdGlncHUiLCBtYXRjaGluZyB0aGUgZXhjZXB0aW9u
IApwYXR0ZXJuIC4qeGUuKm11bHRpZ3B1LiouClRvIGJsb2NrIHhlX2V1ZGVidWcgbXVsdGlncHUg
dGVzdHMsIHdlIGNhbiBleGNsdWRlIHRoZW0gZnJvbSB0aGUgZXhjZXB0aW9uOgoKaWd0QCg/IS4q
eGUuKm11bHRpZ3B1Lip8eGVfcGVlcjJwZWVyLiopLip8aWd0QC4qZXVkZWJ1Zy4qCgpUaGlzIGFs
bG93cyB4ZSBtdWx0aWdwdSB0ZXN0cyBleGNlcHQgdGhvc2UgZnJvbSB4ZV9ldWRlYnVnLgoKUmVn
YXJkcywKUGlvdHIgUi4KCj4+IC0tIAo+PiAyLjQzLjAKPj4KPj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IElu
dGVsIFRlY2hub2xvZ3kgUG9sYW5kIHNwLiB6IG8uby4KPj4gdWwuIFNsb3dhY2tpZWdvIDE3MyB8
IDgwLTI5OCBHZGFuc2sgfCBTYWQgUmVqb25vd3kgR2RhbnNrIFBvbG5vYyB8IFZJSSBXeWR6aWFs
IEdvc3BvZGFyY3p5IEtyYWpvd2VnbyBSZWplc3RydSBTYWRvd2VnbyAtIEtSUyAxMDE4ODIgfCBO
SVAgOTU3LTA3LTUyLTMxNiB8IEthcGl0YWwgemFrbGFkb3d5IDIwMC4wMDAgUExOLgo+PiBTcG9s
a2Egb3N3aWFkY3phLCB6ZSBwb3NpYWRhIHN0YXR1cyBkdXplZ28gcHJ6ZWRzaWViaW9yY3kgdyBy
b3p1bWllbml1IHVzdGF3eSB6IGRuaWEgOCBtYXJjYSAyMDEzIHIuIG8gcHJ6ZWNpd2R6aWFsYW5p
dSBuYWRtaWVybnltIG9wb3puaWVuaW9tIHcgdHJhbnNha2NqYWNoIGhhbmRsb3d5Y2guCj4+Cj4+
IFRhIHdpYWRvbW9zYyB3cmF6IHogemFsYWN6bmlrYW1pIGplc3QgcHJ6ZXpuYWN6b25hIGRsYSBv
a3Jlc2xvbmVnbyBhZHJlc2F0YSBpIG1vemUgemF3aWVyYWMgaW5mb3JtYWNqZSBwb3VmbmUuIFcg
cmF6aWUgcHJ6eXBhZGtvd2VnbyBvdHJ6eW1hbmlhIHRlaiB3aWFkb21vc2NpLCBwcm9zaW15IG8g
cG93aWFkb21pZW5pZSBuYWRhd2N5IG9yYXogdHJ3YWxlIGplaiB1c3VuaWVjaWU7IGpha2lla29s
d2llayBwcnplZ2xhZGFuaWUgbHViIHJvenBvd3N6ZWNobmlhbmllIGplc3QgemFicm9uaW9uZS4K
Pj4gVGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRp
YWwgbWF0ZXJpYWwgZm9yIHRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMp
LiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0
aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllczsgYW55IHJldmlldyBvciBkaXN0cmlidXRp
b24gYnkgb3RoZXJzIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuCj4+CgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSW50
ZWwgVGVjaG5vbG9neSBQb2xhbmQgc3AuIHogby5vLgp1bC4gU2xvd2Fja2llZ28gMTczIHwgODAt
Mjk4IEdkYW5zayB8IFNhZCBSZWpvbm93eSBHZGFuc2sgUG9sbm9jIHwgVklJIFd5ZHppYWwgR29z
cG9kYXJjenkgS3Jham93ZWdvIFJlamVzdHJ1IFNhZG93ZWdvIC0gS1JTIDEwMTg4MiB8IE5JUCA5
NTctMDctNTItMzE2IHwgS2FwaXRhbCB6YWtsYWRvd3kgMjAwLjAwMCBQTE4uClNwb2xrYSBvc3dp
YWRjemEsIHplIHBvc2lhZGEgc3RhdHVzIGR1emVnbyBwcnplZHNpZWJpb3JjeSB3IHJvenVtaWVu
aXUgdXN0YXd5IHogZG5pYSA4IG1hcmNhIDIwMTMgci4gbyBwcnplY2l3ZHppYWxhbml1IG5hZG1p
ZXJueW0gb3Bvem5pZW5pb20gdyB0cmFuc2FrY2phY2ggaGFuZGxvd3ljaC4KClRhIHdpYWRvbW9z
YyB3cmF6IHogemFsYWN6bmlrYW1pIGplc3QgcHJ6ZXpuYWN6b25hIGRsYSBva3Jlc2xvbmVnbyBh
ZHJlc2F0YSBpIG1vemUgemF3aWVyYWMgaW5mb3JtYWNqZSBwb3VmbmUuIFcgcmF6aWUgcHJ6eXBh
ZGtvd2VnbyBvdHJ6eW1hbmlhIHRlaiB3aWFkb21vc2NpLCBwcm9zaW15IG8gcG93aWFkb21pZW5p
ZSBuYWRhd2N5IG9yYXogdHJ3YWxlIGplaiB1c3VuaWVjaWU7IGpha2lla29sd2llayBwcnplZ2xh
ZGFuaWUgbHViIHJvenBvd3N6ZWNobmlhbmllIGplc3QgemFicm9uaW9uZS4KVGhpcyBlLW1haWwg
YW5kIGFueSBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgbWF0ZXJpYWwgZm9y
IHRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpLiBJZiB5b3UgYXJlIG5v
dCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGFuZCBk
ZWxldGUgYWxsIGNvcGllczsgYW55IHJldmlldyBvciBkaXN0cmlidXRpb24gYnkgb3RoZXJzIGlz
IHN0cmljdGx5IHByb2hpYml0ZWQuCg==

