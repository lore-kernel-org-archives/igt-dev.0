Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB04E9A04A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 15:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B0C10E0F8;
	Wed, 18 Feb 2026 15:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPk62qfh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9FE10E0F8
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 15:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771428443; x=1802964443;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=NbDV04Bbulp2PeIbVbCIuWX/cwUMCPWWswJ8/8YRzBM=;
 b=gPk62qfhoHvH/5Sa+RjkgHj7APfbUwCVyFulBCHo6L6IbeJ4nyB9bogt
 wO7BuVdljS9k1KONamUjuJVVs+F03B087yEwMTcB9Bw4xDpcOUzpH4WkH
 2CmJCOV5Xak9t78wDUolZ1MqYOV5RUfaTNcQsPAbRuPP9rqNVKo9U+jCD
 0Uq8slgYZ8selsDisKPegBd3PZNrlbuO+uAiu+Pdrttg3VBQBh2IHw+U7
 JsqLmr/uRhM2Ti3KAESUc90PDjzmskw94DA/b0X6hJnlkDtaI4c5CwyhN
 qrN9H8jWWa3+tKBv+SgNwlYeIlvOz2CUUTpG9hGyLaAKcybTniIWNGg4/ w==;
X-CSE-ConnectionGUID: XXuW6VzlQY2GUW+0mTqd6Q==
X-CSE-MsgGUID: aYYFQTZcTKK+gSwKD4N1rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="71526029"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208,217";a="71526029"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:27:22 -0800
X-CSE-ConnectionGUID: b1zhac6BRYqtKNNGab3EUw==
X-CSE-MsgGUID: Tlnh577CQS6dI1z+xjnvpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
 d="scan'208,217";a="219218994"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:27:21 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 07:27:21 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 07:27:21 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 07:27:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mx25ieB70pmglr4bFeEqc3oN9B+ziugTWxwXfNK8wwZRrYDuvKTS3CAF2sgYwDnpAco7in4jzqz52lEGczcVonZhPmVtqR6bJuxhAUNTjDsZNQJON9iQg5eIz8uQ+znRtNZfC5sgRG411hHceOzTq/SaFa7OiGPc/097C/BREJ9ImrN0bLRZfRjNh9sSdgh4zxBevm7CHTsI+zIo/5wWFkxDDXfFhyN/IxhSbl30OdZk1wVXx5T0Sh8mtYgGl2EjtoGvgdtXV5vD4TCzukx1QCPb44NW+AHEbzr8T9OmiM1moEB4VUUSJ0celBNpq3JS3QnE0VDE3q2jKWGmO4jv6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iks8Ju1qPj87t3FiU5YKJv20lCkTSw3XFvkVNTVcahI=;
 b=JKbcFmkOTs3sG8YzEny///QdmsMtkPKFXo0qwnKaXJ0NT0bzNPQG2yj5QuAUcZPX2F5gDawBylcwyFV2zeZePjW3DDQPL+Y4uA6Pz7WNDlO2UwO/tSDzCd+7HXYTLmnrLvfOnuQKnZO0RoXuvm1t945ORpW9hUhIftE//eMZHL98/w1O0tm3D7fHXlDBuHjUbzPMnWut53GxtwZOKVk1CTX9g8btvjLZulM4/xf1XBxqWJ+md3CzmLek1KEMp25iNBT0rADon924rzpapTipdMRCR6QdgKVMaBSagFXsQ4QZVv3D5UXq4/QMSXExUiXg4HL9EPGojafO325MRNhoHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by PH8PR11MB6612.namprd11.prod.outlook.com (2603:10b6:510:1cf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 15:27:18 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 15:27:12 +0000
Content-Type: multipart/alternative;
 boundary="------------SB0wE4cPtzh0TDYjV2be5aXr"
Message-ID: <3c816b8d-b7ce-4bc4-9e9c-fd8c2e32512c@intel.com>
Date: Wed, 18 Feb 2026 20:57:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 3/5] tools/gputop.src/xe_gputop: Refactor
 xe_populate_engines to close card_fd and use direct ioctl calls
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <kamil.konieczny@intel.com>,
 <ashutosh.dixit@intel.com>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>
References: <20260130095318.644256-1-soham.purkait@intel.com>
 <20260130095318.644256-4-soham.purkait@intel.com>
 <735a3190-0757-4cf5-ba1f-f6260647626b@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <735a3190-0757-4cf5-ba1f-f6260647626b@intel.com>
