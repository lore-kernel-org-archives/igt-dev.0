Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FBFC4828D
	for <igt-dev@archiver.kernel.org>; Mon,  5 Feb 2024 05:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74FD1123A7;
	Mon,  5 Feb 2024 05:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUGXY+zw";
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Mon, 05 Feb 2024 05:52:42 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2091123A7
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2024 05:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707112362; x=1738648362;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=B7StiDwiYRE1PBzZhNi7FNfHO/Q5izhB1c/i/sTNN2g=;
 b=XUGXY+zwxJa/V1Z0vBcrGB6LhwgBvInIShlGlF0oDrqZcHN74FKYluA2
 qnDQFmuuwqf755glYje6lId4cpGj7ohCT6rdtk9sAgm767umgS+/7FsEg
 Lx/K2y9DoQdvVNGaOmp5OwI3MHWxKELiEEzggYzl0+XXe9GAblPSM4Cbc
 rgXl8sB8odenOI9iGuHaz90N+kw53wbNIeIBG3/6USBH+nb/OT1IQpL4o
 2G9f83WX1QZ26Fz4SlKXmJzUOadZrtVh7iLk6At1my0eCeHW15IXKew1a
 FRIStD5G3ZJRkkISOWJ2mrNk2FE/33WQpJ0vOWXg++sFBzqyHBG3Azl8c A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="360597"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; d="scan'208,217";a="360597"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2024 21:45:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; d="scan'208,217";a="31425478"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2024 21:45:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 4 Feb 2024 21:45:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 4 Feb 2024 21:45:34 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 4 Feb 2024 21:45:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AckFVQuQwpCQoqzQ3epYatcCudVeTMRWs9mbHW66bAAu+toSSBz+iscwL3pE+E5mpCTPs4EHwc5lLsH+0Qv1BOYOl7wBVLzXQDgUtlo0o6idIiMb+48afSnuCWBL61C5aMfT2WOIR9tsvrL8p3rOlVrRc/mzMQxAcpGh60haGr5HZaFN6svCmLYWy5GaNDa/vSP7LD+O1MS0o416MfClYCzuOqEULCh68lnGJwbmf+Nj2CihGWW2y2gFePfYkcu3qJh3cALhsLZ3yPnif5lMDnpiqGOJ7wq4NT/cA39XCeAx7VNvVgJ9TYyGKFEvB+cCEWNFxiAjbo69/TUn8fancA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+99sLzD982bdvzqSBaMNNVeC0Tl/k93b7P0fxKR8aI=;
 b=XlWC2LTV94DKhuBN9+TFAcaQC8T8Z2FCyIKYpwW+ik7yLtPLey+L3zXk/3BpQ+UROu08XM04tcw5bxPqW4TN3Mpj/VpYqphOSGmdTfYq/L7tgmw3+/Zl806ZUxNW/ofAqmoU+WW8nc/+azVGpGJTtOg7miq56xb4ekE2QKiyQqV/FeVz+KZlgLAVpmWbuDBa18CL398ssemftJAaJ2PciBhVo3eSVciKSRXXqFQ+Gygzd6EXo1cd/+hUCkW0pSwNk9gXB5cOSEJey0yPpVkXApQsIkRWzqBa1ewbyUhQgb8lDSfs3SgMOCbSjzhtd6FrqpWJKiMJglgVa9mg3OsQbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by PH7PR11MB6378.namprd11.prod.outlook.com (2603:10b6:510:1fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31; Mon, 5 Feb
 2024 05:45:31 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::57c7:cb8d:3964:5f91]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::57c7:cb8d:3964:5f91%7]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 05:45:30 +0000
Content-Type: multipart/alternative;
 boundary="------------JnRg0QwuWXuyi6Q4AE9lENRx"
