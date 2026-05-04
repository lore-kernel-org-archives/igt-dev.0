Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6D8FF885A
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 08:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB4C10E0B0;
	Mon,  4 May 2026 08:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQCwy2kw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A91710E0B0
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 08:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777883571; x=1809419571;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=j1RtN5Oc9RUZjudVayRfO/2e+AZ3el3ZrcroYr7ue6s=;
 b=RQCwy2kwmTaEAjhYbSzv8Rm6tvNJVhb6GceSkKdIdj8I2fwBfKHNPWkJ
 2PJ0MC5GqEtiMdI/W7c3pIoALsHlSvbdohRNDEN5/YIK63xaxvPL+DpsN
 1olOnwJjzvVz/wWAprBEOAAP3av1OChlzJjnQ9E7oMskShotC5LU/G2EK
 KYqHYc3RBzwI+KcgKVkfQoWurq4NyPWAKnwIOMZxgD8hBCm2ShiNFcpTM
 FPfGJnORyYW8PeeJJc9YnX3+ZT4yMeZor9+PnHxGDAkqMlCnxdqQZefBv
 5LBlcyNNY/I3bzzeOVN6F62P85tFbg6n8+bo+XImCygKBKz8IkYLYrqyx w==;
X-CSE-ConnectionGUID: rWPCaZa3QbOMRXRirzFS1g==
X-CSE-MsgGUID: sH3B1Z4WTiSRbPVososE5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="81305067"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208,217";a="81305067"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 01:32:51 -0700
X-CSE-ConnectionGUID: 6pv2ToTcR2mCJQOd9C8mdQ==
X-CSE-MsgGUID: mUNIwY+YTrmVFv06vB/7XQ==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 01:32:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 01:32:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 01:32:49 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 01:32:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrYzRPSp+M+AozLYOkaCVJFR8VoQUvepnjjZ/QGMi/Fgzvx1rO4S5O0Jvf02d1Zl5i9NvFbmw372Hf2dYesyqRMu/rgOAVWGPZASDd+09bXd3JJS361ZzEf8LYFli/VW0JRJV7693e7paWfzJfj3btewKpn+86E1oEg+kVG1HqffqaB8QyqOaXqyvolzlDbA+BpsSsOo0hUrvMC0lz05o3djdZ9Y4gt9XcpNRUWCq2iuFs5vJIzNwrfN30PsQiHbGjNhgLEVWSlGG0m7Fm++KsC/fyshYyMbCeUROzpPEDfDvtaiWFGDQ4OcC6YWddkmjX68o9G98Yrgum0GI3F4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ulI+T5gKbmzGoES5NP7IKllELkxTXXmmrvQTZu8LTI=;
 b=T0T+OGezsh/agO5x09VvqDgfOFaDCvA2591yFLtAc6H2hGW6dLYtZaBnHEy35mM+gEAC69qcK6BlzkYjXDuaZ4aGgtnswBOQqYHegb5VuVWNL9QTHuSIRlN+c0cj58HeXCvlmzhcZnNVb6GBmB/Dmpp24O6SU/0IkDdFwNaL/8qJE7Ocguik+L9x41gPQRZIpQSBfVbaYPY+7cdFSSFHEgSKXByVp4Eg1xW1Yb5peln5IsOuPvyip2L0lg+miNOvhegkx3h0Nx4lSnOmxLiOmy/Gsiyl+x4Bqs7I96trn7sAgXSY+/4VB32RHw9RiNhFgDtGkB2CL0Km7xnJJEQGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SABPR11MB9963.namprd11.prod.outlook.com (2603:10b6:806:509::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 08:32:46 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 08:32:46 +0000
Content-Type: multipart/alternative;
 boundary="------------nKtHhg40JQZT31IPt04xGflo"
Message-ID: <2b0203e2-30de-4954-92ca-051b04c0fe4a@intel.com>
Date: Mon, 4 May 2026 14:02:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/kms_invalid_mode: Allow clock-too-high test on
 non-Intel platforms
To: Manasi Navare <navaremanasi@google.com>, Fei Shao <fshao@chromium.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, <igt-dev@lists.freedesktop.org>, 
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Jani <jani.nikula@intel.com>, Paul-PL Chen
 <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20260415015132.2297990-1-jason-jh.lin@mediatek.com>
 <CAC=S1nhr7DFMN-e794MGXp7Nv+LDTQcO4QqG-79XiotFVC7stQ@mail.gmail.com>
 <CAMNLLoQJ3w80Art1VkvYoh4duM5HY2skEH8gztG4TQBWJaUHrg@mail.gmail.com>
 <CAMNLLoQSwnMz_-u2PqTDRM2qVXp=hxwXak5HFnCUqvpbMRVTDg@mail.gmail.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <CAMNLLoQSwnMz_-u2PqTDRM2qVXp=hxwXak5HFnCUqvpbMRVTDg@mail.gmail.com>
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SABPR11MB9963:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e7bdad4-7fe9-4977-f3d0-08dea9b7b6fb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|42112799006|376014|7416014|8096899003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: esvSuSQBilNWqCtKZBmT0bLSzy8esi3e/yaG1vRBnj9NPAP+86QqU1acxvHmFmCkHPMC4xITN7/U5MBf9BhoQprxW8si2z+Zm7rFhH+33ZmTLCDXw4i3EcQnysOA/0GmrnHEvk+r7+qtVvsuMNJGFyZmAYRFViXyCWqCpCob9zcE0JWhN9amDMJWL7959SzW6xFcBI5Ndrs1RrjrK+JgwHllbEsRp4JCA+IW5sKQwSFQUE1dk73XoByKHdKTiAnuBOJXVEcZlqC4NrlWCHQyBSwh0H6DDsKH7w7NI3IitHndrvl2m6APfWYBcQYB7As0acCJl/byF5NxOTlDPxdEtv1A4sfI9TzSaoaLcCvyVgVNwcbrR5VEWQ2Lan4jNJ3G3J/rqM1y8fCBp/Ur2t+L/SmFj/xj4CkUcBDZZvDOK5+uFxKPPtUs6+nlMxuc9/5HAt/yB2tjDaWeJ8Qkw8uuWYxuM/lmIkFZTCny31OLjphs44au5oEzixhauBd2uU3k8t4V3PngpKMlekOIbdAHi0BxJoG5THT82UVx5x0iyn9t9bxE90x21W+LSflkAhdaPDlQcIkySctC6ADExuKIBUzaOJoFWh9aPNwvZmffVyIXMPtXm1n95AsRZ1gtduwiMaFJ5IvScRwQjkHv3o2QnF4m6ur+WdQhyciCMtGGyr6to9Kva0RNLeYY7twM/cVD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(7416014)(8096899003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3NoazlDV0lnUmp2TG1VVGJJVWtkbkFzdWJscjkyMWVQNCtGZy9TL1B1QmU3?=
 =?utf-8?B?ZEc3UFZIaVE1SnFRamVVb29HMmNGdko1NXZIMFg2SFJua2VwM3JwbjZncmow?=
 =?utf-8?B?elF3SDhOZS83T1Q1aHdZZmZpL245eGdWRUhhOUU0UVIwVXNPdURlM1NrbEhH?=
 =?utf-8?B?M1pGV2VTNzJNZ3g4bE1sQis2VklCMDZVdytZY1BkUnVaam9RelAyVkFaZ1Nr?=
 =?utf-8?B?dXg5bDBSVS8zTFpJUVV6c1RSZG9HNCsvb2NMSkRuM2JCbXYvdENkUHk0cnhI?=
 =?utf-8?B?Tkd1aWIwNHNNWmtGMldGS1Z6SWFmeWxSQjF0cFptZXQxeUVWM1FGczFBOG8v?=
 =?utf-8?B?aDc4QmlKeHFyY1JCdGNHaTNJZnhtTXU5aVBmNHBvamgyOW84WTNoT0F0V2Fh?=
 =?utf-8?B?YU5qWm9pTk1iMjZZUnVnTXBmandPdVNxMkM4Qmh2V0N5a2FMUDB1ZTZBQ3Br?=
 =?utf-8?B?Y1Z6clViYzUwWlcvcWh4RXIrTnl4OCtmQU5QenRERUFBTUZsT0FPRUtmcFI1?=
 =?utf-8?B?U0NnNlUybVBtY0tVdTF1VHRSNEFmYVJqNURiWTFaMDI0MGY3cTJEdGQ5TStZ?=
 =?utf-8?B?bmRncGIyK0VYWjB1aXdkdmova3pEMFJUZlVrc3lDN2xLZ3d5RU1BUHg0OHRD?=
 =?utf-8?B?QUd0YTI5N3ZoeEFZa1NoWFNCSkhkOTV4eTcxS2VIUjl2cU0vSnAvckptUDNq?=
 =?utf-8?B?T3RSZXltNjRMajB1VTZyYjlnUFlScmRqbG9Sc3N4VHFVTHlBcmhETXY2dE5N?=
 =?utf-8?B?VEVaYWxKYkVLQmxDUUZxcmZCdkZoT1dZaVlxRlA4clBjTXZnUzZ4VU1UYStS?=
 =?utf-8?B?Qk54alEyZUI2QjRrT3JwOGltYTJwb0pOT0hMMnlOcFJzcTQxb2lJbERxaU51?=
 =?utf-8?B?OTlhSENHbGhDZmVLdC9SZ0ErN3ZVQzN6ODlTaXcyK1RsVmlqMUZCZ05wWHlX?=
 =?utf-8?B?VWR5cVhHdS9yaC9pTUhVa0wrRzhFWUQvOUdvK0h3bURyaGs3NFEybHQ2YkdS?=
 =?utf-8?B?UkZweU91eFJLQVA4dGxhZjlMZDg4TDIrUUtYcnJBTUpxQ2tsb21lSGRjVmd6?=
 =?utf-8?B?QlpsNE9ja09ZUE9Eb28waFZpbDdGM3IxNEFOdjJldjlKcDlBTGlsRlZhK3Q0?=
 =?utf-8?B?RWZQc280MURWVjU4TnM4SHJaWmtMN3NBbldBNzYybFFqV2pZYUJpQ1FSTnVz?=
 =?utf-8?B?Wk9iTWRLeU9oOUk4MHNnQjFhR2wwalR2U0poZE1wK0U2MlRjdW1KMnhEcWpU?=
 =?utf-8?B?enFUWi9XY2J3OHBIVjdSVFFtMDY1YndRRFR1SkNoNVlpYUhJbkowM3dBU2VO?=
 =?utf-8?B?dVpkRlNyMGc3dC9FMzRvaExIWHR2MkF0SHJ3RDZnWHg5cDlmbEpObUNCVXZP?=
 =?utf-8?B?UXgvS0tOOVNZNEpaNUZ5MFVEQlVXZ3U2bnBXTklHNFdxcmVINkpsYWRxc3ha?=
 =?utf-8?B?WXNxMDcxSUVPNmpOOVNWU2t1Wi8rZzBqcHRtQ3lmTXVzUTJ5SGhVanpTY3E2?=
 =?utf-8?B?UXdvNTJlajhEUHh4ME5QQVdQeWhRdEM4K2pvR1l1RDFIbURBRk9xV2xhc1Bp?=
 =?utf-8?B?Zk42NU9qZlhqdDVlQVRhY1VlanFyeTdoY3lWOXZzNVhHbTJTaVI4U3d5RnBW?=
 =?utf-8?B?Y2xjdzhleVlVMkl1TWpLRnhqT1U2YXJuZzN2K1VacFhpVlBUM3lReUNXQ29a?=
 =?utf-8?B?cWp0TWtiY1JJNnZDZkJhMXIzb09jSkMySEpnbWxnUXpubi9sdC9xd01md0ow?=
 =?utf-8?B?WnFLN3Nrb2FTR0I4SDIyYk9BeStlbXkrcjBnQzRpRjVKR0pPOVlrTlc2eDRZ?=
 =?utf-8?B?VkNoZkl1ZmtkNE1zQ2ZzNmdhLzdxRUJsdzZsOStjK29XazI0UDV3d1hqODd5?=
 =?utf-8?B?ZmdadW82dklBSkk2SXZXaEh1bUd2VWNLTjdseWVKdEVJRFVPdVJHa2VsZ3BB?=
 =?utf-8?B?SUZKckdha1NmMkllVXZOZFVGVlRva28xT2l5SUNjTUtlQXU2S1lxZDlLcDR5?=
 =?utf-8?B?dUxQWFNwYjRnZHdMS1VlbWZpZjQ2R0ZZeE5vTUk0cmo3QVpIVHdwQk5nKzVS?=
 =?utf-8?B?eW9ZT1JxWDg5VTJtdFZaTFhnMUcwVjFPNE56R3hXN2JUTzg4UWtmRzRHNFRE?=
 =?utf-8?B?cE5XRVAzVlpkUi84OElBTzl2NzZxQ1hRa3RsZURSenczL1V4enM2V0dlKytx?=
 =?utf-8?B?bWFPRTNqMjBYWW8ya0ZmNmhHWE5rU051T0Juby9aR0JvaXhuVWtkTWxDcVJa?=
 =?utf-8?B?bW1PbUM4K3o4M1lKMEVtenkyZ2x6UXNQdWVkVzZMOHBYVXdtL053U1h4V2xE?=
 =?utf-8?B?aFg2YVdoNHJGQjlPZEw4Zk83MGhKb3k2cUNYbDVPaTJDTmQ4Q0prUT09?=
X-Exchange-RoutingPolicyChecked: ax4fDJXyc3Y7wupPdnxYfuyAFQ84LNk+nkJCJfCQ3Qo5u8sPEmsVtcbARvsJUjzi475UhPuX9xjln3UAMSyHiTdlzrx11JAq0WdvP7FhfzLONb+HfLSDdFxA1fGx7/APxNdHNoXQe8/9TtM4xRlYRhOkaEpz8WSVNjh3jlxt6IpJkG4i+wdqks/8bNOKHXdd2ajxJqBuBm6efhkYLdFIAgGRnb/e4xJAY3ouPFs5mRmBDMbdQ6izONZwlSriqnwMrMG/hUnsBO7oUVycctb7gISz6hUHoLJAs5u3AflJgojLTFwLal9Ju3bfTswgY/xQA47isgdyy+v7sMHZFiujHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7bdad4-7fe9-4977-f3d0-08dea9b7b6fb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 08:32:45.9988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ykb56rDZjP3rDPc2xkEdH2qpl7TREwF2yHQXqlpaJdfmNPnGVOx6P67etmVDYfwNzv1OiQAj6fQNRmGwHrtlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR11MB9963
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

--------------nKtHhg40JQZT31IPt04xGflo
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Manasi,

On 5/1/2026 4:31 AM, Manasi Navare wrote:
> Hi @Karthik B S <mailto:karthik.b.s@intel.com> @Jani Nikula 
> <mailto:jani.nikula@intel.com> :
>
> Signal boosting this, we have reviewed this patch and verified for the 
> MTK driver,
> Could you please take a look and  help on getting this upstreamed?

Sure, this LGTM and CI is also fine. Will merge this.

Regards,
Karthik.B.S
>
> Regards
> Manasi
>
> On Wed, Apr 29, 2026 at 1:37 PM Manasi Navare 
> <navaremanasi@google.com> wrote:
>
>     Thanks for the patch and for addressing Jani's comments.
>     This looks good to me.
>
>     Reviewed-by: Manasi Navare <navaremanasi@google.com>
>
>     @Jani Nikula <mailto:jani.nikula@intel.com> @Karthik B S
>     <mailto:karthik.b.s@intel.com>  Would you be able to help land
>     this upstream, its required
>     to run this test on non intel platforms and review comments from
>     Jani have been addressed.
>
>     Thanks a lot for your help on landing this.
>
>     Regards
>     Manasi
>
>     On Thu, Apr 16, 2026 at 9:04 PM Fei Shao <fshao@chromium.org> wrote:
>
>         On Wed, Apr 15, 2026 at 9:51 AM Jason-JH Lin
>         <jason-jh.lin@mediatek.com> wrote:
>         >
>         > The clock-too-high subtest was being skipped on non-Intel
>         platforms
>         > because igt_get_max_dotclock() returns 0 when reading from
>         > Intel-specific debugfs fails.
>         >
>         > This change allows the test to run on all platforms by using
>         -1 as an
>         > invalid clock value when max_dotclock is unavailable. The -1
>         converts
>         > to UINT_MAX for unsigned int, which clearly exceeds any
>         reasonable
>         > hardware limit and should be rejected by all drivers.
>         >
>         > This prevents the test from being marked as IGNORED/SKIP on
>         non-Intel
>         > platforms while maintaining the original test intent of
>         verifying that
>         > drivers properly reject modes with excessively high clock rates.
>         >
>         > Tested on MTK platforms where the test now properly executes
>         > and verifies clock validation.
>         >
>         > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
>         > Suggested-by: Jani Nikula<jani.nikula@intel.com>
>
>         Reviewed-by: Fei Shao <fshao@chromium.org>
>
>
>         > ---
>         >  tests/kms_invalid_mode.c | 10 +++++++++-
>         >  1 file changed, 9 insertions(+), 1 deletion(-)
>         >
>         > diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
>         > index 5edffb649ef4..78ab965ede91 100644
>         > --- a/tests/kms_invalid_mode.c
>         > +++ b/tests/kms_invalid_mode.c
>         > @@ -126,7 +126,15 @@ adjust_mode_clock_too_high(data_t
>         *data, drmModeModeInfoPtr mode)
>         >  {
>         >         int max_dotclock = data->max_dotclock;
>         >
>         > -       igt_require(max_dotclock != 0);
>         > +       /*
>         > +        * If max_dotclock is unavailable (e.g., non-Intel
>         platforms),
>         > +        * use -1 as an invalid clock value. This will be
>         converted to
>         > +        * UINT_MAX, which clearly exceeds any reasonable
>         hardware limit.
>         > +        */
>         > +       if (max_dotclock == 0) {
>         > +               mode->clock = -1;
>         > +               return true;
>         > +       }
>         >
>         >         /*
>         >          * FIXME When we have a fixed mode, the kernel will
>         ignore
>         > --
>         > 2.43.0
>         >
>
--------------nKtHhg40JQZT31IPt04xGflo
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Manasi,</p>
    <div class="moz-cite-prefix">On 5/1/2026 4:31 AM, Manasi Navare
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAMNLLoQSwnMz_-u2PqTDRM2qVXp=hxwXak5HFnCUqvpbMRVTDg@mail.gmail.com">
      
      <div dir="ltr">
        <div>Hi&nbsp;<a class="gmail_plusreply" id="plusReplyChip-1" href="mailto:karthik.b.s@intel.com" tabindex="-1" moz-do-not-send="true">@Karthik B S</a>&nbsp;&nbsp;<a class="gmail_plusreply" id="plusReplyChip-2" href="mailto:jani.nikula@intel.com" tabindex="-1" moz-do-not-send="true">@Jani Nikula</a>&nbsp;:</div>
        <div><br>
        </div>
        <div>Signal boosting this, we have reviewed this patch and
          verified for the MTK driver,</div>
        <div>Could you please take a look and&nbsp; help on getting this
          upstreamed?</div>
      </div>
    </blockquote>
    <p>Sure, this LGTM and CI is also fine. Will merge this.</p>
    Regards,<br>
    Karthik.B.S
    <blockquote type="cite" cite="mid:CAMNLLoQSwnMz_-u2PqTDRM2qVXp=hxwXak5HFnCUqvpbMRVTDg@mail.gmail.com">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Regards</div>
        <div>Manasi</div>
        <br>
        <div class="gmail_quote gmail_quote_container">
          <div dir="ltr" class="gmail_attr">On Wed, Apr 29, 2026 at
            1:37 PM Manasi Navare &lt;<a href="mailto:navaremanasi@google.com" moz-do-not-send="true" class="moz-txt-link-freetext">navaremanasi@google.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir="ltr">
              <div dir="ltr">Thanks for the patch and for addressing
                Jani's comments.</div>
              <div>This looks good to me.</div>
              <div><br>
              </div>
              <div>Reviewed-by: Manasi Navare &lt;<a href="mailto:navaremanasi@google.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">navaremanasi@google.com</a>&gt;</div>
              <div><br>
              </div>
              <div><a class="gmail_plusreply" id="m_-9025511830230408148plusReplyChip-5" href="mailto:jani.nikula@intel.com" target="_blank" moz-do-not-send="true">@Jani Nikula</a>&nbsp;<a class="gmail_plusreply" id="m_-9025511830230408148plusReplyChip-6" href="mailto:karthik.b.s@intel.com" target="_blank" moz-do-not-send="true">@Karthik B S</a>&nbsp; Would you be
                able to help land this upstream, its required<br>
              </div>
              <div>to run this test on non intel platforms and review
                comments from Jani have been addressed.</div>
              <div><br>
              </div>
              <div>Thanks a lot for your help on landing this.</div>
              <div><br>
              </div>
              <div>Regards</div>
              <div>Manasi</div>
              <br>
              <div class="gmail_quote">
                <div dir="ltr" class="gmail_attr">On Thu, Apr 16, 2026
                  at 9:04 PM Fei Shao &lt;<a href="mailto:fshao@chromium.org" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">fshao@chromium.org</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On
                  Wed, Apr 15, 2026 at 9:51 AM Jason-JH Lin &lt;<a href="mailto:jason-jh.lin@mediatek.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">jason-jh.lin@mediatek.com</a>&gt;
                  wrote:<br>
                  &gt;<br>
                  &gt; The clock-too-high subtest was being skipped on
                  non-Intel platforms<br>
                  &gt; because igt_get_max_dotclock() returns 0 when
                  reading from<br>
                  &gt; Intel-specific debugfs fails.<br>
                  &gt;<br>
                  &gt; This change allows the test to run on all
                  platforms by using -1 as an<br>
                  &gt; invalid clock value when max_dotclock is
                  unavailable. The -1 converts<br>
                  &gt; to UINT_MAX for unsigned int, which clearly
                  exceeds any reasonable<br>
                  &gt; hardware limit and should be rejected by all
                  drivers.<br>
                  &gt;<br>
                  &gt; This prevents the test from being marked as
                  IGNORED/SKIP on non-Intel<br>
                  &gt; platforms while maintaining the original test
                  intent of verifying that<br>
                  &gt; drivers properly reject modes with excessively
                  high clock rates.<br>
                  &gt;<br>
                  &gt; Tested on MTK platforms where the test now
                  properly executes<br>
                  &gt; and verifies clock validation.<br>
                  &gt;<br>
                  &gt; Signed-off-by: Jason-JH Lin &lt;<a href="mailto:jason-jh.lin@mediatek.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">jason-jh.lin@mediatek.com</a>&gt;<br>
                  &gt; Suggested-by: Jani Nikula&lt;<a href="mailto:jani.nikula@intel.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">jani.nikula@intel.com</a>&gt;<br>
                  <br>
                  Reviewed-by: Fei Shao &lt;<a href="mailto:fshao@chromium.org" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">fshao@chromium.org</a>&gt;<br>
                  <br>
                  <br>
                  &gt; ---<br>
                  &gt;&nbsp; tests/kms_invalid_mode.c | 10 +++++++++-<br>
                  &gt;&nbsp; 1 file changed, 9 insertions(+), 1 deletion(-)<br>
                  &gt;<br>
                  &gt; diff --git a/tests/kms_invalid_mode.c
                  b/tests/kms_invalid_mode.c<br>
                  &gt; index 5edffb649ef4..78ab965ede91 100644<br>
                  &gt; --- a/tests/kms_invalid_mode.c<br>
                  &gt; +++ b/tests/kms_invalid_mode.c<br>
                  &gt; @@ -126,7 +126,15 @@
                  adjust_mode_clock_too_high(data_t *data,
                  drmModeModeInfoPtr mode)<br>
                  &gt;&nbsp; {<br>
                  &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int max_dotclock = data-&gt;max_dotclock;<br>
                  &gt;<br>
                  &gt; -&nbsp; &nbsp; &nbsp; &nbsp;igt_require(max_dotclock != 0);<br>
                  &gt; +&nbsp; &nbsp; &nbsp; &nbsp;/*<br>
                  &gt; +&nbsp; &nbsp; &nbsp; &nbsp; * If max_dotclock is unavailable (e.g.,
                  non-Intel platforms),<br>
                  &gt; +&nbsp; &nbsp; &nbsp; &nbsp; * use -1 as an invalid clock value. This
                  will be converted to<br>
                  &gt; +&nbsp; &nbsp; &nbsp; &nbsp; * UINT_MAX, which clearly exceeds any
                  reasonable hardware limit.<br>
                  &gt; +&nbsp; &nbsp; &nbsp; &nbsp; */<br>
                  &gt; +&nbsp; &nbsp; &nbsp; &nbsp;if (max_dotclock == 0) {<br>
                  &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mode-&gt;clock = -1;<br>
                  &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return true;<br>
                  &gt; +&nbsp; &nbsp; &nbsp; &nbsp;}<br>
                  &gt;<br>
                  &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*<br>
                  &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * FIXME When we have a fixed mode, the
                  kernel will ignore<br>
                  &gt; --<br>
                  &gt; 2.43.0<br>
                  &gt;<br>
                </blockquote>
              </div>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------nKtHhg40JQZT31IPt04xGflo--