X-ClientProxiedBy: MA5P287CA0056.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::11) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|PH8PR11MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: cb9ff43f-f500-49cf-c8ec-08de6f02302a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlVhaHZPUC9PSW9RMEJzUWgxNjVPbllWOGtROVdENEZVY2dGZG9iNTI0MEhi?=
 =?utf-8?B?SVJRM0prbTBOdnBCVEJndGY2U01GWmxUL3ZQNm5qQ0RPVUtUZENrSjZKbFEy?=
 =?utf-8?B?WW1STlBLTytjV3BVVUZxTXdLNmFTVXVWVWxBZ0pUK2NtdzBNckV2dHU1YWli?=
 =?utf-8?B?eWd4RmdId3NDZTFzVmlvWUdIRUhFM2l5djNLZmVpLzFXWVJDR3ZlcVJOYjl5?=
 =?utf-8?B?UERGd3VXd3lLaTBxL3NFS1NQWWdNazBHbkxyTFBRaDVGbGtObG1SYWdGN0FR?=
 =?utf-8?B?V1B3Ri94OVV2SkYxUnBiVm9oc2xLSnBVNDR2NzEzbTdYNWl6ZkN1VHNpTUhy?=
 =?utf-8?B?QXI5dm5HM1pBbWk1bk1tcXpqZUgxL3RhaUFQVk4rNC9BQkZaRGV1WXc5Slps?=
 =?utf-8?B?OEsybVdNVE80Z0FMaG9HVGROQWo5bWVyMGlhUWVkU1FLbTJERFVyYURadFdH?=
 =?utf-8?B?d3ZQUDhabnJyYUZjOTNQaXZlRUxqb1lmeUM3U0dJY3lWNFJxSC9DOUhLTlRI?=
 =?utf-8?B?U1VZaDdDSDBhcW9XSENUL1VXWG5NaGpCRVAwYmVWemFFMHc0MXZrSTYxaklj?=
 =?utf-8?B?Sm5lZlN6RzF5bFMvWWhSZ0s4Yy9XVHhkWGFmclArU3ljdmgxSlB1SDc3Qldj?=
 =?utf-8?B?emRUbDdFZ1h1L3lNL3VNMVNOWE1PK1M5Vm9OVW10NXRNVXdVaFFRUE9lMUtm?=
 =?utf-8?B?bjAzZnhLQVdIQXE4bjlnbElFUVYyQ3Q3L3hlcHBLUWUxNUl4OW1ScHNDQnI0?=
 =?utf-8?B?RVhGSFl5aWtsbXZjLytrWWw5YzlJMUpKVWM4Nys3VlBzeXFNUUwyU0FlZTJB?=
 =?utf-8?B?ZWxwaURlQjNKYjRGSHUvNFVVZmQyMGZvRHF1aHZtZUlVR2h0UG1uVGZ3SjdW?=
 =?utf-8?B?MEFKTWFrY0Z1RlA1Rnl3NzBQcmFJSmFxbmhlUUlEMXBVYjVxM1l0OGVtVkt1?=
 =?utf-8?B?bTRMMm5JUTRtN2dHd3h6NlNFS09GUkFkSFRSNEhZb1BaclgrS3RscXFDVURO?=
 =?utf-8?B?aDZleUthTmgwMFhMWmp0Mk1NbXFPekRJdDByVEhSc09zRlkrOTJkekJHcUFC?=
 =?utf-8?B?UFJqVjJkV1hEY2RPWTNKdVhCL2JtUjJWZ0JGclVlQ2RJalozRlNmTlgzQ2dC?=
 =?utf-8?B?MXI2TFJLSE1GNUg0UFRPTGYwaVJjTGFVWUFOQU5ESmQwdUZhUGdiaWFiUG04?=
 =?utf-8?B?eU1FYjBkK01mNGswY3dvNmg2ekozcWljTWNXRVZHbHNERkVVelY5VXZKV1FH?=
 =?utf-8?B?VHd1QXZLRFJKOUhVQ2JIcmt2NW9JRHpSSHJ2bDVXbEE1SlpCRFh2ZERYYWZw?=
 =?utf-8?B?dVVKWjhxWExSU0RmeFhaUFdtUkRJSjFFZjhwdHRUQXpIV1FUQ2dyL0lrM3l1?=
 =?utf-8?B?cXFiYWVxNmtLOWVXdjhnOFNVSzVvblh4T01HL2ZVa0J6bmtrZmFSUXc5QXFz?=
 =?utf-8?B?clZjY3JuZndDTTZFT0RzR2ZGU2hyc01MWUNVYVpVZlR3bHRKRTFVKzl4SUIz?=
 =?utf-8?B?cDNuTDhJdXVJSXZUZlRWSWEzU2hReGJ0T3Rrdjd5VVVFdVhOakxsUW9RRmIy?=
 =?utf-8?B?NmxoMmpmRlkyOHA3aDJJNTFCTWpmN2hLMTAxZDVWL0laakF6NmlEUnFvNmxz?=
 =?utf-8?B?eTB0NzY0MU9LVTRDRzNNRWkzRXl1cE1XREUrYjdnTDBjWEN4dHJxcmQyNzNk?=
 =?utf-8?B?U3pXdmtRWDc3Zkd6WHZrWGg0ZzFsKzFTb3dNUWZVblMxQmJXbEdjZ0E5NmVO?=
 =?utf-8?B?T1FNR3cxclF0TnR3OUloYXdwRkUvTkhKSVViQ3dvMVJNdWFjUkpvZVVjSVVR?=
 =?utf-8?B?ZGI3bmFjRmp4QXZzSXRhSzF3Z3V5dURydm9VakhLMWRlejNjMUdGdzZFb3NV?=
 =?utf-8?B?ZXFWazRacE5aQ3c2aHpCdUNBb1FGT0taUTNPbjVVZGxNelU5OW9YRWpKbDVV?=
 =?utf-8?B?U3J6aU90WVJjZkFGQlhkVGp2cVFoQ2o4ZFRoTmdsQ1hjTUxVRHlJcHloZnZS?=
 =?utf-8?B?c2dsNXJWWlFjY3R0UTM0T05xV3BEY2JHSjE3SXVpcytzNGxrbXhaU09iNHNz?=
 =?utf-8?B?Ykk5RHVGd1ZRTXlkcW45UlcyalFUSkpSb2JhS1BPRjZWNXk1ME02TjlOT3BY?=
 =?utf-8?Q?5M2Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDlxUnhyZkw4TStQejhPbFU1NVRKTERVU2FMRVRuQU91S01Qem96bDJZYkM2?=
 =?utf-8?B?dXlCVHF3VDY3U2JpSUl2RWxvbkRvSFZTUnF6aTlteGd4UEF3aWpSeDZMNlNC?=
 =?utf-8?B?aVd6bGRjazhhNnNMQ0VFS2lsS1lsOHNxdm5qM3FpelozMWVocGd4U2wrckox?=
 =?utf-8?B?d0w1M3ExL1JkeU9YT0NHUVNNNHFFSEEvbWtRN0VVQ0t6bC9VMkU1UVhlQmRy?=
 =?utf-8?B?eFUra2ZjemVXWDk4WVFrWVFyZ3ZLYUNKbHhqUmxZaEtwMldkQ0x4WnlhVWZx?=
 =?utf-8?B?QkRlbmpYem80MExXWkFoYXpCMFBqQVZwSFZ5blhpT3c1TW50aDR4SE40elQr?=
 =?utf-8?B?eWgxZzNyL3dEQWNRbU1TM1lxRkhyRTZCcHd6VWdjYkpDM0FoMnpUcnlhTmVx?=
 =?utf-8?B?Z3paclNJR2p5MGNTQ0F1QTdoRTc5SUp3OWxwOGZYUVo1Umt0VUhrWlFmWlJX?=
 =?utf-8?B?VXFtQ2NvMERWY3k4dlFuSjFJbjRablhzVXF2NG1lZkg2bjNBRWdFMVM2QzBz?=
 =?utf-8?B?c1ZzVWoyVmZhQy92RUxxOFVrNm5adVVoY3pzck5wRERSWUR4RUFDakhBZWhN?=
 =?utf-8?B?eHdaUXM2Y2YrY01NN1l5elFVMmtBRTRYYldKQUZzb29zWGpsQTRkUkJvK1RL?=
 =?utf-8?B?dWVORUV4YjRNN2RIbVhabXY2UWlqNG1mQmV6aGVmQUJtRzZHWHVPekJRTkhs?=
 =?utf-8?B?SnROblVJTUNiU3AzVTFtdFVqZWMyc2dzSG9ydUgrZnFhVzhpM2J0MSsrekNX?=
 =?utf-8?B?dkt0d2YyN3AyQ1lwVGNHeHg0ajNhU3BMN2d6UDJ3bTBCSHpKdkdmUDZGb2cy?=
 =?utf-8?B?YlR3eTh5WThtbTlaL25TaWQya0kwQWJKZmhaa01KSmxtdExhQnJQajYrZlMy?=
 =?utf-8?B?RldiTEdCSGRoVWlKcGYzRktNM0dnVVdPMElUTzhMeG5za0VLQk1NS3NxdUxN?=
 =?utf-8?B?ck1VdGhGK3FUUjkvQjg5YlE2MTRoSW14UjVpZVoxak9YeFhwOFAxWlNjemlI?=
 =?utf-8?B?ZUFrQUg1L2xYYTJDOUxPVjUwNTIremxDeEM0eVExUkY0WlFlRUR1TGlNRXQv?=
 =?utf-8?B?bGgyR3c2VFc4L2FnR29JZzFxa1d6RFJNNWJPM2UxY1daSDRuOFZpQy9Yei8v?=
 =?utf-8?B?RkE4aVZNaGZkbFFXY2ViNmpVSmliMUpnODJWTEJITGM0M2Q1eHdvMUtKOC84?=
 =?utf-8?B?bGdQS2NBcVBCbXdXMkZiMU9GSi8yL28xRG5DSS9mWlNxYUtKMnVobHlna0Z6?=
 =?utf-8?B?eURJamVJMFFGM3RZS0MxUmFTYmF2NWtaYS9wQ3lOeU9aR1dpRDJmVFNzUjBP?=
 =?utf-8?B?dzB5RUtscVFNL3pNaExsUEtselBiNThUYU9ZenNITUt6elFUazM3VFBQSC9Z?=
 =?utf-8?B?ZUdVRTZCMWxZVDN1d2lORkFrTGRyalA0cThZRml4QTVtVENjb0lPYXlBQXR0?=
 =?utf-8?B?c0wwVStpSFNlRndCQUtERUQ3NkVhYlNqTXdxNmNQbUQxU0F1L3RPZGZLeFBI?=
 =?utf-8?B?Y0xUajJkL1ZTM2VrVkZmdWNYbVB2YWVvSW9OckN0T0hnUTJ2ZW9LZXZxR3pX?=
 =?utf-8?B?WktscldhKzJ2cWtYZFR5eFdaZjBOYTJoZGJVclZDQUF3bENHVG9GUlp2Nllv?=
 =?utf-8?B?VkpqZDB6T3Y1dGJ1M3dpRXAzWFozNm1hU3FNTFBZaWtQN1Z3QklDVVREWnBS?=
 =?utf-8?B?WExyM0Z5enFsbiswTDVnd3ZIVEdlVWJUZjd6NzJnU1g3akNkb1VpWHM5MWNE?=
 =?utf-8?B?N09ENnlCdU1aaEt6VkhlSjA3UmI1QVNmMFZyZmxQZUhUMy9wUTVYbmF3OW5M?=
 =?utf-8?B?UFI0MjNkQVFKbTZ2a0ZLNVVzWXMvVVhwbW9NRDZicTRUcDl1Yjk0bEErUVFq?=
 =?utf-8?B?aVRRR2xVZ3NxU1ZMNUJzdlprbW1PM2I1NUMwR3lkeTJ5K2lXQ0tTa2FFQUN1?=
 =?utf-8?B?L2JpV05Wdi9ZUjVKcW5vZHFnMzlwczZvczRjMk9HU0phajFGd09NYXcyL0ha?=
 =?utf-8?B?Z01kUE12NU1vR0M1T2tSMmR3UUkyMEVaY1hRNmZBNWs5aE9ZbEFaVHNjZ3dP?=
 =?utf-8?B?T1k1NmtUeEE4bmxiWlRkaUFlWkNPRWNZdmZ1SExKL1l0L0FDQVAvQjVIRzVH?=
 =?utf-8?B?Yjl6cmZ1OU5YY2xaa0JXU25rN1ppUm0xMFR5T1BqLy9jd0FDREg0ckR0YkNC?=
 =?utf-8?B?M2NVQmpSbURYRlkrL2d3dEQ3eGxsK0kycTdGRk9TYVBFL2RxcUZ1L0tQbnFJ?=
 =?utf-8?B?OWJDTWNyVHMwL1dhZTJjM2o2dm5IeTU3dVFtQjc2bXNMa3V1RnFaUTNEem9V?=
 =?utf-8?B?NUJwWkFLTkNlSFdmTWVYM2xReEd2bGNUQ0UwVXFuanl0MlBkdnJrSlJ5dFla?=
 =?utf-8?Q?Cobnp7/izY330Oi8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9ff43f-f500-49cf-c8ec-08de6f02302a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 15:27:12.3476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCLtLEE976LJ+3feJ4uBKXRUGqDncJVvIIvYVzS44fr+f8h6GtcrOgUFNmFhfmkrXgIoJnTUQpiX4HWLTfvfZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6612
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

