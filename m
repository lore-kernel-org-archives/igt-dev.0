Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDB2F4612C
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 14:37:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9136D10E3EE;
	Mon, 23 Mar 2026 14:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WaZDz2/4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBC410E0E9
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 14:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774276615; x=1805812615;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NcvWflzTS1KKkYwrYGekXhusIxYwKStbafHTGaQVz8c=;
 b=WaZDz2/435Yg10zYx7jqsEFgIjpp6WrfqUX6PkQNF0XMIR/F4zj4UYmq
 x+Bva4FAVGGhJ3gT9cY/WHQtx+u7M24Ghj8eCuudAsRKrcpE6yZe4GD4d
 tz/HRXlMzccqmS5DJP1V5JGWQyRM6t77pnZh+B7ZNz8yyxtv3KEIskLCf
 fIlv5Gd4bi2yGjP1jcOvXfGqmE+AbkQDHJ7w3aXjptRwpoLLYRfv3DfDh
 P0NWxtjdeTqvSYJl83llL6GAWNlspc6MCBLNOG3nJscc1LAlRo80EvOZf
 bI97Qy3poimGqUpRJ0yFlmiZsg3Fp1gU938Ox+dv7TIqzlwoh6IX8XSoc w==;
X-CSE-ConnectionGUID: 6l56CRoJQS2nC2Z6n/oC1A==
X-CSE-MsgGUID: XirPoQUSTgqgY73v82QF2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="78871484"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="78871484"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 07:36:54 -0700
X-CSE-ConnectionGUID: MygktPdpR025g/OHEqJjbA==
X-CSE-MsgGUID: dvVTxZeMQqKSt4ud2AsRrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="228971258"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 07:36:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 07:36:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 07:36:54 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 07:36:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAUBiks5gLBW6Vla7Kk0UDm5DFWtmZg3eYr4HP+RnWvx+yEGHwQ4bYeiIDE2iVr2dZeYmw8YiZQLopEAQBJJTUiR7E9H2wHB/ORHo0t6XxJEySoWh4pWQTAfwXZ06wbbMfRzLhD/syfiGc1x5WQDp+MY15som1D3Bha2DN67Xma8rRMsV9tIDzcK4YYVDyDVYsO8D/hicDrrgkJkIlVVPJF9pCuDzvXLoWUKxMhR7z649HJXjKfR02tT7gm6VmRlJfO1BUtjPHYFWTwlOr+F8oZnbEdw0HnTuYEZrMw0PBJTWL/WdpLwqRKQ5lL40G9OCDpAmpOk8EWicpb30V1krg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0wNrsm+gf9HdR1nn84QJ4kpETG937t5nm+ZbXlaPiw=;
 b=TzsL9u+ekqJRAENJCzs5Jb19aMoa/jwYSmf/Pu78YE4ZRc0umbTC5OOt0XA9A44iac2WWyhbfcLRnXogD+LT7Mx2ziV5PyCIwYsQIKTylxU/6KtgVjLYbSVr4d44Nvib39EsQ4lFvpnWIXnFF/T9WD8bKSnLgsvzrm/0iZC8wfNzbWDHTGni8ZngWQxLax/L+Y4NFEHRTmAM3Rej4Nk0uvLQhgGLXICDA+qkXm6w2Uxdhfbef2pZx3LM+3W5O3DqQlDg6Pp2cKeNWExNpDJB5HKh8aiaHyHe6GxnmkA+1kT9mozmXvZK8BwnayGeNwhaOnDn86SrruHzkr8OJqF+wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DM3PPF1A34EE115.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 14:36:52 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 14:36:52 +0000
Message-ID: <6c1cd079-abbd-4487-b19f-bdf5e9f46c17@intel.com>
Date: Mon, 23 Mar 2026 20:06:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_pm_residency: Fix suspend duration
 calculation
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20260323070228.1383377-2-sk.anirban@intel.com>
 <acEPc8IixAYNuP5U@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <acEPc8IixAYNuP5U@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::13) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|DM3PPF1A34EE115:EE_
