Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D17E68174
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 11:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBE610E21C;
	Tue, 17 Feb 2026 11:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C0Wt55qZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740A410E21C
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 11:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771327867; x=1802863867;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bF2rhqU9B3qRPyZI98WYg+K45NzmuqXWtPxkcAnwBsc=;
 b=C0Wt55qZrBdsZq83lZtCf8wanCyWI5O8ucy2ya+s9U6LyZAu2KT/czeH
 LKMUKSD4/tlVAXNGZlZrb/jL8QEbxu7I2r5cc0WZqo8B0t88RbGxpIUVf
 FQU6PuMAYJLMVQzU3/GYu9yTy85gLhXYLZHIVoh1vQAcQCajpzA+vo8qs
 w+yuB+jrJ56Q76QNnmfRemRoaah2YhYWMeillAxZyA4K2ajbfl4p9KJ3F
 Zzz/y9RxzC0i6NMp5RVRUuFUCafIBW6kGuRXknRND02+Hmx0zFy3jsYoa
 b7hEaRaeypMv9Cx/Y6ocjIRSD6jaqO2ebYgqSBE3xoq/l/fMt+07JjfYJ Q==;
X-CSE-ConnectionGUID: bNO8kZGZQ6uDNa+A8op/Wg==
X-CSE-MsgGUID: sPYF3JOfRYCSTu3z7wUbDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="95024605"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="95024605"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 03:31:07 -0800
X-CSE-ConnectionGUID: QrRGfIFoQ6KZEzO0emcEYA==
X-CSE-MsgGUID: hW84+EBcRQ6NnevKbpQ91g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="213955790"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 03:31:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 03:31:05 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 03:31:05 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 03:31:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KaaC7HvfIzv8Vb7YnPaWfAKf7MPIZHbCi6vcV7kTRHsbJDTV762HzmEnDeThoWl5EqHyAnh0404xKiYbG4BIW1ZN35jndtNO868kBCx1uKBiq2NoiP5LIt9yhJX1hRxsDVskslQuBku2C8cnqsZ4pPXDh82wyXdcKYAeZhULHaqMYVp1PI8cOoMX6eX6k1U6W7U8+mWoiBsTUvc/CW37wZnSqLRnh/Tu0pd3tlguCOyeo0AEfknSESneoVSH204OySCKttFKSUECkLFhETHX2Ks4GF+8DF7OkCLyiDg4fZ5lunXgCnqd5bu57zpLVkLcNipMTNtl3dXTjHs4suiijQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LH7om0rwa5LC9U7vAplTqQ9oAMQshqTFln7kKya1cEQ=;
 b=iH0kEZ1bfVZBknl6fCIz4hpHFLMynhJGSNwME/i6g1T+GIZOwJ2CCugIqSDrIJHtBgP6ndr/nEvQ4d5/J89esMbch4JdSQ1ndNBlgpNhgnr2GXd5l5t9TOYF3LuriFeUMVqoKEnf8pRL9Jnjcv225TbmthIIfwcbNfcbnOqN1amO7FAH86sxxsqJk8RX+CPSMIOXwhl6gmFXspsRsHohLcRf5V4DGJKWTGPFsotVf1O2x6YntYHF+HC5SDA6bm3zJIBKjvuJxFDiNwthQ5sfXtTA8PmC2Tc+SQRo74PwdMIfUs80ZPzAX0MDGv9P3CFwFjo4xsGkooEAz04aCwDsdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 11:31:04 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 11:31:03 +0000