--------------SB0wE4cPtzh0TDYjV2be5aXr
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Vinay

On 12-02-2026 07:11, Belgaumkar, Vinay wrote:
>
>
> On 1/30/2026 1:53 AM, Soham Purkait wrote:
>> During GPUTOP engine initialization, the opened card fd is required to
>> query engines and obtain configurations for PMU busyness calculation, but
>> leaving it open causes the process to appear as a DRM client, which
>> conflicts with KMS test requirements. To avoid this, card_fd is closed
>> immediately after engine discovery, and engine queries are refactored to
>> remove the lib/xe/* dependency in favor of direct ioctl calls, simplifying
>> the implementation and reducing igt test library dependencies.
>>
>> v1:
>>   - Initialize pmu_device_obj to null.
>> v2:
>>   - Remove dependency on lib/xe/* libraries. (Kamil)
>>
>> Fixes: c8106465683f ("tools/gputop/xe_gputop: Add gputop support for xe specific devices")
>> Signed-off-by: Soham Purkait<soham.purkait@intel.com>
>> ---
>>   tools/gputop.src/xe_gputop.c | 100 ++++++++++++++++++++++++++++-------
>>   tools/gputop.src/xe_gputop.h |   3 +-
>>   2 files changed, 81 insertions(+), 22 deletions(-)
>>
>> diff --git a/tools/gputop.src/xe_gputop.c b/tools/gputop.src/xe_gputop.c
>> index bb2caa6ea..7793cd62f 100644
>> --- a/tools/gputop.src/xe_gputop.c
>> +++ b/tools/gputop.src/xe_gputop.c
>> @@ -1,8 +1,10 @@
>>   // SPDX-License-Identifier: MIT
>>   /*
>> - * Copyright © 2025 Intel Corporation
>> + * Copyright © 2025-2026 Intel Corporation
>>    */
>>   
>> +#include <sys/ioctl.h>
>> +
>>   #include "xe_gputop.h"
>>   
>>   #define engine_ptr(pmu_device, n) (&(pmu_device)->engine + (n))
>> @@ -92,6 +94,7 @@ void xe_gputop_init(void *ptr, int index,
>>   
>>   	obj = ((struct xe_gputop *)ptr) + index;
>>   	obj->card = card;
>> +	obj->pmu_device_obj = NULL;
>>   }
>>   
>>   static int pmu_format_shift(int xe, const char *name)
>> @@ -121,20 +124,54 @@ static int engine_cmp(const void *__a, const void *__b)
>>   		return a->drm_xe_engine.engine_instance - b->drm_xe_engine.engine_instance;
>>   }
>>   
>> +static int engine_query(int fd, struct drm_xe_query_engines **engine_q)
>> +{
>> +	struct drm_xe_device_query q;
>> +	int ret = 0, num_eng;
>> +
>> +	memset(&q, 0, sizeof(q));
>> +	q.query = DRM_XE_DEVICE_QUERY_ENGINES;
>> +
>> +	ret = ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &q);
>> +	if (ret != 0) {
>> +		if ((errno != ENOSPC && errno != E2BIG) || q.size == 0)
> why are we ignoring ENOSPC and E2BIG? 
I have rectified this check. Seems like the driver is not returning any 
of these during size check.
>> +			return -1;
>> +	}
>> +	if (q.size == 0)
> we can check q.size just once instead of twice? 
Sure.
>> +		return 0;
>> +
>> +	num_eng = (int)((q.size - sizeof(struct drm_xe_query_engines)) /
>> +			sizeof(struct drm_xe_engine_class_instance));
>> +
>> +	*engine_q = (struct drm_xe_query_engines *)calloc(1, q.size);
>> +	if (!*engine_q)
>> +		return -1;
>> +
>> +	q.data = (uintptr_t)(*engine_q);
> better to use to_user_pointer from the lib? 
For igt "tools" it has been asked to not use any library function from 
lib as these are meant to be used only with IGT tests.
>> +
>> +	ret = ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &q);
>> +	if (ret != 0) {
>> +		free(*engine_q);
>> +		return -1;
>> +	}
>> +
>> +	return num_eng;
>> +}
>> +
>>   void *xe_populate_engines(const void *obj, int index)
>>   {
>>   	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
>>   	struct igt_device_card *card = ptr->card;
>>   	uint64_t engine_active_config, engine_total_config;
>>   	uint64_t engine_class, engine_instance, gt_shift;
>> -	struct drm_xe_engine_class_instance *hwe;
>> +	struct drm_xe_query_engines *engine_q;
>>   	struct xe_pmu_device *engines;
>>   	char device[30];
>> -	int ret = 0;
>> -	int card_fd;
>> +	int ret = 0, num_eng;
>> +	int card_fd = -1;
>>   
>>   	if (!card || !strlen(card->card) || !strlen(card->render))
>> -		return NULL;
>> +		goto err;
>>   
>>   	if (strlen(card->card)) {
>>   		card_fd = igt_open_card(card);
>> @@ -142,39 +179,51 @@ void *xe_populate_engines(const void *obj, int index)
>>   		card_fd = igt_open_render(card);
>>   	} else {
>>   		fprintf(stderr, "Failed to detect device!\n");
>> -		return NULL;
>> +		goto err;
>>   	}
>> -	xe_device_get(card_fd);
>> +
>> +	num_eng = engine_query(card_fd, &engine_q);
>> +	if (num_eng <= 0) {
>> +		fprintf(stderr, "Engine query failed!\n");
>> +		goto err;
>> +	}
>> +
>>   	engines = malloc(sizeof(struct xe_pmu_device) +
>> -			 xe_number_engines(card_fd) * sizeof(struct xe_engine));
>> +			 num_eng * sizeof(struct xe_engine));
>>   	if (!engines)
>> -		return NULL;
>> +		goto err;
>>   
>>   	memset(engines, 0, sizeof(struct xe_pmu_device) +
>> -	       xe_number_engines(card_fd) * sizeof(struct xe_engine));
>> +	       num_eng * sizeof(struct xe_engine));
>>   
>>   	engines->num_engines = 0;
>>   	gt_shift = pmu_format_shift(card_fd, "gt");
>>   	engine_class = pmu_format_shift(card_fd, "engine_class");
>>   	engine_instance = pmu_format_shift(card_fd, "engine_instance");
>>   	xe_perf_device(card_fd, device, sizeof(device));
>> +	close(card_fd);
>> +	card_fd = -1;
>> +
>>   	engines->device = strdup(device);
>>   	ret = perf_event_config(device, "engine-active-ticks", &engine_active_config);
>>   	if (ret < 0)
>> -		return NULL;
>> +		goto err;
>>   
>>   	ret = perf_event_config(device, "engine-total-ticks", &engine_total_config);
>>   	if (ret < 0)
>> -		return NULL;
>> +		goto err;
>>   
>> -	xe_for_each_engine(card_fd, hwe) {
>> +	while (engines->num_engines < engine_q->num_engines) {
>>   		uint64_t  param_config;
>>   		struct xe_engine *engine;
>> +		struct drm_xe_engine_class_instance hwe;
>> +
>> +		hwe = engine_q->engines[engines->num_engines].instance;
>>   
>>   		engine = engine_ptr(engines, engines->num_engines);
>> -		param_config = (uint64_t)hwe->gt_id << gt_shift | hwe->engine_class << engine_class
>> -			| hwe->engine_instance << engine_instance;
>> -		engine->drm_xe_engine = *hwe;
>> +		param_config = (uint64_t)hwe.gt_id << gt_shift | hwe.engine_class << engine_class
>> +			| hwe.engine_instance << engine_instance;
>> +		engine->drm_xe_engine = hwe;
>>   		engine->engine_active_ticks.config = engine_active_config | param_config;
>>   		engine->engine_total_ticks.config = engine_total_config | param_config;
>>   
>> @@ -185,7 +234,7 @@ void *xe_populate_engines(const void *obj, int index)
>>   		}
>>   
>>   		ret = asprintf(&engine->display_name, "GT:%u %s/%u",
>> -			       hwe->gt_id,
>> +			       hwe.gt_id,
>>   			       class_display_name(engine->drm_xe_engine.engine_class),
>>   			       engine->drm_xe_engine.engine_instance);
>>   
>> @@ -197,9 +246,11 @@ void *xe_populate_engines(const void *obj, int index)
>>   		engines->num_engines++;
>>   	}
>>   
>> +	free(engine_q);
>> +
>>   	if (!ret) {
>
> Not part of this patch, but looks like ret is overloaded here for 
> multiple things. Usually ret = 0 is a good thing? Should use num_bytes 
> or something if we expect asprintf above to return a positive value. 
> We should fix this as a separate patch.
>
Sure.

Thanks,
Soham

> Thanks,
>
> Vinay.
>
>>   		errno = ret;
>> -		return NULL;
>> +		goto err;
>>   	}
>>   
>>   	qsort(engine_ptr(engines, 0), engines->num_engines,
>> @@ -208,6 +259,15 @@ void *xe_populate_engines(const void *obj, int index)
>>   	ptr->pmu_device_obj = engines;
>>   
>>   	return engines;
>> +
>> +err:
>> +	if (card_fd >= 0)
>> +		close(card_fd);
>> +	if (engines)
>> +		free(engines);
>> +	if (engine_q)
>> +		free(engine_q);
>> +	return NULL;
>>   }
>>   
>>   static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
>> @@ -263,11 +323,11 @@ int xe_pmu_init(const void *obj, int index)
>>   		fd = _open_pmu(type, &engines->num_counters, &engine->engine_active_ticks,
>>   			       &engines->fd);
>>   		if (fd < 0)
>> -			return -1;
>> +			return fd;
>>   		fd = _open_pmu(type, &engines->num_counters, &engine->engine_total_ticks,
>>   			       &engines->fd);
>>   		if (fd < 0)
>> -			return -1;
>> +			return fd;
>>   	}
>>   	return 0;
>>   }
>> diff --git a/tools/gputop.src/xe_gputop.h b/tools/gputop.src/xe_gputop.h
>> index 1e3856071..dcd82de7d 100644
>> --- a/tools/gputop.src/xe_gputop.h
>> +++ b/tools/gputop.src/xe_gputop.h
>> @@ -7,11 +7,10 @@
>>   #define __XE_GPUTOP_H__
>>   
>>   #include <dirent.h>
>> +#include <xe_drm.h>
>>   
>> -#include "igt_device_scan.h"
>>   #include "igt_perf.h"
>>   #include "utils.h"
>> -#include "xe/xe_query.h"
>>   
>>   struct xe_pmu_pair {
>>   	uint64_t cur;
--------------SB0wE4cPtzh0TDYjV2be5aXr
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Vinay</p>
    <div class="moz-cite-prefix">On 12-02-2026 07:11, Belgaumkar, Vinay
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:735a3190-0757-4cf5-ba1f-f6260647626b@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 1/30/2026 1:53 AM, Soham Purkait
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20260130095318.644256-4-soham.purkait@intel.com">
        <pre wrap="" class="moz-quote-pre">During GPUTOP engine initialization, the opened card fd is required to
query engines and obtain configurations for PMU busyness calculation, but
leaving it open causes the process to appear as a DRM client, which
conflicts with KMS test requirements. To avoid this, card_fd is closed
immediately after engine discovery, and engine queries are refactored to
remove the lib/xe/* dependency in favor of direct ioctl calls, simplifying
the implementation and reducing igt test library dependencies.

v1:
 - Initialize pmu_device_obj to null.
v2:
 - Remove dependency on lib/xe/* libraries. (Kamil)

Fixes: c8106465683f (&quot;tools/gputop/xe_gputop: Add gputop support for xe specific devices&quot;)
Signed-off-by: Soham Purkait <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com" moz-do-not-send="true">&lt;soham.purkait@intel.com&gt;</a>
---
 tools/gputop.src/xe_gputop.c | 100 ++++++++++++++++++++++++++++-------
 tools/gputop.src/xe_gputop.h |   3 +-
 2 files changed, 81 insertions(+), 22 deletions(-)

diff --git a/tools/gputop.src/xe_gputop.c b/tools/gputop.src/xe_gputop.c
index bb2caa6ea..7793cd62f 100644
--- a/tools/gputop.src/xe_gputop.c
+++ b/tools/gputop.src/xe_gputop.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2025 Intel Corporation
+ * Copyright © 2025-2026 Intel Corporation
  */
 
+#include &lt;sys/ioctl.h&gt;
+
 #include &quot;xe_gputop.h&quot;
 
 #define engine_ptr(pmu_device, n) (&amp;(pmu_device)-&gt;engine + (n))
@@ -92,6 +94,7 @@ void xe_gputop_init(void *ptr, int index,
 
 	obj = ((struct xe_gputop *)ptr) + index;
 	obj-&gt;card = card;
+	obj-&gt;pmu_device_obj = NULL;
 }
 
 static int pmu_format_shift(int xe, const char *name)
@@ -121,20 +124,54 @@ static int engine_cmp(const void *__a, const void *__b)
 		return a-&gt;drm_xe_engine.engine_instance - b-&gt;drm_xe_engine.engine_instance;
 }
 
