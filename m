Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F233ED3CCB7
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 07:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB3C10E6C0;
	Thu, 15 Jan 2026 07:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cHXksQlD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FC010E6BC
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 07:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768461891; x=1799997891;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pFGiP6B1NbZfCLXeAnDE3xkWybjqZAQzDi87t3WSZK0=;
 b=cHXksQlDoPisJ7DdL5ihs/yw7uCJJnxT1q+qGwCngi3P5WZeJK/l/Hs0
 4DjeVAMBElrYQ/OXIG39ez+MBBcJWw2dUk2kk1WBj1YdrtqYIiQHthspT
 y6DdhmfdKNzQzo42LHee6mOT/XH7jXhceSzeuSaNDRtQhb8/iYAzdwUhb
 2AX4jaLj8Pq4wzaHI4SIyygLWrt6WLvtQhn66MKy6GFWmncvRZuP+yjW6
 KN5db7sI/5Oil0xf/Eh34jlWT1RfOjB+bPl8ODm7mjf399j8xPjEmMT00
 Ct/b8aGE5KhFUegcKoUCpvjyjGwNygj1c55OkQldsQpSblMpLjeR8//2W w==;
X-CSE-ConnectionGUID: 2P0fSDomTN6Hok2GoP+cGQ==
X-CSE-MsgGUID: lGshJj+5SWSsRMNe1Br8+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80484763"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="80484763"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 23:24:51 -0800
X-CSE-ConnectionGUID: djHZ3GwaRuSaX9RSxfcqcg==
X-CSE-MsgGUID: RgeR5NhtRluJx9k44kbzkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="204096216"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 23:24:51 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 23:24:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 23:24:49 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 23:24:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMijswB4DATfoLFEW3AMZEUlt0HxNzgD4rvvUZWrLuOjzC1kAof10IXLCflSMbKWmfiJO5PGyv554Yk1lgO/OJltvOC8bbj/fM82lpffzZliXW17dex//O3gbPekhyQdk3bPlSJFPy2Ss7nzYDjLCRS5UdPhmFVPLt3voxZ9SObp0AbwSjeJp9W8g25P7LWNrzONQRDEg5m3Fv32ZyohHKZyHLzVkTD7jc6DNL++b2NKLEdooXPRYkN5JJdRsYCjwSLJLpJpGiJ6WeCXNVm5USl84bzLsnJQl5C/GsaAisAne3gXzsbOc689En3Aasi+z88DAy0n4XokzJC1khLYoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4svFtTvndgveKmpE3kPfyzFRenagQbT59WW+x2VEKbI=;
 b=Bd9eeN/PdlYHNI+vQGhk7ymDgpev7Wtik6oNmytT/CUDnqhm0uol28mLsow1Lw++sF5o5jS6GtBUGdpPW+1PmL7y5DYBRR3WcYZFhNE3+H+zd3+uqJpD+vWSB//4s7lhiPAxLGDMUUcPBI6o/Yxy/kExiymsYMcwGSlfxxDuJnzIdGFH/W2ZbD0nz/MS+F0Oj6UH269LGam3RTgaq5gNnNNKv+KimjdDwtdXnRn/7bD5BwgHQCr6G1jepqA4tSIHRSkoGmUrRWxO9XThlfaTvzd2Ha/nQKN06q5v6Ap1mOLYIQt+Gx6zTylTCGFgkOtKlQ3nkK99/GRK0kjX5ZdDtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH3PPF6CF64E2E6.namprd11.prod.outlook.com (2603:10b6:518:1::d2b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 07:24:42 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 07:24:42 +0000
Message-ID: <7019244b-eebf-4c13-914e-80fc1053a0d8@intel.com>
Date: Thu, 15 Jan 2026 08:24:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 01/10] lib/igt_sysfs_choice: Add helpers for
 sysfs enumerated choice attributes
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.wajdeczko@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
 <20251125102312.43142-2-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251125102312.43142-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0238.eurprd07.prod.outlook.com
 (2603:10a6:802:58::41) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH3PPF6CF64E2E6:EE_