X-MS-Office365-Filtering-Correlation-Id: 8efd9399-91a9-4c6c-1c5a-08de88e99f8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: F8Sy45o1hH8faTvJ3QEcyJoGrg/jTFzwsWu7HEMdPHiBEFO1k3OR+Z1v+WcyN4M3B/T5syKQSkFMfEIZu04vNfDCJZBswtcgTpEHKRYp7pBwIht6fnfUJdQgpxOtfRsVBDWXV3ti83oYmgAn9RoI6dOqoOsl6Z5YSdasbxMdtvpCABQQLxzJtwFxKgOGD7ogrVcmtnepvnUMZVc4Dqyjk6UE9m7aTOZXA9ftdEF28LbLzxvv2JgR9fEJ87iblpCbzoR0ysxYv+WglBGGQuO0u+33lxpwSDxQaAq43tLTUVpArTsI4AQxcVmDdfw39lCiOkpOcWC+IVRtDAByu6Xwapb0iHctGWTzT9pfPcBNp2gYMGV5OhdnPnt/zNWeysdoO2WZ/Ho3AoB1/tpDDThFCqBoNLGs7phMVd9KSZL+t5s0U+Qp1x8RC3JOAnfF2Gh87fk68PHte31hwT56eI4aRAytj7o2I7ajqgEtYkevLt5vICZRjF/ua1cZWcx1cYHW7Fa2IgpLkiPsCwTaM3enwgck2BNrZpgaSCjHQ0oPJLpkVAEo4LPezW7WlDL6gi5KhSamhG3ftvTT1cj3qO/jPLigYGGbVVa8XQNVJlVp3kDdKyWRg5GSgzRgPUNuI8HWuqhdbqpWWH7hrRcguUFOWXpStj3oobT1MQ8LX0eLQBTHD9N2MmSwkq9LLAVwEoUt+IDTwaCKX1MWONasSOP9csnN/R+ZF6ozIvPfQ1sM5cc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1IvNEo0M2xkNUQ3MGduaWpVQ2lWL3JsRlJ1V09ld2Jndkl3QlJIQ25URCth?=
 =?utf-8?B?WW10QStNNE90REZnaFYrWUE3S2VRWk9TeGRScnNYa2JVMENBcmxTc3hOejJv?=
 =?utf-8?B?QzFlT0FtNmtaSWlZeDZKQnNDeHZwS3IyOENsa3lCdStUMEZpc0x0WHJ2NWUz?=
 =?utf-8?B?RUt3L1BINmJ3WDQvb0tKR2NHM3piVjNteHprenZqU1R3eDM2U2t4YTBWS3pi?=
 =?utf-8?B?L3o0UmJhRkVtWThnY29YMTErZFhyZi9DRC9MYU4xN2tmWmdVVXd2UkdlbTM3?=
 =?utf-8?B?UnlMY1dWNHlEWE1rTHptQ05aZUxXQlcrSFBydmk2bm5OWGV3VG93R0FiK2sr?=
 =?utf-8?B?NEx1eUkxY05PenliMEE5V0FTQWdaZmNnWG5UcUl3UlA0Q0R4dkN6TUpaaXc5?=
 =?utf-8?B?UEJLMXpUVTRRSnRtbFp4VVpzZEd0a0dmWS9NbitlZmk2TkJ5ZkRwTTVxYzY5?=
 =?utf-8?B?SC8vdXhIQVk5S3VKNVRVUWpad1lhUFFjQk9rM3NMWHFxTmIwNHdkaXc3cVdI?=
 =?utf-8?B?WFFhWU9kcnhEeWFYcTJVTVlIM2VTclhPaVRTb1plOWdsUklmeUxkeWhtNzhJ?=
 =?utf-8?B?WTBreDRNZk1Fd3lhdGF6b054bG5adnUzWW5ZM093M29HSi9sK3RuTXoyNTFa?=
 =?utf-8?B?QS8xZThVYk11K3lGQzJ1N0ZQdlRlY2RVSnBENHZ5cmoxU2FHZkYzb3lQQ0pV?=
 =?utf-8?B?dTVSN29ob2pLdGxwTEpydU1wQ0pZcldOdDhYSmptYW5kSi93aWI4TU9BUTZS?=
 =?utf-8?B?TjNtOTFpZVBybjZrdXNvQlh5VVVvb3pyRkRxbi9aV1V1UEFqQmdRaUVkSHpx?=
 =?utf-8?B?TWN3RCtYSXhQb3NXTkZna3plaEtReVVtVVdydDJMbHRtUHNLMnBUSEdjTUJ1?=
 =?utf-8?B?emJqTjdVSmNsWDhaTjEybTBzNTJkMDRNaFpQR3V4YkN3UjVOaE1sZlMvME5O?=
 =?utf-8?B?dEttYnlsWkFFa2d5K3hHRTFOczV1THl2RytQSkhUZ2FUa0hiNVk0NWo0QmdN?=
 =?utf-8?B?cFk0U2pUbDRDYU84TXoxbGpXZ3hUYlZGMk5taTd3VFdHWXAwWW1mVzExVlRh?=
 =?utf-8?B?VWZuY3l6L0R1RkYzUjFEbUsvTTFaSXBVRWRUbWpoMkp1dURhcTZ5MjlySmow?=
 =?utf-8?B?VGNidXVLV0tXdE4vWVdxSklDNGNPYUp4dzBwTlpFL3NGanlLQU1aUnBxS2l3?=
 =?utf-8?B?cyt0TzVJeWhDU0VlSExWQ3VtQjJIbnNIVmhtdHJxU0pKRHNJMGJncHE4QUI0?=
 =?utf-8?B?ZVIvTGJ3eEphWTMvZnMyY2FnUE9RV3JJd01yYXlqRWs3V3hHMFZ4eDFWWTZE?=
 =?utf-8?B?RVpJeEpuSzdqd3NpQ3hBaWlyVG05L2dhLzNDV2N1WFVXUmhuaGIydkZHY2xa?=
 =?utf-8?B?YmZZeFFVNjVzRkdCV2xRdEVmZG1XN1ZvYWZuRjBYQ2Vwc3UxUmx5U2VIMEho?=
 =?utf-8?B?c1FwODFhTWRuUlB1Y0Noc2k2dDBncElTSnFtQzltYUZQTFI5RUtuSkkxUlU3?=
 =?utf-8?B?QnRGbTloaldtOHVJb0JkaU9PY2RpaC9wZVI5VGl2RXdxbCtXa20rT240eS8z?=
 =?utf-8?B?dDdLSnZneFJsRWRwSjBjcldjZlpSV3hYcEV3UHd0VVJHbE9lWjBKZll6dmcx?=
 =?utf-8?B?bERkUG44TUNNNkl6YkNNT2pPWHZabE52S1E1Tk0yS1lMV2RSY2ExQjVJeHcz?=
 =?utf-8?B?b2ZpdGxjNHZIK1NDWnU2MThvV1J3UWhZOENOV2tOOU1yMXlVWDdtVGUyY1Bn?=
 =?utf-8?B?REgrTGYzM0MvUGxYMTdSWnJMUEljL25tWVJKRDdzUTBSQTE3dWdPTGF5cFNO?=
 =?utf-8?B?T3lKaUp1d1JKNjhXTDZFcjVVbE1XdzEwUzViZk12cCtqZFhnbGYySmVMak5J?=
 =?utf-8?B?QUZxMHNyalBNTXpFV1lLSmxLVGk2MmNrUHJxZjg3SVZPQTRMbVNrK2hpSkt1?=
 =?utf-8?B?TTcwOTh3UndHUWt4M2FIV0NNN0prUmh3TUdVNThzOUlwVXhaOGNFd3V4eE5l?=
 =?utf-8?B?MTE1YkZ2WGI1RzhaTE5qREdKMG9TdFZ6aTlzZEVZaUsvcTlvTVdGME1LUkY5?=
 =?utf-8?B?V0FRQW9kN3NoYjNiSC9mTGJLZVNTWHg0SUtabzNNY2FSSG5sRHpGY2RxUlVX?=
 =?utf-8?B?K3ZSUzluNUxTUGdvV09VY1FrbmdPMzRSamY5ckdGUVdmNHdKUWt2L1EzWVdm?=
 =?utf-8?B?N0pDZllaYTRMSDBmUjljNldEZGpxa1Y2N3Z2ZFZ2ZHo3MmYxZForZlZMSlFE?=
 =?utf-8?B?ZGlHTGd3c3lwRGVDN245SitsZHJDOWFUQ0NuSnRENE5jTS81cXlkM0VzV2Vl?=
 =?utf-8?B?M2Ryc0pGTmthM1cwckRNc2M5bVFpQWI4N1B3elJSc1JYVktJLzRLQT09?=