+static int engine_query(int fd, struct drm_xe_query_engines **engine_q)
+{
+	struct drm_xe_device_query q;
+	int ret = 0, num_eng;
+
+	memset(&amp;q, 0, sizeof(q));
+	q.query = DRM_XE_DEVICE_QUERY_ENGINES;
+
+	ret = ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &amp;q);
+	if (ret != 0) {
+		if ((errno != ENOSPC &amp;&amp; errno != E2BIG) || q.size == 0)</pre>
      </blockquote>
      why are we ignoring ENOSPC and E2BIG?&nbsp;</blockquote>
    I have rectified this check. Seems like the driver is not returning
    any of these during size check.
    <blockquote type="cite" cite="mid:735a3190-0757-4cf5-ba1f-f6260647626b@intel.com">
      <blockquote type="cite" cite="mid:20260130095318.644256-4-soham.purkait@intel.com">
        <pre wrap="" class="moz-quote-pre">+			return -1;
+	}
+	if (q.size == 0)</pre>
      </blockquote>
      we can check q.size just once instead of twice?&nbsp;</blockquote>
    Sure.
    <blockquote type="cite" cite="mid:735a3190-0757-4cf5-ba1f-f6260647626b@intel.com">
      <blockquote type="cite" cite="mid:20260130095318.644256-4-soham.purkait@intel.com">
        <pre wrap="" class="moz-quote-pre">+		return 0;