Message-ID: <e9499aa6-34f0-4333-a5ba-27935cc3e42c@intel.com>
Date: Sun, 4 Feb 2024 21:45:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/3] tests/intel/xe_ccs: require flat CCS on xe2
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240201103017.321466-1-matthew.auld@intel.com>
 <20240201103017.321466-2-matthew.auld@intel.com>
 <20240201211441.b5yncl7w2pn6dwk4@zkempczy-mobl2>
 <b749b213-424d-4211-be41-e8fa25a00bf2@intel.com>
 <20240202073101.qdi3phnk23ma3j2r@zkempczy-mobl2>
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <20240202073101.qdi3phnk23ma3j2r@zkempczy-mobl2>
X-ClientProxiedBy: MW4P223CA0021.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::26) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|PH7PR11MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: a3da107f-c031-4695-fae9-08dc260da9ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KXxSBbY7ahv6K/xbqgmO/mpLXkUuEAnLVSG4GHIO3iFqEV47m84r65MgIpXEMXXxKZCuqCZovtpoirwAkQmiD3uVyDAMrX6eza49d4QsJ3upvUzFAtfy/cKIG8nFDl1yxZsmAha9VDcs705WWxYIpqAuboTcbkGgQvKChLXe80mooltT9xgdoqhsDoQ1Id2mClNhZsbQQ5zGaThhGwq94zjXE6U1/3lN9pI9mvHotfkvK+i9WCfz3OKUVkMZA1bTukDbV+Q7TpD/HpgYyPB0Has/knlmjN8ER8TKR9uOOgGHL8g9X6plhmHTjYRPcwC/1lRfiaAPm6zLacXjMYGrM5AJQvkPexicXfvxN4ZfgilrbYJAQ2JqXGsVv7nh4iM7n+/XPY/omnl7PRS1QSMSeoCG3pfpNdnut933O38EGLyujmXEpsd28fGbVUsLofhJqolF02dHqIOI9dIJvHJDUAjnFLmICwJzXw6o7PI+f6VHtnVBtvbBvO1WhAVGYvc3zGZf2ldfCNOZJlwzJUFiTwC0R6IAnQwxiTOMKCADXITOIsyvJSdgvyEEDdC7o0Cy6nRPSSvb2y7tx6SnII9a2yZZ4YgppvIYxbCjaiZKxVrVhg5y0dULmWKE/OFFUldgqnrSIaszUuCaToNl07p/yQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(376002)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6486002)(6506007)(33964004)(2616005)(6512007)(38100700002)(31696002)(41300700001)(86362001)(36756003)(26005)(82960400001)(83380400001)(478600001)(53546011)(8676002)(8936002)(31686004)(4326008)(6862004)(2906002)(66476007)(5660300002)(37006003)(6636002)(316002)(66556008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEFFV1lzU2RzVkhqcHBlS2hBRHVLZGNpUmhCbTJCMXRyLytmNk5ubGtEZWpW?=
 =?utf-8?B?M3JxV3pxQUxjNE1xTEVVNkU3emtaLzExbHgxVU8vTXE2aTJrV2FPLzhLZXRX?=
 =?utf-8?B?VmVIOC8vT1VrOXJ4Y0ZBUjZTbU9yKy9pUDVONFhGT2gzdW4yS055NFNKSEFJ?=
 =?utf-8?B?WEY5RCtSZHR0UGh5ZnhRMjlPT2MwaCtwYVRJSUJYdkw3Q0FxK1NDMVdEckk4?=
 =?utf-8?B?Q3FBTkx6SVNiYlY4aEJmc2l6dXp0WWUyNDJDSFVpeHhncDBkNGd4TXZMT2hz?=
 =?utf-8?B?YzNZWm9DdW1sRDd3NnVMdmJXS0RnalpzdFNwcVc0b2Nuby9yMklCN0VtT2Ja?=
 =?utf-8?B?REMyYmVlcnVxRmZ3Z0U4SmdhZmpHbVI0LzZWblIzMmhHbHBUSWljNEhPQTZY?=
 =?utf-8?B?TUt0WjRqeGFpSmJJUlk5RTVQZ0ZmV2pMZm11SHhsTDNkM1BKR3VFUVNTR0N4?=
 =?utf-8?B?S3E4YmRHSkIvR05CaUR2cjRrSHBSaC81OEVZakxLWUxOQ0ZHV3VkL3NBZU5Y?=
 =?utf-8?B?b1MybFVJODRXUkFKcitDb0dSaWsxUlI2UUxnZm9veldzYVZRaFFaRG91WlVT?=
 =?utf-8?B?SEFXUmJlU2JSLzBzLzlsOVZaTFBoZ0ZRam8vSXJDQWZVa1lEdmQrb0NoaC9H?=
 =?utf-8?B?ZzZuWVhkaUhVUHlpeXJqeEc3ZjVwQW82eWppODlIWVVNbllhdUxjS3IzK1ZU?=
 =?utf-8?B?UFptdnY5eWtldTB4THphdkhRbFgvVHovWnBGb1pZeVc4cWY1QVpZSkJxVGpt?=
 =?utf-8?B?b3IwRDlON0daWnJuNGVQbEVzZjhaT1lxak5Xc2MydEJWTlg3MXBKTFhYdXUw?=
 =?utf-8?B?RjlxQ21nSG9pcFA2QjFwTDVtODQ2V28zMjltK3p6TXBYUEFNYzBES3BFcDM3?=
 =?utf-8?B?MERwYnNKdVpabmljSkhxcU4zK1FuRUF5VkZUS2hhSXJFYXh4ZTVVaXlzY2Zj?=
 =?utf-8?B?MFFwV1NDUFRrdDlwelNEWEQzZzdCdytTU1F3MHhTSGovdzJzd3VkbzRqNEpt?=
 =?utf-8?B?M25EUk5YS3o5a2I2YUhaNnlaZ2M2WVBVckVQVFAyNzIvS0VqbzZBbko3L0l4?=
 =?utf-8?B?a296NnRsZWhVbkNoTUU2NnovLzIvZWRWdjZuY01TNHF1UWUzSGQ0YkMxTGFp?=
 =?utf-8?B?ZWJzeXZYL1RXTXlyd09NbmVzSXgxNkRYNDRMM0pXcVJRYmc2M09ta0t5V2R3?=
 =?utf-8?B?aFBvMWtiUC9UQWZFdm4yTUxBeTdoSGtLVEl2b09Ub2ptTmFaMlRLUEJBRXkv?=
 =?utf-8?B?VlNJTE9zd1FuUEV2dmo0K0JPa0dyVFF2UmpBRFJaVWhtZmZJVUhoT0NIWmZV?=
 =?utf-8?B?dkdHWjRIb3lnekMvYjFSSHRndUszVVk0MHRvLzV2aS96RUlQSmV4QXl5U05X?=
 =?utf-8?B?cGZML3B2MWNaamV0dFF1bVIrbkUwRW9JbmdicXhFS0xKcjVxMWZ0ZlhINEZ6?=
 =?utf-8?B?WGcwdVlnNjNUL1cxSWdzUWdIbUdiTGxPaDM3M0lQczBvWmtQNTBhamFrM0oz?=
 =?utf-8?B?NGgrWVR0VUNwcGs2eDZvakRjaHQ3UnBJUVBKMTFTeW5EMnBwTzNYdmp4c2U5?=
 =?utf-8?B?OGNLRGxSWU1uSzNYNXdRZXMxSTF5ejZEdVFkTVpiOHRMZGpoRk5NM3Q4WHYv?=
 =?utf-8?B?QXBQT09XeDVncXBRcWw2aUdpZHZUSlV5bXZZOEdmcVp5L2ZXVmh6b1kzUE1q?=
 =?utf-8?B?QlI5TWd1WHhUbVVuUWtpWHRDNzJlR1U5enluSEFXZEVqdFNtRGpmcnJLTXRW?=
 =?utf-8?B?RzJDN3poekc3N3FxVGdQS3IxaUIvSWRiNFRpNkZNM0FLVzhUNG9hOXhUOU5v?=
 =?utf-8?B?SGVWUEY0L1VWS0tMZlV5Uk5CTWdnQ3dFK1pCNUtQTXRMOFZZQzc0eEt3bFBR?=
 =?utf-8?B?SFk2dGZGMXpIZXNQK01wMnNuTlREb1B3RlkyV2JUeHhLU3F3aUE5TTFjVy94?=
 =?utf-8?B?OTB2K1pPRllrTWI4WTltMlhLRmp1a2k2cXNtSzBCZ2pVT2U5ZEdXVFhyd3dj?=
 =?utf-8?B?eHBhaEdNYXY4Vk9DRzN6a2lMKy83aHl3VzFSTkh3SnlRb3pjbjFORVRUNExH?=
 =?utf-8?B?RTVuQTc4NG1uR2hEVHZOa1oxQkdEaHJVR2J6OTNkdFZKUHRoTEtRUnYzVHhL?=
 =?utf-8?B?NFFLUzQ1QmFiUGRKV2psdlFIV3pscTFUZit0S2R6VVoyYTFBTVdXWjg5ZjRB?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3da107f-c031-4695-fae9-08dc260da9ef
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 05:45:30.8031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzSgZkM2WdXyCAQA2GVqPLr3Q/DkRNRoQGGa9NuACBrZT4hIQV5bY5N6IpqEP3KUiDS0p5a6QSf/+3Nf688jT84aEDik51/dwFlxrYn1ykI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6378
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

--------------JnRg0QwuWXuyi6Q4AE9lENRx
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 2/1/2024 11:31 PM, Zbigniew Kempczyński wrote:
> On Thu, Feb 01, 2024 at 09:34:27PM -0800, Jahagirdar, Akshata wrote:
>   
>>   +
>>           if (config->compression && !blt_block_copy_supports_compression(xe))
>>                   return;
>>
>>   This will check compression either, but indirectly via .cmds_info
>>   set to xe2_cmds_info in which we use BLT_CMD_SUPPORTS_COMPRESSION
>>   flag for block-copy command.
>>
>>     on a side note, IIUC the BLT_CMD_SUPPORTS_COMPRESSION flag doesn't make
>>     sense anymore due to xe2+ unified compression?
>
> Please fix your email client, it's hard to extract the answer.
>
> Regarding above - may you elaborate?
>
> --
> Zbigniew
Hi, sorry about that. not sure why it didn't quote properly before. Hope 
it is fixed now.

So, regarding my previous comment, The BLT_CMD_SUPPORTS_COMPRESSION flag 
checks if the "block-copy command" supports compression or not.

However, due to the unified compression in xe2+, we don't need to use 
specific blitter commands to use compression any more.

So, i wanted to say that this flag checking compression support doesn't 
make sense anymore for xe2, but I understand it would be different based 
on platform specific .cmds_info.

I didn't check it properly before.

So anyway: Reviewed-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

-Akshata
>>     - Akshata
>>
>>   Do we have any Xe2 without compression on block-copy?
>>
>>   --
>>   Zbigniew
>>
>>
>>   
>>   --
>>   2.43.0
--------------JnRg0QwuWXuyi6Q4AE9lENRx
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/1/2024 11:31 PM, Zbigniew
      Kempczyński wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240202073101.qdi3phnk23ma3j2r@zkempczy-mobl2">
      <pre class="moz-quote-pre" wrap="">On Thu, Feb 01, 2024 at 09:34:27PM -0800, Jahagirdar, Akshata wrote:
 
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
 +
         if (config-&gt;compression &amp;&amp; !blt_block_copy_supports_compression(xe))
                 return;

 This will check compression either, but indirectly via .cmds_info
 set to xe2_cmds_info in which we use BLT_CMD_SUPPORTS_COMPRESSION
 flag for block-copy command.

   on a side note, IIUC the BLT_CMD_SUPPORTS_COMPRESSION flag doesn't make
   sense anymore due to xe2+ unified compression?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

Please fix your email client, it's hard to extract the answer.

Regarding above - may you elaborate?

--
Zbigniew
</pre>
    </blockquote>
    Hi, sorry about that. not sure why it didn't quote properly before.
    Hope it is fixed now.<br>
    <p>So, regarding my previous comment, The
      BLT_CMD_SUPPORTS_COMPRESSION flag checks if the &quot;block-copy
      command&quot; supports compression or not.</p>
    <p>However, due to the unified compression in xe2+, we <span><span class="ui-provider ed bcp bcq bcr bcs bct bcu bcv bcw bcx bcy bcz bda bdb bdc bdd bde bdf bdg bdh bdi bdj bdk bdl bdm bdn bdo bdp bdq bdr bds bdt bdu bdv bdw" dir="ltr">don't need to use specific blitter commands to use
          compression any more.</span></span></p>
    <p><span><span class="ui-provider ed bcp bcq bcr bcs bct bcu bcv bcw bcx bcy bcz bda bdb bdc bdd bde bdf bdg bdh bdi bdj bdk bdl bdm bdn bdo bdp bdq bdr bds bdt bdu bdv bdw" dir="ltr">So, i wanted to say that this flag checking
          compression support doesn't make sense anymore for xe2, but I
          understand it would be different based on platform specific
          .cmds_info. <br>
        </span></span></p>
    <p><span><span class="ui-provider ed bcp bcq bcr bcs bct bcu bcv bcw bcx bcy bcz bda bdb bdc bdd bde bdf bdg bdh bdi bdj bdk bdl bdm bdn bdo bdp bdq bdr bds bdt bdu bdv bdw" dir="ltr">I didn't check it properly before.<br>
        </span></span></p>
    <p><span><span class="ui-provider ed bcp bcq bcr bcs bct bcu bcv bcw bcx bcy bcz bda bdb bdc bdd bde bdf bdg bdh bdi bdj bdk bdl bdm bdn bdo bdp bdq bdr bds bdt bdu bdv bdw" dir="ltr">So anyway: Reviewed-by: Akshata Jahagirdar
          <a class="moz-txt-link-rfc2396E" href="mailto:akshata.jahagirdar@intel.com">&lt;akshata.jahagirdar@intel.com&gt;</a><br>
        </span></span></p>
    <span><span class="ui-provider ed bcp bcq bcr bcs bct bcu bcv bcw bcx bcy bcz bda bdb bdc bdd bde bdf bdg bdh bdi bdj bdk bdl bdm bdn bdo bdp bdq bdr bds bdt bdu bdv bdw" dir="ltr">-Akshata</span></span>
    <blockquote type="cite" cite="mid:20240202073101.qdi3phnk23ma3j2r@zkempczy-mobl2">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
   - Akshata

 Do we have any Xe2 without compression on block-copy?

 --
 Zbigniew


 
 --
 2.43.0
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------JnRg0QwuWXuyi6Q4AE9lENRx--