X-Exchange-RoutingPolicyChecked: duIfGaMImeVma7f2odeWq6e4okFgXnq2BBK1lOC9wfWM+6NvDiHkUl80kXxRipkN/mUedu+MWrai0qoAGbwBEelntlw3RV5oHrs8TqzUZ9v8Q+eMQB3LiGmUvCq7mpExZS0MHU07dy/qLN5I9SwahJRRPI30FXjfO5ju2jDUqedb8z6Wfrboxcq+SS0pPx6ucABk4AAyFzf+vZwFyvoreEQM8CsZcgqZ0HguHZZDR5CXSiFNIuDKwGwAeUjJhupgjoEfNsI0diFuZjxTDRqGEZ0bacvufuYnDQtgavH4FUF8xA6HicG7HLsZ7mkBnEjj2x5P6HpGhmzkITJNU4cvmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8efd9399-91a9-4c6c-1c5a-08de88e99f8f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 14:36:52.2254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NG1sV5TKmu0muZU5oJN+1F1ew7NyQfVLI/pAAWV9tcpF1jIvX0pjJNkjDIh+2+t5FzF0nUXG3Qzh3qRLT/u+Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1A34EE115
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

Hi,

On 23-03-2026 03:31 pm, Ville Syrjälä wrote:
> On Mon, Mar 23, 2026 at 12:32:29PM +0530, Sk Anirban wrote:
>> Fix the unit mismatch caused by interpreting seconds as milliseconds
>> during suspend duration calculations. Apply MSEC_PER_SEC multiplier
>> to ensure correct unit handling.
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/xe_pm_residency.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
>> index 61b63ed4f..46718a444 100644
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -223,7 +223,7 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
>>   		 * elapsed time during suspend is approximately equal to autoresume delay
>>   		 * when a full suspend cycle(SUSPEND_TEST_NONE) is used.
>>   		 */
>> -		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE);
>> +		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE) * MSEC_PER_SEC;
> Why doesn't the test actually measure this?

Since rtcwake is being used to enter s2idle, both paths end up using a 
15‑second delay as the command parameter

and this value is carried through all related calculations. Are you 
suggesting switching to a monotonic clock–based approach during resume?

Thanks,

Anirban

>>   		residency_start = read_idle_residency(fd, gt);
>>   		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
>>   		residency_end = read_idle_residency(fd, gt);
>> -- 
>> 2.43.0