+
+	num_eng = (int)((q.size - sizeof(struct drm_xe_query_engines)) /
+			sizeof(struct drm_xe_engine_class_instance));
+
+	*engine_q = (struct drm_xe_query_engines *)calloc(1, q.size);
+	if (!*engine_q)
+		return -1;
+
+	q.data = (uintptr_t)(*engine_q);</pre>
      </blockquote>
      better to use to_user_pointer from the lib?&nbsp;</blockquote>
    For igt &quot;tools&quot; it has been asked to not use any library function
    from lib as these are meant to be used only with IGT tests.
    <blockquote type="cite" cite="mid:735a3190-0757-4cf5-ba1f-f6260647626b@intel.com">
      <blockquote type="cite" cite="mid:20260130095318.644256-4-soham.purkait@intel.com">
        <pre wrap="" class="moz-quote-pre">+
+	ret = ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &amp;q);
+	if (ret != 0) {
+		free(*engine_q);
+		return -1;
+	}
+
+	return num_eng;
+}
+
 void *xe_populate_engines(const void *obj, int index)
 {
 	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
 	struct igt_device_card *card = ptr-&gt;card;
 	uint64_t engine_active_config, engine_total_config;
 	uint64_t engine_class, engine_instance, gt_shift;
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_query_engines *engine_q;
 	struct xe_pmu_device *engines;
 	char device[30];
-	int ret = 0;
-	int card_fd;
+	int ret = 0, num_eng;
+	int card_fd = -1;
 
 	if (!card || !strlen(card-&gt;card) || !strlen(card-&gt;render))
-		return NULL;
+		goto err;
 
 	if (strlen(card-&gt;card)) {
 		card_fd = igt_open_card(card);
@@ -142,39 +179,51 @@ void *xe_populate_engines(const void *obj, int index)
 		card_fd = igt_open_render(card);
 	} else {
 		fprintf(stderr, &quot;Failed to detect device!\n&quot;);
-		return NULL;
+		goto err;
 	}
-	xe_device_get(card_fd);
+
+	num_eng = engine_query(card_fd, &amp;engine_q);
+	if (num_eng &lt;= 0) {
+		fprintf(stderr, &quot;Engine query failed!\n&quot;);
+		goto err;
+	}
+
 	engines = malloc(sizeof(struct xe_pmu_device) +
-			 xe_number_engines(card_fd) * sizeof(struct xe_engine));
+			 num_eng * sizeof(struct xe_engine));
 	if (!engines)
