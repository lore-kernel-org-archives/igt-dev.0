Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9B2D35670
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 04:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5F288FB2;
	Wed, 28 Jan 2026 04:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KMU8zMlp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FA588FB2
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 04:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769573299; x=1801109299;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/QawZ6bZwarHkw7RezueF9T1+juljdI9p1KoGkOOzeQ=;
 b=KMU8zMlpEy2oPgbwkZM5vHMvc/nBWHlWb96WweqlnOWVFD1Yy+65QzUp
 4+lgHw2rafsbhk8MU0lpTk41vjP2h68amUVppH6PKX67Pq/3nuWeVhisg
 iZmFYwvJvRECau/DswuXUH8AP9I0oBaOz1mW2vDsQQdlpy6kiSx+WYaDI
 FXgR80KHagcvcU24LZ3gfTwjCwkT79JxqrEtrD2Vj5vE/dAdxzUN80JIV
 eBz6Wxp+UpKwGb6zmtgMhwwFIRhReCBxKd6F9cS+7E+1nGjowNIvr85+w
 a48MdxKOH64hoYR7TLAbeoGziNbGlDTQkIz9uxOhCQg+/J8IWKBzebNxA w==;
X-CSE-ConnectionGUID: N4tPgjaWS9SQXtCw3nWgCw==
X-CSE-MsgGUID: HqI75IbdSL6O2qDUworZqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="88356353"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="88356353"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 20:08:18 -0800
X-CSE-ConnectionGUID: JTaVlAfERZmvhiGqupd3mg==
X-CSE-MsgGUID: axRjcqlsRQWrdz0gJv68Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208174383"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 20:08:18 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 20:08:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 20:08:17 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 20:08:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZzPyfT9i2+DxlQzcH4mX//M3mziVx8eHKGI/2s3+tZbqAW0w4v8g4hWd9fzeBnwovSDmE3dYA+M+4dKoJSSm6/5kHKvqBo7rLlsYU9EKc7+998Da9+tpqDyARNUb49qfV30JkjjGsIilopPVOs8r9f8bOk8Jp+C34VZdy6bNVGGIpjO/ovcFxfEs/LPZ3mS1hW+YtUM1/eGegNdqJG1+uRZUISXpTseHslvdBhNRXwzkc8zHh+hXpYIbNczxlAqq9Tguf4m8ZkthODtcgJUTD5bATh4itaiAefnZDMEe7+vHy5nqVJXAEYt/3WJ7AdI9sGRrCWFsrCdVgdWEkicDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3mUv1Y6h6NVPwhpYV4U19Gd0pI0eo472KSHBAUAqiA=;
 b=qEojiQFT04TxKWLDew4+YSAOdx6CQmyskkglwrrXSv90a4iBDuP0/WtoG6rxAaJNmsXpkHtxCwXyO5FIZX2M6VzjqenO7zfWgCO/xf4p6AMKQapFOzP9KaO46ZWLFricI+yIZaMY3QKm0W3zWX3pjqGKo4Xayif/FlWHENnrvBe83Ls2sIzevwcGNxEtxaAdnZc3tyb5ZdNkmInU6bDCrceretAF8E6/djcPwqqFux2FTE2bu0C/08BaqRpzZfJQH3pReVAiN57CD1vvlIgn0jUOw5Z8bzgrC4CcRUFwxK7a4JaI++dKRJFoQ+UfA0JMORbkCsjJmoibgVc9NHEODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MW4PR11MB6837.namprd11.prod.outlook.com (2603:10b6:303:221::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 04:08:12 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 04:08:12 +0000
Message-ID: <a7d659e0-2962-4c57-877b-a2aa465e7766@intel.com>
Date: Wed, 28 Jan 2026 09:38:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_joiner: Fix var usage
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Jeevan B <jeevan.b@intel.com>
References: <20260127164018.63157-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260127164018.63157-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MW4PR11MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e875337-8517-4d94-3423-08de5e22da54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|42112799006|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1Y5YVFsYkFWL0J6cDE3SktaSGx4NmhCWm15V2EveXBwSE1wbkVhWXpjdUNw?=
 =?utf-8?B?UTBjbVF6a3AxaEtqRjBSUVF4bVMxanpTbXMzMlVtMEY4ZjNyU0I3WmV2S3ox?=
 =?utf-8?B?d3o5ck4vbmtMRHhIS3dvUnRyWENVS0h2K0VRRTd0UVpqc2dveFNMUWo1YllQ?=
 =?utf-8?B?UGx1UVpOeXdHUEZ6eHJKZHpUWkNNRWpxYlVVOEg0cUkzR0JMd1owRm1PVWE4?=
 =?utf-8?B?UkFQMXdEaFhOMEp1dExwNit4VDVuOCt4RUx3L29QeE92d1BkeTNuM1BsMkF1?=
 =?utf-8?B?SGFEckpGU082RTJMMXduWnJBZWxrYUVqTVRSZndKc0s1RUx6eWN4bEE0UytD?=
 =?utf-8?B?Y2pCNlk2aldyMkRpZzhxK2h4bGQ0clZpQVh5ZGZEQkpNcnVZUUhiYXZjU1lQ?=
 =?utf-8?B?NHB4dXczcXhiUUloV3grNklBZXYvQThhTnRUcHZRTU1tUGcvMjlRK214UXE5?=
 =?utf-8?B?NEhHcktpZk1hNVA3NHhhTDRpL0lvVWh2TDhSb0RLMGZaTXhtR2RZUlBLMG93?=
 =?utf-8?B?VmJ1cmUrcjdGdjBSdHVpemRIY2lJQ0wvM2lQUlFRZDYwajl5Wk9PV3FrTERK?=
 =?utf-8?B?N2JvcjRGOVIyK2JQVUFmM2ZuekIzejFtYkFIY3hkbk40cmtZWDh4QUxtajJi?=
 =?utf-8?B?d2lxcmN0MTkzTi9KSDlzY2pUOGN4OXNVMi9BTXhPM3VvdXdtSnMra3BxTzM0?=
 =?utf-8?B?VHhVL3RneTd1NVVZamhER1gyakRDRzN5azRSbk5CdEl2MlJLUDdWREhmdklW?=
 =?utf-8?B?YjRHM3pURURVdzZpdjVJV0pNcVNJeTFYQTNzTjR5Z3J3TXpuNXRFTW1uOU42?=
 =?utf-8?B?MTVSajduaDl2RUVHejNPT3pXSFZLNitKekl0c3huZE9kaDMvSnZyNlJrNWty?=
 =?utf-8?B?eFZEbDZyZ0FncHJiVGlTNWZlM1R2MHFqamtxUEY2M1pyWS9DQTNiZE5wdWhI?=
 =?utf-8?B?c2FKcngrcFl5RGNnanBrekNLdTA3T0toeWdlOStaa1ZuRVplZEY3MEllS05W?=
 =?utf-8?B?V2ZwQnpEUGFlazljcTJZZGlydy8wRmwxUzRyUnBwSVc2UU5zV3JrZ0pjbGtJ?=
 =?utf-8?B?WkNQYVUzdVRxYWtnT243eS9oZ1M0b0djNE5iUk4vSitYZ2ZCamVBY1Fjay9N?=
 =?utf-8?B?VVNtOHJyV1FGYlZIWjV3VTFGNVVFR041NUI1eDNyam5uVGYvYmJvVWQrekVV?=
 =?utf-8?B?Si9EdXhQQ1NlSUdaVGh0MmRGVFUvWnFnR05sbDMrZWpTZjhYTEErTTRzRG1m?=
 =?utf-8?B?SFdVQ0t1Q1Zmck0yUlBBZXl1NXhRV2FYeFQzU3l2cmhhcHRTcWFBRThWZHFF?=
 =?utf-8?B?d3VxZTB2R2lndXd1a3JHRTBkSG9VL05oZXU4Wjl0cXEvdkNQMjRhNXl0VCt6?=
 =?utf-8?B?RER1YVJvM1NFTHlVRUtTME1uSkU0ZHJmNG1CWHZXdHN4MHM2ZWZyNnZqTVpX?=
 =?utf-8?B?QlBxblJVVmZUM0dnZ2hzYitzN0J1QnJPYXU3OE9HVGp6SzZXQXRrdmFLVmNv?=
 =?utf-8?B?NlY5S0QxTWNtazNCOENBbFZaYTFxMzF4eHVJcmhoTWZlY2ZtcnFacEUySHFG?=
 =?utf-8?B?M2ZOT1o2VGVsTG5CaVZZOXBCdVNzZXhUcCtqOGp4WVBpbFIyWU9SQWVJblJM?=
 =?utf-8?B?VGVrdmtSOE9uTFh0RWh5ZC9Tdk9uRThER3VOcHQ0VWhGa3E5cUJUZm52aVRh?=
 =?utf-8?B?ejRMWWVBQmVKU04rZ1FBejFMbGlsVG5wMmZTaWZEdTF1MnZqSDJiRWxHa3NX?=
 =?utf-8?B?WTB4ZVBBaGJFbkNmeTh3eUR2RkVFS1QrSldPUklldjhFQXFuNlgwOWFPK3Az?=
 =?utf-8?B?ODFiSklBRkZJOXVLaTNQeVkxdFVwYlp6K0V1R2VIZjRrcktzU2ZQaEhoMU9h?=
 =?utf-8?B?NHdQdmU2TUFmV21ITGdUVVg5ejVid05QTVdPUzNESXBCcWxoL3cwMk53UnZM?=
 =?utf-8?B?Yjd2bG92d1JlNWJhb0d1b3VJcllSNU5PV0Y4R3p4dTc5QVZkSWJ4RFBuMFE3?=
 =?utf-8?B?elE1NXdDWktrTXNjZVZNSG1wSjloMzE4cnQxQjhlU1g0ajU1TnVOL0RDc1B5?=
 =?utf-8?B?QnlRbW9rcGxRUXNMWFZFd1IyQWJnaG9vYVg0bnp1bEo3eDVMRkMrR2xKR0ta?=
 =?utf-8?Q?iidY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFhoR2lmejhyYVJ5dW85U21rdVEveGxpTEU0OXNjU3V1NStvclQ2d3djUXVW?=
 =?utf-8?B?dFBlM2VPSjBmTEI0d2srVE1TWkRhMFMrOTQxdU42VTM1SXIyZGtjRUR0am5Q?=
 =?utf-8?B?OVM0bEYzQjZYSDI0a2J4Z3BvSXRWS0RRbWxRTmliMkhyUndlKzVtbU5hTEZm?=
 =?utf-8?B?bUUydjVSUlJqNVdiL1dER1NYL21Yd3RnaDhVcGRlRTNXZ202enFDTXYvNDFM?=
 =?utf-8?B?VDJlRzRSM3UrUTZ6OEpjeXQ4Sm9pQnNvMGJIdy9vNjQrQU9uVGJUQ3ZhdUpS?=
 =?utf-8?B?bzFycWNzUVpuaVBhd1d4OW92R3hMUVB4R0sxbDFJK1A2dlpjVG5xWTYrVC94?=
 =?utf-8?B?YXI2endQdTBoRkYzRHN1eEJ6ZXkyQTNpb09kVUU1RExkTVZaUEt3M1JZMlpn?=
 =?utf-8?B?NWlUcHMwWm44L2dJbWdGL3FqUWdGbHJEV08wTURTN3BkL2RPMXlTU1JuNU5L?=
 =?utf-8?B?ZVY1emtkUXdiSXZ0cmpNUUdub0RaQkhkOXRxT2ZMZjF0bjB5N21PQ3RmY3F3?=
 =?utf-8?B?bGMyV2ZjKytlY1JhelJJaS9nVjZURXhMVjVUelZJVUp4VDFlcEdITzY3YnhT?=
 =?utf-8?B?WDBFRDZrT3UxOGg4QmYvUUxGNnRGM3NRRUxlUDkyQTExMnB5MGhTYThVVUl4?=
 =?utf-8?B?OFNvbE5nZDlCbkJidDQwTUFUN2dBUG1kSVA3RUVjRVNoL1ppTHRTaExMcnBW?=
 =?utf-8?B?TWtvZU9nODJzelVQUzJTNVpKeGtXNW91MU1lNnBpTXg5YkdzM1UwRlNCb3FC?=
 =?utf-8?B?Y0krR1NhZ3haczllZVhaZFU4dGp4eU4zNXM5WWpLVE9XdlUwWTdnRFlPWVQw?=
 =?utf-8?B?d1pwVVFmcW1jbTZRa1pNdzllcGhPRjFTRGdSR1pyZDZWT2ZTdVZYTFVaVnlT?=
 =?utf-8?B?cFhyR2hsS3ozMjlsOU9SOTVHVTUwUzArMzk3WHY2THlQK2F2K1dLVzN5YUMz?=
 =?utf-8?B?bzEwczNtZDJYOW41VEdHZys1OENxMTJ1QXlZSDM3dk9pK2htRW0vem9aWXZQ?=
 =?utf-8?B?dmRUN2pQSC83dmNBdWJkQzdxUlkrTHFpKzlIU1BSYTZaT3BiV1h1N09xY0VD?=
 =?utf-8?B?NzFDNnNvMzdDcXE2UkZYN0cyUzk0WWNLY2gvV2l1MHRTTlY1RVJxMHNrdlJZ?=
 =?utf-8?B?ZTdXSXh4anBZWnFPOURGaHlZUkhpZjhSWVdodjl0VDJQSU1MemI4SHBEL1Jx?=
 =?utf-8?B?K0dTYmhtY0JaZVp4UW5LY2hwR1dWUWtQVUIwM21WTVV4SVZkeWlGandzS0Fj?=
 =?utf-8?B?b2Vzb0U2akVKMDdPSEYvelNQSWE4d2t6NVJuSko4UzdLdEViMjVMTTY3WEF4?=
 =?utf-8?B?eHExLzhDZmNzYVNVVndGYlJ6Mk1zTktjRURjVkMvZEZTUTg4Ykp1N3RHdkhj?=
 =?utf-8?B?aTQvNDVKcDlCOGlhdnllNHpUMklaMlh1dlRkM0dmamxuQWNEaFBhTUNVb2lS?=
 =?utf-8?B?N3VZME9laE80ZU9nM1NKTUxDU2NsNkwrbzRHUU9Sd3RNS0psR1FCaWlzZkRY?=
 =?utf-8?B?SkNTV0VrNzZuNzYrSklqbmZiOFE5cXRmV1ZlQ0k1amozR25DUGxEK0krcWha?=
 =?utf-8?B?VUxVb2hSR2p6MUcrNTN0ZXhLNjZRN09KS0tmd0REb29ZV0gxcnh1RXdiZWtR?=
 =?utf-8?B?TjVuK0FHdVA3VktvMlN3V1dRWmErRDNDQitnaXZpbzVqZ3c2NjA2US9GT3Nk?=
 =?utf-8?B?QXVZMGV0MWRXMW0zMm1KZzc1KzZQZjFkUDJXb3lyTFlsSStWTDlRTXMzaGM0?=
 =?utf-8?B?M2tzY2d3OXUwQmZyeFpLaWpST29PK0cwU05jMXFIV0ovdHlKY1E4VWFwaHNW?=
 =?utf-8?B?czJuei9RcEQ1MktURmVDS0VlQ09ScUlhTFA1K01KUGFLMGdqUGZkYW1jQ0xq?=
 =?utf-8?B?cGJlZ3oyVEpNYnlVejNxNmJhMzZwaEswRFUzQzI1S0d2WmVvemZsMEtaVG1S?=
 =?utf-8?B?RUpYaGlQS29IUG9mbzZFNTdIZjJyZlVFMVVhNU4zWWpBVXdnOXNHVGlOS1ZB?=
 =?utf-8?B?QTA1Yy9ZMGZvSXpRUnQ3YlBBNnZ4bTRYQWZhL2tjK0w2QnN5dlNCdnRUc3pv?=
 =?utf-8?B?M1FDd2tqVHhhYlVHaVBJc3lKWHBIakF0eHJlR3VIYnpMbGZidXprNS9CamtM?=
 =?utf-8?B?L2NmdktSWWhxczJUQ0hobG9uQVlhcHpIckErTXpGdU5jRGR2bGl4U08rNVQz?=
 =?utf-8?B?TUFBbG4ycjM5Q3ZNY1ZFMUVpbU0rNDVrQXZMZ0FWb1g5MmRxYTRkUDRzYlV2?=
 =?utf-8?B?NE9ZdVdnT1Z2LzlzMjdjWHdrcEJjdDlBWmNFTHVQWUlTQnZ4dHBNT3lSOWdm?=
 =?utf-8?B?eFNQc3VYRHVGelp4TGNhbU9PS1N0UUJlNjdJejZ4dlFwU2xxWHQ0UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e875337-8517-4d94-3423-08de5e22da54
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 04:08:12.1572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: forDonb6legaL84+LLxmVGWVFi5dduNu+DGTYBcEwfP//a71bQC2yQ6CoPXO2qVdmqGQy1oOPoPu6G4NJ/sTBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6837
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


On 1/27/2026 10:10 PM, Kamil Konieczny wrote:
> Var ultra_joiner_supported is declared and later on used in
> subtest switch-modeset-ultra-joiner-big-joiner without previous
> setting, which could lead to unpredictable skips or fails.
>
> Fix it by removing its definition from a function and replace its
> usage with proper check.
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Jeevan B <jeevan.b@intel.com>
> Fixes: 319db2ffba41 ("tests/intel/kms_joiner: Add function for pretest checks")
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_joiner.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index bf817a453..1f8d6600b 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -581,7 +581,7 @@ static void test_basic_max_non_joiner(data_t *data)
>   
>   int igt_main()
>   {
> -	bool ultra_joiner_supported, is_dgfx;
> +	bool is_dgfx;
>   	int i, j, display_ver;
>   	igt_output_t *output;
>   	drmModeModeInfo mode;
> @@ -755,7 +755,7 @@ int igt_main()
>   
>   	igt_describe("Verify modeset switch between ultra joiner and big joiner");
>   	igt_subtest_with_dynamic("switch-modeset-ultra-joiner-big-joiner") {
> -		igt_require_f(ultra_joiner_supported,
> +		igt_require_f(data.ultra_joiner_supported,
>   			      "Ultra joiner not supported on this platform\n");
>   		igt_require_f(data.ultra_joiner_output_count > 0 ||
>   			      data.non_ultra_joiner_output_count > 0,