Message-ID: <f515be1e-6451-4300-9894-ecc08fddb8a6@intel.com>
Date: Tue, 17 Feb 2026 17:00:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] intel-ci: Rename chamelium-only testlist to i915
 specific
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>, <karthik.b.s@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20260217091838.2508942-1-mohammed.bilal@intel.com>
 <20260217091838.2508942-3-mohammed.bilal@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260217091838.2508942-3-mohammed.bilal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0185.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::6) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: e914d4a8-f669-4f8e-2073-08de6e180898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVQyTTVzQWhZYkZ3Sy9vSkVKc2JlUmw5eHp2eGowYmtFSk4rU0tTdmZzUkRn?=
 =?utf-8?B?RzRwK29ZbDJrM3BITVh6RlplckdjRmR4TWs1dlZuUTk4bzBLaFhXWmMyUW5R?=
 =?utf-8?B?TXdqSzZ1Y0hrYVlNTjhLUFM4SVVLSXc1V3VrNHBLM1JZWkowWE9IV2Z3aXd2?=
 =?utf-8?B?cjJJZlR3bTZwU2ZnNURWOUlaRCs5ZzZ0dUhBeDBBNjhyd0JvVVVMTFRxamZD?=
 =?utf-8?B?U0FicFBwT0V4aURXWktadzY4bkp1dHdOUC9WamtDblhlbkdjVzZRME5UZHE0?=
 =?utf-8?B?VE0yZ1hUTWU2MUJscE53Z1E2SFBjTGQ5QWVrQW5ycEFZeUZNRUVFTzF0cFZE?=
 =?utf-8?B?Y2NJUGcxRkcwS3pVcFMzeEh6OFJjRm1Bai9yS1BkakxiWkN3NFJ0ZlQ3ak85?=
 =?utf-8?B?UjN5dzFoV0gvNTYrdnNWeTdOYmQwMmxLRnhtQlJIL0ZUUHJDdDdxMStOZ1ht?=
 =?utf-8?B?SDNSa29Vc2dEblBPTmFCSEJBbDE2L2dWUnNNZWVrYXcwejluL0llQjBYSExn?=
 =?utf-8?B?S2tmRUJNaFJkSXVlS2JPSXc3Rk5NcHRJMGlkUllQNjNXVVJmQVYvQmcwR2JG?=
 =?utf-8?B?QW42VU1wWlRaWFp3V1d5NlpSemlja3JTVGpsazQxL1hXdER2R1ZISXdhMk5S?=
 =?utf-8?B?enVNdk5GQnFoU2ptd1JUeFkxVm5vOGZPeVBOamRVNU05UXpQRGFWTHlvRHo4?=
 =?utf-8?B?d0dLM0gzQ1EvU2orYStPU2dnZEs1ZExraDhXR0kxWlBRRnZib3k2U21IZjBs?=
 =?utf-8?B?R3dFRTZ1cEs5OHVpVmFhSEFPd3R5Rzh2TEdBLzFZWm8zREpwTjZBUHk1M0dT?=
 =?utf-8?B?RnBlVnFGNjBqeGI5ekorYkozQ3l6WE9JQUNUV0VZYlN3RWZhenpLSGVxbDlv?=
 =?utf-8?B?UFA0eFMwWVpydkxZR3JhekxKVnNYZFM2RjBSTGttWUtHT1pSZDA2ZFNydGpp?=
 =?utf-8?B?c0dHc1U3TEJvK0FMWlFWSjBzOFAwZUZ5SWU3YUJIRlFyWlFXeGcxNGZ4QmNz?=
 =?utf-8?B?MGpkQWtOMjNPWGlkakRTZFg5N3ExalgrdGcxVnpwTlRISCtnN1Y2cXorRmt5?=
 =?utf-8?B?TFlDeS90QzJKbzdTRjQ5djRadGlMZFBKbVNFdzBVNUlKZm9YMHcrT3BVTXBC?=
 =?utf-8?B?OUxaNm55czBTOEgvNno5VUJaVmMzVHVJbDVJYkVvMVhDUlpZUzFMVWZvYnl3?=
 =?utf-8?B?bzhiUDZTaVEzZzlyQkVwSEtwN21sWWNpNmRHdXE0eGRkWlRtTGpTS3JubUpw?=
 =?utf-8?B?RVV3K2ZHZUZNREp6YVFGL24rcGl4a2lSK2ovaFh1YjNITDRkZmg4akxOdHlN?=
 =?utf-8?B?UnhlWTN0ODRnNjdRRzQydmJHT1hpSnFsT3pTWTBRL0hPbU0yMDFTdTJCS2Ry?=
 =?utf-8?B?T2p4WFVaYlhtUHZJYmJEL253aWk3cXV5MnJuR0FVZkdod1prTDJoL3VnNDdY?=
 =?utf-8?B?WUEwaDAxU1hXZ1lxaUxpOEl1Q1VKbDh1MWVBckU3TXFtMmN3TmVPL1Z6N1RN?=
 =?utf-8?B?SjdjSitkN042bURnTnJTc3hCNVpkNFpidi9GOTRBYWdwdndWOXJoZGdtSnNh?=
 =?utf-8?B?UjVnRnBwZVo0YkY3SE9mRmx6ek1ucFFYMUh0M2w2cWR3NDVycjh0S2ZxbFdT?=
 =?utf-8?B?TXI1Ykdia1FwcjFWSDhjN3FHMlVIWGhwRjBxaE5iSlgvM0RKRTJVbTdPM2Vs?=
 =?utf-8?B?OHRTRjhtaGFPMGRVZHZXOEFVRmNEVExpL3drUnpmMWNFS25ka1JMSG9BK2Er?=
 =?utf-8?B?SXVHUVBoYWNRUHRLYTF6VWZybkJCWXd3a3BITnlxVWtWYWQ5aHZhK3NjZ1Fl?=
 =?utf-8?B?eXpSbHVPcUQwNHU4RWdmVEZCeG43WlhGMGpRQVRZejJOcGhjR3RFNUlHYkhK?=
 =?utf-8?B?VjZnNTBOSiszZWhJSkQzUVc5NmplUGVmcXVwZlF6VEx3SVJZbGdkK2I0MGF4?=
 =?utf-8?B?SVNNWTgrTkN3cXArbTlWRXkrWTlZT1E4RWV2ODhRMWVvVmZZTWFjSmhxYzdm?=
 =?utf-8?B?K1NHMm8vMlVCYlZQcjZuVU1BR1FYNDhWM3orN3JMRXNLN1ozNXBGbVFoV2Zl?=
 =?utf-8?B?b05vd2pBM2o3K0JobDJ0Sjh4SzZQeUtZa1dBT1pGOGw4Z00xTVZ2allLZis3?=
 =?utf-8?Q?xbXw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlZzM214ZGk0RTc2TCtoTi9xNGxKUTJFb0xjMzZoQStXL2hoYjdmcURRL0Nr?=
 =?utf-8?B?Z1RLdkdxMFpVVUQvUWVVbXZ0M2ZEQ01DZ05saU82MlZGdnZ2SVVrOGNUdGVj?=
 =?utf-8?B?aUlob2lMelhzbmlBWGE2eHVsN0JjdVh6dVE1M1ROSUdtT2U3eDFJMkxUbldy?=
 =?utf-8?B?ams4eHY4Z0l1N2pUUzVVVElTcEJHRVhscVNTSmZtVEs1NnRPLzNZNVVlaS9N?=
 =?utf-8?B?UGFPVEpSV2Z5Uk42MXFXbDJXaWtmVlgweWl1SEdRRzlLQ05HVkk1ek0vbjkw?=
 =?utf-8?B?c283b0ErMjZ0ZkJpZDJpQXk4L011WDJWZUtpdmtXdDVBQ1FOZk83ZmMyc092?=
 =?utf-8?B?VkhxVzl2azRTT1hwZlMzYnMxZXdVcGtvYnNDYkNsVGsvc3c3MkMxT2N1cDNh?=
 =?utf-8?B?dUVjeGt2ditsZEVkZmE2Q2JQVHNjc3lEeXp6VlZOeFRqVU8yY0tOM2ZwUFcr?=
 =?utf-8?B?SWptTGp6aExNcjF5WEk2NFVIMjIycmx2cTU4MVRrdFYxZTdvci9VWG4vM0VJ?=
 =?utf-8?B?YkJkYWhkeVVZSUwvU2J1K2kzemQvaFpUZnlSaTJXUDBIbVBEcXlJTS9Vbm1B?=
 =?utf-8?B?dW1lOHlvMUIzTmVGdlRYVFM4Tk1CK2hTNzNsUC96MnEraU5pWXVUTGpDbnkz?=
 =?utf-8?B?U0xkRDJJZXBqVVlKUzViSnJ1SWIyeXNHc1BTQ0RNczNRTzY3RWhmYVI2SE9s?=
 =?utf-8?B?enRtcERzdDM3dFEwRUg0RkVDa0tzS3JCQmNNQTFnL3QwQ2dpR2RKTVlGYnYr?=
 =?utf-8?B?cEk3OTZKcWpvWmJFc1BUSDR2cUJ5eGRMZ2RkZkwvS0dZMW5jT0RKMEltb3Mv?=
 =?utf-8?B?WnRuZ3NQdmFUMEF0RDhvRGQvb3FjQVhpUk9KMDJLVndnWCt1djZZZjlrQXpa?=
 =?utf-8?B?L1Iwblc5QjR4SURDS3NwSWtDbCs3bjNQeVNNNjNJTEI5ZkllYWY4VjJkR2xi?=
 =?utf-8?B?eC81dGFHVFFHMHZJY1ArWDErcmRseklsSmNRZEdub1p6R0pNb25OMm43QUFI?=
 =?utf-8?B?YlZuN0NkbHM1TlJRZ3BzVDc3b1NMbEwrTXc5UE80N3J6Vmo3SkRHc29pN2l2?=
 =?utf-8?B?WlBPcFA0bWJHSUltOUZoUlI1QW1OK0djWHBsbzdodW5WWm9TZmhlUjN1MXNM?=
 =?utf-8?B?VGNYZEVwbEhIeVgwYnl4VkFFYjdyQkFjRUwwY3hINkptVFUyZmtESjhtU2FN?=
 =?utf-8?B?ZnYxSG5jUjNoTWU4MXNGWEtQZVY4ZEtFWEZEcDhESnRrMENaTnR2dzNrYWhT?=
 =?utf-8?B?WGJHcHBkK3JuWEtJOW9mR0l5U3psMmxxYlVJSkFkNm45dEpOaUFGbDgraUxX?=
 =?utf-8?B?VXIybjRKUktCeU9Td2NKMkh1L2pBQ1hNL0NGNDBGaTl4czdFNS9IanJkM1Q1?=
 =?utf-8?B?RTRJVloybk5Cb0hVeUJiQ1Y2eC9ENkZEcjB0cHJsejJTeXBFQnpKQmdxaXdr?=
 =?utf-8?B?SXd0K0lYRFRFZ1luRkNtUVl5UUNzQ0VOSE1rL1lSTmNUbjluV05wK3p4cTA5?=
 =?utf-8?B?N3duclM0RlluVmlxaVh0TC9ybFdBYWFWWXZrWjZHQ1k3QTluZFFrbmJRR0xl?=
 =?utf-8?B?WE84STZpUDk0RkRlVU9QTWFWMzNGUFRCazJFZk9URW5Ta2FpL21VRzFiZUs2?=
 =?utf-8?B?ZzNQb1F2Y1oyNHhTSDdmOHpBZ3R6RUpmanNyYWpWRFFTcHlGSVJWN1RNM3F1?=
 =?utf-8?B?WndaR3J5bWNHaWphZzJtNHA4cFZuZWxBdHp2d2RtTy9FWWg1L0RBL0hDWFd6?=
 =?utf-8?B?a2pGcnBxeEdmQmdnZmpyd0dkMmdMMnZvdVgrVkF5MFRKTUV0Uis4dTZEUnI5?=
 =?utf-8?B?REx1REczaHBqemRjV1pIVys5TTBMWlhiamZWRzJKTU1HMTQ3akRyNzNFcFA5?=
 =?utf-8?B?dVE1Q2VocXp0aHRLUDAvMUJxdkdUUzJKQ1Y3TGszdUQyd1Q1UFBqb0ZZaHNE?=
 =?utf-8?B?N0NxZHJtMCtYc1EzbVZweGgyYnA0Q2NmTHNiVWZnU09ZNk9aQXZ4bjZOR0ha?=
 =?utf-8?B?VVYxejNmM3JCSU5sbE1RVE9CQnpHMlQ2a0pTLzVZLzFTS0wrdjFUbi9LRlBs?=
 =?utf-8?B?MVlDc3pFNzJScDcxN2xPVFlGZ296L1UzaEZucnZuU2tEc0l0aUsvekx4RUU2?=
 =?utf-8?B?azNKOTN5a2h0Vk9RcnRTakFrTG40OGZFY25Iayt2cC9OeGd6WXJ0amJNeWRw?=
 =?utf-8?B?MjhEN1hoRFJsN3doVGlqRXFZdG8vUGJhUzNpR3htRGtXWXBMQmlqMHA0U0Fr?=
 =?utf-8?B?cmlZMWgzcEFjcVZWZDlNOFZjdkdoMEYzQ2NXR3Z1N016bjZJaGg0ZFhtQSs1?=
 =?utf-8?B?WmVMblc0WUlOekdwdGxIdHQzZjRtd1RBcE5zREJNMTRSZ2d5aDNqUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e914d4a8-f669-4f8e-2073-08de6e180898
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 11:31:03.9084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaPBMt4NslVDfUYqKpJQDP5ZT3ui7claqgNAQhVdv+9XYUuFubi7rbxItyjSDTfpwqS1jQYOXIegBilgh7YB1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
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

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 17-02-2026 02:48 pm, Mohammed Bilal wrote:
> Rename chamelium-only.testlist to i915.chamelium-only.testlist.
>
> v2:
> - Move suspend resume tests to the end of the testlist (Kunal)
> - Comment out random-plane test (Kunal)
>
> v3:
> -Use move-fix-add approach (Kamil)
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>   ....testlist => i915.chamelium-only.testlist} | 23 +++++++++++--------
>   tests/intel-ci/meson.build                    |  2 +-
>   tests/intel/kms_test_config.json              |  2 +-
>   3 files changed, 15 insertions(+), 12 deletions(-)
>   rename tests/intel-ci/{chamelium-only.testlist => i915.chamelium-only.testlist} (91%)
>
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
> similarity index 91%
> rename from tests/intel-ci/chamelium-only.testlist
> rename to tests/intel-ci/i915.chamelium-only.testlist
> index 9adace28c..56bffd8de 100644
> --- a/tests/intel-ci/chamelium-only.testlist
> +++ b/tests/intel-ci/i915.chamelium-only.testlist
> @@ -12,16 +12,14 @@ igt@kms_chamelium_color@ctm-negative
>   igt@kms_chamelium_color@ctm-red-to-blue
>   igt@kms_chamelium_color@degamma
>   igt@kms_chamelium_color@gamma
> -igt@kms_chamelium_edid@dp-edid-change-during-suspend
>   igt@kms_chamelium_edid@dp-edid-read
>   igt@kms_chamelium_edid@dp-edid-resolution-list
>   igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
>   igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
>   igt@kms_chamelium_edid@dp-mode-timings
> -igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
>   igt@kms_chamelium_edid@hdmi-edid-read
> -# Chamelium v1 board HDMI receiver supports max 4k@30 resolution
> -# removed test as its having a mode 4k@60 resulting
> +# Chamelium v1 board HDMI receiver supports max 4k@30 resolution
> +# removed test as its having a mode 4k@60 resulting
>   # TMDS config errors on v1 board
>   #igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
>   igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
> @@ -33,17 +31,17 @@ igt@kms_chamelium_frames@dp-crc-single
>   igt@kms_chamelium_frames@dp-frame-dump
>   igt@kms_chamelium_frames@hdmi-aspect-ratio
>   igt@kms_chamelium_frames@hdmi-cmp-planar-formats
> -igt@kms_chamelium_frames@hdmi-cmp-planes-random
> +# Tests are exhaustive and pick random configurations
> +# removed tests as results are non-deterministic on each run
> +#igt@kms_chamelium_frames@hdmi-cmp-planes-random
> +#igt@kms_chamelium_frames@hdmi-crc-planes-random
>   igt@kms_chamelium_frames@hdmi-crc-fast
>   igt@kms_chamelium_frames@hdmi-crc-multiple
>   igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
> -igt@kms_chamelium_frames@hdmi-crc-planes-random
>   igt@kms_chamelium_frames@hdmi-crc-single
>   igt@kms_chamelium_frames@hdmi-frame-dump
>   igt@kms_chamelium_frames@vga-frame-dump
> -igt@kms_chamelium_hpd@common-hpd-after-suspend
>   igt@kms_chamelium_hpd@dp-hpd
> -igt@kms_chamelium_hpd@dp-hpd-after-suspend
>   igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
>   igt@kms_chamelium_hpd@dp-hpd-fast
>   igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
> @@ -51,7 +49,6 @@ igt@kms_chamelium_hpd@dp-hpd-storm
>   igt@kms_chamelium_hpd@dp-hpd-storm-disable
>   igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
>   igt@kms_chamelium_hpd@hdmi-hpd
> -igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
>   igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
>   igt@kms_chamelium_hpd@hdmi-hpd-fast
>   igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
> @@ -61,7 +58,6 @@ igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
>   igt@kms_chamelium_audio@hdmi-audio
>   igt@kms_chamelium_audio@hdmi-audio-edid
>   igt@kms_chamelium_hpd@vga-hpd
> -igt@kms_chamelium_hpd@vga-hpd-after-suspend
>   igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
>   igt@kms_chamelium_hpd@vga-hpd-fast
>   igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
> @@ -69,6 +65,13 @@ igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
>   igt@kms_chamelium_hpd@vga-hpd-without-ddc
>   igt@kms_chamelium_sharpness_filter@filter-basic
>   igt@kms_tiled_display@basic-test-pattern-with-chamelium
> +#Place suspend tests at end
> +igt@kms_chamelium_hpd@common-hpd-after-suspend
> +igt@kms_chamelium_hpd@dp-hpd-after-suspend
> +igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
> +igt@kms_chamelium_hpd@vga-hpd-after-suspend
> +igt@kms_chamelium_edid@dp-edid-change-during-suspend
> +igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
>   #Place hibernate tests at end
>   igt@kms_chamelium_edid@dp-edid-change-during-hibernate
>   igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index cf0023c63..466530e08 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -2,11 +2,11 @@
>   
>   intelci_files = [
>     'README',
> -  'chamelium-only.testlist',
>     'fast-feedback.testlist',
>     'fast-feedback-chamelium-only.testlist',
>     'i915.blocklist.txt',
>     'i915.blocklist-pre-merge.txt',
> +  'i915.chamelium-only.testlist',
>     'i915.fast-feedback.testlist',
>     'i915.fast-feedback-chamelium-only.testlist',
>     'meta.testlist',
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index 61a70a9bb..e907b4b84 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -15,7 +15,7 @@
>                       "include": [
>                           { "i915 BAT": "../intel-ci/i915.fast-feedback.testlist" },
>                           { "i915 BAT chamelium": "../intel-ci/i915.fast-feedback-chamelium-only.testlist" },
> -                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
> +                        { "i915 chamelium": "../intel-ci/i915.chamelium-only.testlist" },
>   
>                           { "Xe BAT": "../intel-ci/xe.fast-feedback.testlist" },
>                           { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" }