-		return NULL;
+		goto err;
 
 	memset(engines, 0, sizeof(struct xe_pmu_device) +
-	       xe_number_engines(card_fd) * sizeof(struct xe_engine));
+	       num_eng * sizeof(struct xe_engine));
 
 	engines-&gt;num_engines = 0;
 	gt_shift = pmu_format_shift(card_fd, &quot;gt&quot;);
 	engine_class = pmu_format_shift(card_fd, &quot;engine_class&quot;);
 	engine_instance = pmu_format_shift(card_fd, &quot;engine_instance&quot;);
 	xe_perf_device(card_fd, device, sizeof(device));
+	close(card_fd);
+	card_fd = -1;
+
 	engines-&gt;device = strdup(device);
 	ret = perf_event_config(device, &quot;engine-active-ticks&quot;, &amp;engine_active_config);
 	if (ret &lt; 0)
-		return NULL;
+		goto err;
 
 	ret = perf_event_config(device, &quot;engine-total-ticks&quot;, &amp;engine_total_config);
 	if (ret &lt; 0)
-		return NULL;
+		goto err;
 
-	xe_for_each_engine(card_fd, hwe) {
+	while (engines-&gt;num_engines &lt; engine_q-&gt;num_engines) {
 		uint64_t  param_config;
 		struct xe_engine *engine;
+		struct drm_xe_engine_class_instance hwe;
+
+		hwe = engine_q-&gt;engines[engines-&gt;num_engines].instance;
 
 		engine = engine_ptr(engines, engines-&gt;num_engines);
-		param_config = (uint64_t)hwe-&gt;gt_id &lt;&lt; gt_shift | hwe-&gt;engine_class &lt;&lt; engine_class
-			| hwe-&gt;engine_instance &lt;&lt; engine_instance;
-		engine-&gt;drm_xe_engine = *hwe;
+		param_config = (uint64_t)hwe.gt_id &lt;&lt; gt_shift | hwe.engine_class &lt;&lt; engine_class
+			| hwe.engine_instance &lt;&lt; engine_instance;
+		engine-&gt;drm_xe_engine = hwe;<span style="white-space: normal">&nbsp;</span>
 		engine-&gt;engine_active_ticks.config = engine_active_config | param_config;
 		engine-&gt;engine_total_ticks.config = engine_total_config | param_config;
 
@@ -185,7 +234,7 @@ void *xe_populate_engines(const void *obj, int index)
 		}
 
 		ret = asprintf(&amp;engine-&gt;display_name, &quot;GT:%u %s/%u&quot;,
-			       hwe-&gt;gt_id,
+			       hwe.gt_id,
 			       class_display_name(engine-&gt;drm_xe_engine.engine_class),
 			       engine-&gt;drm_xe_engine.engine_instance);
 
@@ -197,9 +246,11 @@ void *xe_populate_engines(const void *obj, int index)
 		engines-&gt;num_engines++;
 	}
 