X-MS-Office365-Filtering-Correlation-Id: 46766cab-c9d5-498e-c196-08de54072668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7142099003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3ZRU0xaNjNZbkRWMDNVN0tyVjBnSWwrdjdZV1ZTNWtyZWlsQTVFdVZkU0Yz?=
 =?utf-8?B?aTJ6UThpcDVwa1NPZm1sVDhqdWNaNTAwL0EzcmFEUVZRR1lKNElzVEZvNk1C?=
 =?utf-8?B?c04rWGU2ajI4cVJINk05RE1NM04yUmxZMUxVZldzRjBLRzJRNno5NUo3MEJw?=
 =?utf-8?B?cW1VUjc2M0tLV21FKzhlVHdEbzkrV2p4dTlHMzM2Y1FDbE9NK0lSdHZsMkRu?=
 =?utf-8?B?NkNOZFJoODg1SnFtS0lORVp6M1kzdTNwQ0dKZTlEWmxMbWFkaENhZk9ZTS90?=
 =?utf-8?B?TWFUamtQRDRsQnE3cWNLbkd6SHgvbUtwUDg2U0srakdTTEpPV2JTQmxhWTRz?=
 =?utf-8?B?SUpBOFRZTmZHQ3ZtMHJBVnh2WHhWOWhpUmE3K0ZvU3hqaDBEYkpIRGE3eUt4?=
 =?utf-8?B?VU16MU0zZFNQbkJPL01XWm9zY1dVYjgwblhoc2xFL2hqWTA5aW9YZGcyYm13?=
 =?utf-8?B?a3JxS2M0d0RFWVVzeE12czE4M2g2b2FQVklqN0xIa3RiVDVBRHNxNEIxbkx6?=
 =?utf-8?B?MW1YWkFMa0lnblJLN3N6RFRNb000eXI1L0hPcmRaRjkrWHgzUjFSWTE2eTYw?=
 =?utf-8?B?SElNeDh2VW9LcnJvSUFNZndzcXF2VnBkNHlKYW9EcFVwcytWbVpvQmIxZ3hL?=
 =?utf-8?B?aVYvZUVsaEk1R0dZTGJPcXlkcE0yV2twU3lGVW9XemREZ01qRlBLUGl5VGZk?=
 =?utf-8?B?Q1FEREhIenZDbFhhL0VVYUVhR3ZqL1FlZ2o3d2tOUGFaZjZvaW1SSFBGODBD?=
 =?utf-8?B?djVxUzJJZ3dHLzUvS283cTk5ZEpFMU8vRnV5b1o4QnpwTHl1WGJxcmxpbWEy?=
 =?utf-8?B?Z21pcm9CaExwdENlK3dPU082UVF1amRlN0ZJaVR3MzlhRVBiekxNMGx4MVhL?=
 =?utf-8?B?bEJkbm5CL3lnNUhtd0RMQ25IcTZkK3dFYVhhWnUyc0Y5TWxNdUpDM0xISjYz?=
 =?utf-8?B?cUZVdHpLSUNPckI2RWJUVm5xZm1zajN5YzJKVkJISEU4clpvbFdrZzRoRWU3?=
 =?utf-8?B?Um0vUzFwZHl6Rks0UE9QOFRUS01zeUhySDhqSndzVk5JZ0dsOVpnVGMwQVVE?=
 =?utf-8?B?RXU4dXFpMXg3L293MnBNMGthUlIyZUZ5bWw3VnI0SzVzZFpBOWgxUkFrRTU3?=
 =?utf-8?B?dStvd3RsaFBFVVdKUS9PZnJzd0lVUUx1WlF5azluamR4UHpuN1pNWEFuQmRm?=
 =?utf-8?B?QXdFRjlxUnVLdU8zaElYdnB5Ny9VRjh1Z2NONnRIajFrbGlMdnJTOWRCaEl6?=
 =?utf-8?B?aWFXWlFvK0Z0VFhzSktzcUF0cjRtcTZQa3BhbXM4V3dsUU40djNNZ3k3VzUw?=
 =?utf-8?B?QnJqa3Uyc2Npa2F4NTNPUVd2SVlkQ09RWmpOMzhSTU81QW1ocDVBKzVteHpm?=
 =?utf-8?B?b3pWSE13djlFNnRqYzNQbUF1TzFmQ3RCOGlxMnJCeXRpSmNlY21RTzNoZEdS?=
 =?utf-8?B?NDZNUzc1cVAyaHkrQkF0dHJxSFk4OVpBQlZYcElsVEh2aElJMEhwN2VOdkpi?=
 =?utf-8?B?ZXZxTkhzQ3VJOTVLTDYyTnkrNTBRdzg2WTRjUXhyU1E1Sld0UWlHZi9rSE0y?=
 =?utf-8?B?K2dRVG5PMVJDUDFITjA1ZVlqaGhULzBLUGlZQk9mbmk1TlZTcjYxWEEyRk1L?=
 =?utf-8?B?a3d6RjgwVmNRb0xVTGpNR01IWDQ0eGJjL3pQVy9Fcnh6TS9FUDhtWDBFQnEr?=
 =?utf-8?B?T3VVZWZCRk5NRisrMlpTV0s3bkRhbUp6LzhicmVxdXFMUnVDTXk0RGNZS0xY?=
 =?utf-8?B?bkQxSkNsY3h3NkMrWERmTTBSOTdDcTdJZ2JxZWpBdFp3SmVnYzRGdi9SckIw?=
 =?utf-8?B?OGJCQ0dTOWM2Q2ZJYlhUL3d4NzQ5ZU51Uk1ZVU9iR0FSRmV2NFMwOURNODBv?=
 =?utf-8?B?SXNjUXRsMUJMbGhrbW1leXpzNFJJSi95ZEZHNHI3K3l5Z0drOUFkRGR3Yzl1?=
 =?utf-8?B?T3E3aG1HdFpHS0w0ckVUTkViV3pHdXhrSU0yNGZiYkdNWmVvWEp4VHpYcVNh?=
 =?utf-8?B?S1RMOHgwQlUzZnQ1VTQ3NTQ5QVJWVHlzTU9OdkZHMzFyZTJ6NGQ1TmtwU3J0?=
 =?utf-8?B?V1hsYUJkQ21XWTk3MUdrUXpxaENwMUpyaWJCUHJlUHQ1YWx0VUQ0Y1RSQ3Fu?=
 =?utf-8?Q?s7Og=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7142099003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlMxeFozaGVxZG15OGRzSlFPTitaUU1ZOFUyc1poQXdkelRmNzh1WlQwcFJp?=
 =?utf-8?B?L1JTcS8zZGVkK0ozeGJJY1lsOXRmVlkvdEZQQk10ZVkvWTA5Q0xqcDNMKzUv?=
 =?utf-8?B?ZXpxczNuZjVWczA4WEV2UUZJbzNWSHlSYnlEZFhhcEZFOTk1RnI5dmlFeDcv?=
 =?utf-8?B?V0xua0lhVVR2K0tCdHM1TXRySWVXVU5DRS9NWFVQTHdjV0lqeVNsTW9jRkVv?=
 =?utf-8?B?RWt6MzExUEpBTy8xN29KcW9JY1E1RFRxNU1XOWdRaVNQaUpuOWVsMVhMMnl3?=
 =?utf-8?B?RWs1MDZCR3VaRk1ZSEE5azhZOWZJZk9saGFib2hudzFIU3hpUWt4S0dUYWJ2?=
 =?utf-8?B?NTF0WFRKcTh6RUxSWUxmTUx4T0RpOEZuMjNnTFl3NktMeFZKTjZacEw1R2Nu?=
 =?utf-8?B?SW9UYlJ0aC9yUEthdmlaYXREOGsveHdCMnp0RCtpTGRqSk83QWlqblFlMkRG?=
 =?utf-8?B?bUtCNGE2NFZnTWZqOGQ4cjVZSXZBemRpc1o2ODJrZEZ5dWEyS2l0aVZOcnRE?=
 =?utf-8?B?UCtwMXdLdXBxZVY0R1VQQTlLbHBvK3B3YnZiZGNHV1BWdU1TMW1YUGhYbUhz?=
 =?utf-8?B?NVZCM0VZUEZpbGhZeUExWS9Dd1Q3bGxvTW9qaTgwV0RTM1A2bHcwZkt0akYw?=
 =?utf-8?B?NzgvWFBWUDNiMnA4QVVhREltK0JXT2JocisraG1tQ2pERXAvUEhUK1VtcG52?=
 =?utf-8?B?QjBmYkJ1MGJaUFg5SllCZ0QzUGJoVmg4akVGZTNFcmVjODhGbXd5bHdVVmhr?=
 =?utf-8?B?blpJTzExaFA1dExXTmNxamh0Zk5aSTBDNW5pZFYyU05ScVRhMXRUNEtMQjZR?=
 =?utf-8?B?ZWFNLzcrYnduRG5GU3FIbUJzSGYwTnhMU3BBYWVJNGZSM3dDSWt6WWhLMGs1?=
 =?utf-8?B?RXRXak0xZlB4aDV4OUJBRXlXbFlOaHJnZWwxbWlxSm40RzJFY015Q2poRzFo?=
 =?utf-8?B?K2J5ajNoL0UxYTlTSGwwa2RuTUcrOEVnR1ZmeU9EM3Z1dnhzbC9aNXNVZHJM?=
 =?utf-8?B?TS9pb2hSei95V1QvV0xCeUVCYXNsNWN5dFZ0bGE5RFRuczR1R0YraXREYkNn?=
 =?utf-8?B?SjFmeEVRdWdYdVVwZFh6SUJGN0MrV1FhYUcwN1d6elV3NDI4blJCWnIyNk1q?=
 =?utf-8?B?MXZWOS8rcmxhZkhyWWxWcE9ZNUNsMHNmTG41YUxneEJHalFPV3NjZFROcE9I?=
 =?utf-8?B?alA4RlZyR2g3NGhPODBVWkZadWtZWmdyN2ZmSEM2aWtFQlo5eEQ5dGlwaFBu?=
 =?utf-8?B?MUcxbmFYTDFDRDJ6dXNLWE1tQ3Zxem5CdTJmbzNJR2cyaHlaaWR1a2xEcStG?=
 =?utf-8?B?L1Y4QXhCRmFld2g0MFpCQXpsSEpMVFlYWDhnS05JMlpQcWxjQjBTb2phK3R4?=
 =?utf-8?B?QzNaVDVPNkowaURSb1VzbEVoaVlEc1A0Rm1vNksvQXlhSHJ1dWNMSnY5ZTRS?=
 =?utf-8?B?NWRVU0k0NjUxMGtlNGx0dSsyZEVRbmc5RjZ6R1A4SzRLMnNyR01XaWlvSlZo?=
 =?utf-8?B?bHcrbDYvNXc4VnFXQTI1UmJ3STFEYTA0RGIxaW9zdlVEbDRYdjVtYWVOcUx5?=
 =?utf-8?B?RndZdUtFMUIwcDRQd1cvUStXckw0aTUydGFoeUNwRHRLWmMyMVhaNHBURW9P?=
 =?utf-8?B?ZGtSMnB4YlhLaWs2c2xvYTRZYVA5OEZ6T3BWWG5FVnozRXdKMkVvT3RnTERR?=
 =?utf-8?B?dDJyRVVQWkxCTWJ1T1ppeXJPYXhWUk5rMFBwd2JnT3M2YmFIazFVTkpGUlN2?=
 =?utf-8?B?a1JXVC91UDdncytpdkcraEdLQWV2enliUkh3OHlUa2xqRFloODgzeU94em8y?=
 =?utf-8?B?SjBCQUdtWENzbmdIbm9oVkdOZ1N2dTRsZWtMUkRXTHZMYUdXcEFGRW1TSE0r?=
 =?utf-8?B?Z09IOGdySk1Sa0QyR1RtVlJqTXI5YU5SRTY0RENvOEY0UWxHUHBtK0s2ZU5n?=
 =?utf-8?B?Yis2THUzZUJqb2E0aVhnVGpndGRxcXJpdE5vZU0zVW4yOXJyelNLdDZRSVFv?=
 =?utf-8?B?bnBXeERmNXQ3Zjk5UlRnVlUwSXBleVdXemlQc3QvQVlFa1ZxTnR1VlNWQTht?=
 =?utf-8?B?eExBSXZIWnB5ZVREOXhNOVVVY0xna3JJWUxoOCtoV0Zid2s5aHFHb1ltQmd0?=
 =?utf-8?B?TlZQQ3JoK1N2Q0hCWlFmOENUVWFpZDdzOEtmU0p2dUpYQTJHbnNGMVhncFBu?=
 =?utf-8?B?N0VFTFZrWjNBQmZOSlVDUlJvc3d0ajMwZGIrTTB4WDZqVUg5dFB5Qld3cmll?=
 =?utf-8?B?cE1FVkZGZEswbnhNMGZRLzdXcHRGSCtxMFM4Tk95ZnM3ZDVyS0h0RkR6SjVh?=
 =?utf-8?B?bWFXQXQ4eTRLMUdNSUVYZ3Zjd2NGS2hxOG1FdFRTL0Z1aEJJUzZndz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46766cab-c9d5-498e-c196-08de54072668
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:24:42.2301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zf/5f9so4/PBdTJV+ZlU31H0mKKRr/02OdCYvdMTjvqIkvlvSc2EgdSAw1LCZjPngcEonVmWoN/qWUXa2Hr8hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF6CF64E2E6
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