+	free(engine_q);
+
 	if (!ret) {</pre>
      </blockquote>
      <p>Not part of this patch, but looks like ret is overloaded here
        for multiple things. Usually ret = 0 is a good thing? Should use
        num_bytes or something if we expect asprintf above to return a
        positive value. We should fix this as a separate patch.</p>
    </blockquote>
    <p>Sure.</p>
    <p>Thanks,<br>
      Soham</p>
    <blockquote type="cite" cite="mid:735a3190-0757-4cf5-ba1f-f6260647626b@intel.com">
      <p>Thanks,</p>
      <p>Vinay.</p>
      <blockquote type="cite" cite="mid:20260130095318.644256-4-soham.purkait@intel.com">
        <pre wrap="" class="moz-quote-pre"> 		errno = ret;
-		return NULL;
+		goto err;
 	}
 
 	qsort(engine_ptr(engines, 0), engines-&gt;num_engines,
@@ -208,6 +259,15 @@ void *xe_populate_engines(const void *obj, int index)
 	ptr-&gt;pmu_device_obj = engines;
 
 	return engines;
+
+err:
+	if (card_fd &gt;= 0)
+		close(card_fd);
+	if (engines)
+		free(engines);
+	if (engine_q)
+		free(engine_q);
+	return NULL;
 }
 
 static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
@@ -263,11 +323,11 @@ int xe_pmu_init(const void *obj, int index)
 		fd = _open_pmu(type, &amp;engines-&gt;num_counters, &amp;engine-&gt;engine_active_ticks,
 			       &amp;engines-&gt;fd);
 		if (fd &lt; 0)
-			return -1;
+			return fd;
 		fd = _open_pmu(type, &amp;engines-&gt;num_counters, &amp;engine-&gt;engine_total_ticks,
 			       &amp;engines-&gt;fd);
 		if (fd &lt; 0)
-			return -1;
+			return fd;
 	}
 	return 0;
 }
diff --git a/tools/gputop.src/xe_gputop.h b/tools/gputop.src/xe_gputop.h
index 1e3856071..dcd82de7d 100644
--- a/tools/gputop.src/xe_gputop.h
+++ b/tools/gputop.src/xe_gputop.h
@@ -7,11 +7,10 @@
 #define __XE_GPUTOP_H__
 
 #include &lt;dirent.h&gt;
+#include &lt;xe_drm.h&gt;
 
-#include &quot;igt_device_scan.h&quot;
 #include &quot;igt_perf.h&quot;
 #include &quot;utils.h&quot;
-#include &quot;xe/xe_query.h&quot;
 
 struct xe_pmu_pair {
 	uint64_t cur;
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------SB0wE4cPtzh0TDYjV2be5aXr--