On 11/25/2025 11:23, Marcin Bernatowicz wrote:
> Introduce igt_sysfs_choice, a lightweight, fixed-size, no-malloc helper
> for parsing and formatting sysfs "choice" attributes of the form:
>
>      "low [normal] high\n"
>
> The helper provides parsing, lookup, formatting, mask conversion, and
> intersection utilities for consistent handling of enumerated sysfs values.
>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   lib/igt_sysfs_choice.c | 429 +++++++++++++++++++++++++++++++++++++++++
>   lib/igt_sysfs_choice.h |  52 +++++
>   lib/meson.build        |   1 +
>   3 files changed, 482 insertions(+)
>   create mode 100644 lib/igt_sysfs_choice.c
>   create mode 100644 lib/igt_sysfs_choice.h
>
> diff --git a/lib/igt_sysfs_choice.c b/lib/igt_sysfs_choice.c
> new file mode 100644
> index 000000000..c6de62587
> --- /dev/null
> +++ b/lib/igt_sysfs_choice.c
> @@ -0,0 +1,429 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#include "igt_sysfs_choice.h"
> +#include <ctype.h>
> +#include <errno.h>
> +#include "igt_core.h"
> +#include "igt_sysfs.h"
> +
> +#define IGT_SYSFS_CHOICE_MAX_LEN 256
> +#define IGT_SYSFS_CHOICE_MAX_TOKENS 16
> +
> +/**
> + * igt_sysfs_choice_parse() - parse sysfs enumerated choice buffer
> + * @buf: NUL-terminated buffer with sysfs contents

typo: NULL

> + * @choice: output descriptor, must be non-NULL (can be zeroed)
> + *
> + * Parses a sysfs enumerated choice buffer, e.g.:
> + *
> + *	"low [normal] high\n"
> + *
> + * into a token list and the index of the selected token.
> + *
> + * Parsing rules:
> + *  - tokens are separated by ASCII whitespace
> + *  - exactly one token must be wrapped in '[' and ']'
> + *  - surrounding '[' and ']' are stripped from the selected token
> + *  - empty tokens are treated as malformed input
> + *
> + * On entry, any previous contents of @choice are freed.
> + *
> + * Returns:
> + *  0        on success,
> + *  -EINVAL  malformed format (no tokens, no selected token, multiple
> + *           selected tokens, unterminated '[' or ']'),
> + *  -E2BIG   on too many tokens or too small choice buffer size.
> + */
> +int igt_sysfs_choice_parse(const char *buf, struct igt_sysfs_choice *choice)
> +{
> +	char *p, *tok_start;
> +	bool selected_seen = false;
> +	size_t num_tokens = 0;
> +	int n, selected = -1;
> +	bool is_selected;
> +
> +	igt_assert(buf && choice);
> +
> +	memset(choice, 0, sizeof(*choice));
> +	n = snprintf(choice->buf, sizeof(choice->buf), "%s", buf);
> +	if (igt_debug_on(n < 0))
> +		return -EINVAL;
> +	if (igt_debug_on((size_t)n >= sizeof(choice->buf)))
> +		return -E2BIG;
> +
> +	choice->num_tokens = 0;
> +	choice->selected = -1;
> +	p = choice->buf;
> +
> +	while (*p) {
> +		/* skip leading whitespace */
> +		while (*p && isspace((unsigned char)*p))
> +			p++;
> +		if (!*p)
> +			break;
> +
> +		is_selected = false;
> +		tok_start = p;
> +
> +		if (*p == '[') {
> +			is_selected = true;
> +			p++;
> +			tok_start = p;
> +
> +			if (selected_seen) {
> +				igt_debug("choice-parse: multiple [selected] tokens: \"%s\"\n",
> +					  choice->buf);
> +				return -EINVAL;
> +			}
> +			selected_seen = true;
> +		}
> +
> +		/* walk until ']' or whitespace */
> +		while (*p && !isspace((unsigned char)*p) && *p != ']')
> +			p++;
> +
> +		if (is_selected) {
> +			if (*p != ']') {
> +				igt_debug("choice-parse: unterminated '[' in: \"%s\"\n",
> +					  choice->buf);
> +				return -EINVAL;
> +			}
> +		}
> +
> +		/* terminate token */
> +		if (*p) {
> +			*p = '\0';
> +			p++;
> +		}
> +
> +		if (!*tok_start) {
> +			igt_debug("choice-parse: empty token in: \"%s\"\n",
> +				  choice->buf);
> +			return -EINVAL;
> +		}
> +
> +		if (num_tokens >= IGT_SYSFS_CHOICE_MAX_TOKENS) {
> +			igt_debug("choice-parse: too many tokens (>%d) in: \"%s\"\n",
> +				  IGT_SYSFS_CHOICE_MAX_TOKENS, choice->buf);
> +			return -E2BIG;
> +		}
> +
> +		choice->tokens[num_tokens] = tok_start;
> +		if (is_selected)
> +			selected = (int)num_tokens;
> +
> +		num_tokens++;
> +	}
> +
> +	if (!num_tokens) {
> +		igt_debug("choice-parse: no tokens in string: \"%s\"\n",
> +			  choice->buf);
> +		return -EINVAL;
> +	}
> +
> +	if (selected < 0) {
> +		igt_debug("choice-parse: missing selected token ([...]) in: \"%s\"\n",
> +			  choice->buf);
> +		return -EINVAL;
> +	}
> +
> +	choice->num_tokens = num_tokens;
> +	choice->selected = selected;
> +
> +	return 0;
> +}
> +
> +/**
> + * igt_sysfs_choice_read() - read and parse a sysfs enumerated choice attribute
> + * @dirfd: directory file descriptor of the sysfs node
> + * @attr: attribute name relative to @dirfd
> + * @choice: output descriptor, must be non-NULL
> + *
> + * Reads the given sysfs attribute into a temporary buffer and parses it.
> + *
> + * Returns:
> + *  0 on success,
> + *  negative errno-style value on read or parse error.
> + */
> +int igt_sysfs_choice_read(int dirfd, const char *attr,
> +			  struct igt_sysfs_choice *choice)
> +{
> +	char buf[IGT_SYSFS_CHOICE_MAX_LEN];
> +	int len;
> +
> +	len = igt_sysfs_read(dirfd, attr, buf, sizeof(buf) - 1);
> +	if (len < 0)
> +		return len;
> +
> +	buf[len] = '\0';
> +
> +	return igt_sysfs_choice_parse(buf, choice);
> +}
> +
> +/**
> + * igt_sysfs_choice_selected - Return selected token string

Formatting: missing ()

> + * @choice: Parsed choice
> + *
> + * Returns:
> + *   Pointer to the selected token string, or NULL if no valid selection.
> + */
> +const char *igt_sysfs_choice_selected(const struct igt_sysfs_choice *choice)
> +{
> +	if (!choice || choice->selected < 0 ||
> +	    (size_t)choice->selected >= choice->num_tokens)
> +		return NULL;
> +
> +	return choice->tokens[choice->selected];
> +}
> +
> +/**
> + * igt_sysfs_choice_to_string - Render a parsed choice into string

Formatting: missing ()

> + * @choice:   Parsed choice (tokens[] + selected index)
> + * @buf:      Output buffer for formatted string
> + * @buf_sz:   Size of @buf in bytes

Formatting: only in this function it's aligned this way

> + *
> + * Formats the given @choice into the string:
> + *
> + *     "low [normal] high"
> + *
> + * Tokens are emitted in the order stored in @choice->tokens.  The
> + * selected token (choice->selected) is wrapped in '[' and ']'.
> + *
> + * Returns:
> + *   @buf on success, or NULL if @buf_sz is too small or arguments are invalid.

Maybe better to use meaningful errors instead?

> + */
> +const char *igt_sysfs_choice_to_string(const struct igt_sysfs_choice *choice,
> +				       char *buf, size_t buf_sz)
> +{
> +	bool first = true;
> +	size_t pos = 0;
> +	int n;
> +
> +	if (!choice || !buf || !buf_sz)
> +		return NULL;
> +
> +	for (size_t i = 0; i < choice->num_tokens; i++) {
> +		const char *name = choice->tokens[i];
> +		bool is_selected = (choice->selected == (int)i);
> +
> +		if (!name)
> +			continue;
> +
> +		n = snprintf(buf + pos, buf_sz - pos,
> +			     "%s%s%s%s",
> +			     first ? "" : " ",
> +			     is_selected ? "[" : "",
> +			     name,
> +			     is_selected ? "]" : "");
> +
> +		if (n < 0 || (size_t)n >= buf_sz - pos)
> +			return NULL;
> +
> +		pos += (size_t)n;
> +		first = false;
> +	}
> +
> +	return buf;
> +}
> +
> +/**
> + * igt_sysfs_choice_find() - find token index by name
> + * @choice: parsed choice struct
> + * @token: token to look for (plain name, without '[' / ']')
> + *
> + * Performs a case-sensitive comparison of @token against entries in
> + * @choice->tokens.
> + *
> + * Returns:
> + *  index in [0..choice->num_tokens-1] on match,
> + *  -1 if @token is not present or @choice/@token is NULL.
> + */
> +int igt_sysfs_choice_find(const struct igt_sysfs_choice *choice,
> +			  const char *token)
> +{
> +	if (!choice || !token)
> +		return -1;
> +
> +	for (size_t i = 0; i < choice->num_tokens; i++)
> +		if (!strcmp(choice->tokens[i], token))
> +			return (int)i;
> +
> +	return -1;
> +}
> +
> +/**
> + * igt_sysfs_choice_to_mask() - map parsed tokens to bitmask + selection
> + * @choice: parsed choice struct
> + * @names: array of known token names
> + * @names_sz: number of elements in @names
> + * @mask: output bitmask of supported names (BIT(i) => names[i] supported)
> + * @selected_idx: output index of selected token in @names, or -1 if selected
> + *                token is not among @names
> + *
> + * Builds a bitmask of known tokens present in @choice and identifies the
> + * selected token, if it matches one of @names.
> + *
> + * Unknown tokens do not cause an error; they are ignored and not
> + * reflected in @mask. This keeps the API "loose": tests can still
> + * validate required choices while tolerating additional values.
> + *
> + * Returns:
> + *  0        on success,
> + *  -EINVAL  on bad input parameters.
> + */
> +int igt_sysfs_choice_to_mask(const struct igt_sysfs_choice *choice,
> +			     const char * const *names, size_t names_sz,
> +			     unsigned int *mask, int *selected_idx)
> +{
> +	unsigned int m = 0;
> +	int sel = -1, idx;
> +
> +	if (!choice || !names || !mask)
> +		return -EINVAL;
> +
> +	for (size_t i = 0; i < names_sz; i++) {
> +		const char *name = names[i];
> +
> +		if (!name)
> +			continue;
> +
> +		idx = igt_sysfs_choice_find(choice, name);
> +		if (idx >= 0) {
> +			m |= 1u << i;
> +			if (idx == choice->selected)
> +				sel = (int)i;
> +		}
> +	}
> +
> +	*mask = m;
> +	if (selected_idx)
> +		*selected_idx = sel;
> +
> +	return 0;
> +}
> +
> +/**
> + * igt_sysfs_choice_format_mask - Format a bitmask as a space-separated list of names
> + * @buf: Output buffer
> + * @buf_sz: Size of @buf in bytes
> + * @names: Array of token names indexed by bit position (0 -> names[0], etc.)

I don't think (0 -> names[0], etc.) is necessary. The same applies for 
descriptions above and below.

> + * @names_len: Number of elements in @names

In function above you named it names_sz.

> + * @mask: Bitmask of available tokens (BIT(i) => include names[i])
> + * @selected_idx: Index to highlight with brackets, or <0 for none
> + *
> + * Builds a space-separated list of all bits set in @mask, mapping bit positions
> + * to names in @names. If @selected_idx >= 0 and that bit is set, the token is
> + * wrapped in brackets, e.g. "low [normal] high".
> + *
> + * Unknown / missing names[i] expand as "?".

Shouldn't it be treated as wrong input?

> + * Empty mask results in an empty string.
> + *
> + * Returns: @buf on success, or NULL on invalid arguments.
> + */
> +const char *igt_sysfs_choice_format_mask(char *buf, size_t buf_sz,
> +					 const char * const *names,
> +					 size_t names_len,
> +					 unsigned int mask,
> +					 int selected_idx)
> +{
> +	char *p = buf;
> +	size_t n = buf_sz;
> +	bool first = true;
> +	size_t idx = 0;
> +
> +	if (!buf || !buf_sz || !names || !names_len)
> +		return NULL;
> +
> +	while (mask && idx < names_len) {
> +		if (mask & 1u) {
> +			const char *name = names[idx] ?: "?";
> +			bool highlight = ((int)idx == selected_idx);
> +			int written;
> +
> +			written = snprintf(p, n, "%s%s%s%s",
> +					   first ? "" : " ",
> +					   highlight ? "[" : "",
> +					   name,
> +					   highlight ? "]" : "");
> +			if (igt_warn_on(written < 0 || written >= (int)n)) {
> +				buf[buf_sz - 1] = '\0';

Similarly, why not returning errors?

> +				break;
> +			}
> +
> +			p += written;
> +			n = buf_sz - (p - buf);
> +			first = false;
> +		}
> +
> +		mask >>= 1;
> +		idx++;
> +	}
> +
> +	if (first)
> +		buf[0] = '\0';
> +
> +	return buf;
> +}
> +
> +/**
> + * igt_sysfs_choice_intersect - Restrict a choice set to tokens common with another
> + * @dst:   Choice to be updated in place
> + * @other: Choice providing the allowed tokens
> + *
> + * Computes the intersection of the token sets in @dst and @other.
> + * The resulting @dst contains only tokens that appear in both choices,
> + * preserving their original order from @dst.
> + *
> + * If the previously selected token in @dst is still present after
> + * intersection, its index is updated accordingly.  If it is not present,
> + * @dst->selected is set to -1.
> + *
> + * Returns:
> + * * 0        - success
> + * * -EINVAL  - invalid arguments
> + * * -ENOENT  - no common tokens
> + */
> +int igt_sysfs_choice_intersect(struct igt_sysfs_choice *dst,
> +			       const struct igt_sysfs_choice *other)
> +{
> +	char *new_tokens[IGT_SYSFS_CHOICE_MAX_TOKENS];
> +	const char *selected_name;
> +	int new_selected = -1;
> +	size_t new_n = 0;
> +
> +	if (!dst || !other)
> +		return -EINVAL;
> +
> +	selected_name = (dst->selected >= 0 && dst->selected < dst->num_tokens) ?
> +			 dst->tokens[dst->selected] : NULL;
> +
> +	for (size_t i = 0; i < dst->num_tokens; i++) {
> +		char *tok = dst->tokens[i];
> +
> +		if (igt_sysfs_choice_find(other, tok) < 0)
> +			continue;
> +
> +		new_tokens[new_n] = tok;
> +
> +		if (selected_name && !strcmp(tok, selected_name))
> +			new_selected = (int)new_n;
> +
> +		new_n++;
> +	}
> +
> +	if (!new_n) {
> +		dst->num_tokens = 0;
> +		dst->selected = -1;
> +		return -ENOENT;
> +	}
> +
> +	for (size_t i = 0; i < new_n; i++)
> +		dst->tokens[i] = new_tokens[i];
> +
> +	dst->num_tokens = new_n;
> +	dst->selected = new_selected;
> +
> +	return 0;
> +}
> diff --git a/lib/igt_sysfs_choice.h b/lib/igt_sysfs_choice.h
> new file mode 100644
> index 000000000..a8a7e813a
> --- /dev/null
> +++ b/lib/igt_sysfs_choice.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#ifndef __IGT_SYSFS_CHOICE_H__
> +#define __IGT_SYSFS_CHOICE_H__
> +
> +#include <stddef.h>
> +#include <stdbool.h>
> +
> +#define IGT_SYSFS_CHOICE_MAX_LEN    256
> +#define IGT_SYSFS_CHOICE_MAX_TOKENS 16
> +
> +/**
> + * struct igt_sysfs_choice - parsed sysfs enumerated choice attribute
> + * @tokens:      array of token strings
> + * @num_tokens:  number of entries in @tokens
> + * @selected:    index of the active token in @tokens, or -1 if invalid
> + *
> + * This struct represents a sysfs enumerated choice attribute, for example:
> + *
> + *	"low [normal] high\n"
> + *
> + * After parsing, @tokens point to "low", "normal", "high" and
> + * @selected will be 1 (the index of "normal").
> + */
> +struct igt_sysfs_choice {
> +	char    buf[IGT_SYSFS_CHOICE_MAX_LEN];
> +	char   *tokens[IGT_SYSFS_CHOICE_MAX_TOKENS];
> +	size_t  num_tokens;
> +	int     selected; /* index into tokens[], or -1 */
> +};
> +
> +int igt_sysfs_choice_parse(const char *buf, struct igt_sysfs_choice *choice);
> +int igt_sysfs_choice_read(int dirfd, const char *attr,
> +			  struct igt_sysfs_choice *choice);
> +const char *igt_sysfs_choice_selected(const struct igt_sysfs_choice *choice);
> +const char *igt_sysfs_choice_to_string(const struct igt_sysfs_choice *choice,
> +				       char *buf, size_t buf_sz);
> +int igt_sysfs_choice_find(const struct igt_sysfs_choice *choice,
> +			  const char *token);
> +int igt_sysfs_choice_to_mask(const struct igt_sysfs_choice *choice,
> +			     const char *const *names, size_t names_sz,
> +			     unsigned int *mask, int *selected_idx);
> +const char *igt_sysfs_choice_format_mask(char *buf, size_t buf_sz,
> +					 const char *const *names,
> +					 size_t names_sz, unsigned int mask,
> +					 int selected_idx);
> +int igt_sysfs_choice_intersect(struct igt_sysfs_choice *dst,
> +			       const struct igt_sysfs_choice *other);
> +
> +#endif /* __IGT_SYSFS_CHOICE_H__ */
> diff --git a/lib/meson.build b/lib/meson.build
> index 707ce6ff9..604ffd782 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -44,6 +44,7 @@ lib_sources = [
>   	'igt_stats.c',
>   	'igt_syncobj.c',
>   	'igt_sysfs.c',
> +	'igt_sysfs_choice.c',
>   	'igt_sysrq.c',
>   	'igt_taints.c',
>   	'igt_thread.c',
