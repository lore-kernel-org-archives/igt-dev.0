Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C009D116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 13:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BAB10E3D8;
	Mon,  1 Dec 2025 13:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RFOZcnU8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A2F10E3DB
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 13:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764595472; x=1796131472;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7H706OQiQRqViKVXtRIIsYkQyDiASbY+TqrJsVIEag4=;
 b=RFOZcnU8dBCq95wkBVXaX7tF2hqUZC3AeXLzlxzbHn2gHCdPVeen+Pdc
 B74/NGcWFN/mUNb2jZT7x1XExVpRVEr9bnyNxw+Frt6r98cFXU/fk9ti1
 +2Moy2pDw8LJmIDjY5RVb2GptYl7eoQ33krkOzmGcaWYpI/4bIzMLouee
 Tj5WLn0dnWF8PzYRA8qbUrbuBKFqjRrGxcCkUNl5hd1mEwdF6ONzkzjKu
 UFusw9oNDvleFPlJkdRbB/MEjvKiiAxztY/aa6Vbf1xeFgMF/K5g/eIIV
 lk+ZNVoyjeYeC+Rx8a5seCIGHobZoOijpZdAwoy0Q/UmfCt39fWAor8GM g==;
X-CSE-ConnectionGUID: tgIEoU6STsiQq6JcJXUfZw==
X-CSE-MsgGUID: PcvLmqOUTRuHiFM9SaRp9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="84136438"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="84136438"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:24:31 -0800
X-CSE-ConnectionGUID: nx8kcdehT6qSCLESstmbgQ==
X-CSE-MsgGUID: 7qsLF+dHSUezT5soRQe75Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="199191708"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:24:32 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:24:30 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 05:24:30 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.62)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:24:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUR205Hp++KJL4vrtozWfxh6vmZBABRk5FyzXUQ8wX9LgBR/3pQncSEBuMx3arTiSJ2w6MSP7/CGaX+85JSI9AYt0CAdiyrsm73Q8g0Uk7chGbhlGJzcwSG5pdsRe+ogzcA9mnKUmhqpJ4HPoNIgFv6r9jAo11f5UM1ozaHwff/v2r//J68bGFrNNbVPzSs1MAk4gIYVuX99MqmwGuIPDHXonfnSe/KMzyopCfsFex/wj8qGwfB0vsQcZw1/Bym6vS/gbC51KhO17Dp3NXagNAWy7ZQ9hQt+tYqFUq8asO0+9vKVQ1LNM+HLgFS3RSO7SeLrS9brfDQxzJC4Vy3QiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmalD723rRmtQKDbRhXxB14POqh6jO4hmkG7ixGigJg=;
 b=Vy95MsArh2JCY9PoaXwYj7cGkU68+sknXWQscJ5TDJHHD3okfVP7oyTy3oAt38g1XaF2kbskaB+WNZcd4pFDcWQiURpYrGcn4z7FvNMGQYvREfOzYuq//kFDTUSvC4p7bcmzVO4KkxbAcnWHtoPY/SmjE97Vis0Sqy+/j39X10lR913I5KR6xuC+LClWYJSKBTlo0lxvKodjVasCUufVkNLnFBaKxNzU0cN09kdGoSuooqY6w6yM5cXuLHkogbQQJXAzNA+oXWgop7E/YjQhJXdOj1W7VNLpavX7Y+SAHTBHIoz1kFWYVvEStw23c5nR93EhrCf3zBn2w0V4yevgew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by SA1PR11MB5802.namprd11.prod.outlook.com
 (2603:10b6:806:235::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:24:28 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6%3]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:24:28 +0000
Message-ID: <42b1e6a9-d8f6-49c1-8e19-f741d3b45c9b@intel.com>
Date: Mon, 1 Dec 2025 14:24:23 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=C3=A2_Xe=2ECI=2EFull=3A_failure_for_tests/intel/xe?=
 =?UTF-8?Q?=5Feudebug=5Fonline=3A_add_pagefault-one-of-many_test?=
To: <igt-dev@lists.freedesktop.org>, Patchwork
 <patchwork@emeril.freedesktop.org>
References: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
 <176434550241.38795.652194516064002930@a3b018990fe9>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <176434550241.38795.652194516064002930@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR03CA0068.eurprd03.prod.outlook.com
 (2603:10a6:803:50::39) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|SA1PR11MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e7034e-385e-4e67-ff93-08de30dcf421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkFjU1pmR2ZBaUk2RXFqTDI0UjZRV2RXZTY5TWZqKzNrRjdzRFRIcVFvWnBH?=
 =?utf-8?B?eE5yWEVlTDM4N2JMQkRtejJkU05xcktxbFlJa243RFdJRVFCMks1OHlEWENK?=
 =?utf-8?B?Tk5XSVhjV1NkdG1zSzdtR252ZlVVRjVkd1N0YjFjK2x2bVYrdURlVzJwQ0RK?=
 =?utf-8?B?QVNRZFp0dzJBMjBBai90OGV1cVFYY1lCWWdMeFlXR2ducStEeHFLanNTRzZT?=
 =?utf-8?B?aW94a3dLTjJUb3l2MUNpMWtRY3ZjdGNMYmgrb3NmL1duWlR6WHBVSG9EZDVB?=
 =?utf-8?B?TktmM0h6VTRzN2NGc3hLc0NWdktYNkJuVXZwYmZxdW9FNEpsUStNRkJpQ3p4?=
 =?utf-8?B?amVCL2pIZzVnbFJpNVFuOHp4R3BFOGN1bHZ5dHZEazNYakkwa1JPYXBURk1x?=
 =?utf-8?B?UzhzVEVIY0ZEOUtvcFh5OTdMYys4bHpkcjRVb09Sc0hySmJwZFlvS1I1aHZG?=
 =?utf-8?B?bWJQNllmTk5YeWRTc25jMzYxbUFSZTNrb2hyUWo3L050ekJ5TU9kS0V0QWFF?=
 =?utf-8?B?bkRtZzBBcThvRGJMOTl4TDBsVDZlR29tVXpKLzFNeUFjblhNOERvYitsTnA4?=
 =?utf-8?B?eGpCbnBnSmdNTzFrVlliYTJ5VkFmWStSZHBIZVRXM29vMll1UnROMUJuM2tw?=
 =?utf-8?B?eHZzTmpzTlBKY3oyNkc1Y2V5Q1Q1RFlvTEhyTXZCTXRQNGV1WFlWZVhPR3Va?=
 =?utf-8?B?YTdjS1NNdjR4L01rQVhNUzR3N1lGQkgxeTBheElTcUIzVWhlWlM2T2dpWURD?=
 =?utf-8?B?T0Y0MVlxUXNXSmNBRlVrbDdNNFNyb1hLempwZWtUMjZSVHZndXBJWlN0aUZi?=
 =?utf-8?B?Uk9DVndGYzYreUdEOGVjSUV1enA1SVB2cmtJenBUTjBRN3UyenRaWHZDRE50?=
 =?utf-8?B?NW9NdHZmZ0JVN2YvR1ZFcUtjL3I1dnJnUkxjZHN6a2RoekpZNCswU1kyT3Vx?=
 =?utf-8?B?YlFLbkhsV0E4aTZiUzdwU0ZldHNwMktMVGlLTXVCWUpJL0g0VnRhaEFlNVQz?=
 =?utf-8?B?TUpzNXBQTW0zS01TMjZhMzZORVhRbm81c0ZvczEyQWZJZUFUTDkvV0dhenBX?=
 =?utf-8?B?eW12L3FkYnVLUWlKR083UUl5K0xIekN0Q2hXQU9VcDJMUFFBbWxTNC9lZHVr?=
 =?utf-8?B?VWNOQlZGd3pTOVM0MkRNeWtUSkczenFGT1ptSEt2eGhuZnJ0OTdCUkRUYno3?=
 =?utf-8?B?bEJ5NCs4S2NMN2ZwazZiSHh5QjBuOFN3Y1lTYVl1bDA2QUthcUI5YkxFRk9S?=
 =?utf-8?B?WmE5eVg3ekJ6MnhjSzBsak5kOHdFaW4zQlRkLytFdWtVWHBJclVJQTZZSDVa?=
 =?utf-8?B?UGMzdlJKYURCREo0OWpLT2dJMG01RUFkSXJGN3Vsazh6MEZuYkIvZnhuVHYr?=
 =?utf-8?B?M0I3OER0TkZPTmFBbmxtUXdMZDhoY0d6Qm9GUVJsNjJFWTdDcXhxVHRZRHpR?=
 =?utf-8?B?S1p5V1BlMVEvR2lFemtlYnJHU2RERFMydEdZMW9GdTZxNlI1OVRuN0JXNHg3?=
 =?utf-8?B?NFNVV09idUczZGR6SHZUV0x1eXhRN3RGaFpXaC9TbUI0SDNOTEJxUG10QXd5?=
 =?utf-8?B?TnBjTDIzcUVlZkVRWTQwNUV0WTRpdjhmS1FsL1BNamVwWEl1dEtBNHBpM0pN?=
 =?utf-8?B?dVlKY1FvS05HMjVQZFQwQmZ2TEZzZjdwck11ZjlyeXZ3TDBheE1PYXZHOUlo?=
 =?utf-8?B?YW1ZN3M5dHZvbG8rVUR3Yy9rdTdOS1llcXpSWjlTUnhTZmM5NGx6SWNRbzhz?=
 =?utf-8?B?T3BydzZUKzg1d3dVYWF0OEF1d0JZQmo5ZGJ6OSt2ZFVuRWNuaUxYNGI2Tnlm?=
 =?utf-8?B?b1RMbzB5Ukhkem9VWkJXNFh5elB0RFpWNVo3Sk1YYVQxNG4vRnhUMUdRKy81?=
 =?utf-8?B?by9aUXc0bVMyNUMvRFF3VEluZGFrekE1WkpQOW1mZUdqMHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVp3RzhpeW1EMDNYQ3RmNjF2L001S2lPNWtwaDQzNUhHVzNhcG9CSVNXQ0l0?=
 =?utf-8?B?eXF3TTVLd01CYXg0bFJNM1Q5ektiLys5VTNYeWpwdWtjbjFJTTVJRG8xQlBr?=
 =?utf-8?B?UzdKZWFMV0I3cXJGb2FOby95WS9HbEFicU4rRGpYUVl4TmJab1hzWVZkUEha?=
 =?utf-8?B?YkZGNnd6dFJRZSsvckIzTTZXUHFIUmRtVDVaMlpyVThUTTF2ZUw4NWRaL0hX?=
 =?utf-8?B?MTB1V2tleHcvLzNtU2p5amNBbk52SEJ3QUFBY2Z4SmtlWnRFbEVOZnhpWDNY?=
 =?utf-8?B?ZVhGRFhqdmdYUDBGcmJmR0E0SWdOOXNnQnZXZDhVTHhYNTJzQXVLb1J5UUUy?=
 =?utf-8?B?UldoZ3AxdUJTZFMrVWEzM25pQ0k5bWkzWnJtMW1xSTBuZjBKVWlBK0xoY28v?=
 =?utf-8?B?eE5EeDNQY3ZwcVh2dlpOTDFvYXIrYWlMOEpLWWNGUGIwcjBKSUplQzRMUURs?=
 =?utf-8?B?ZTVDT2w2a256UmdLVzdyclEwRVM4cjRxWU9BaHlxRGtJeWVJcTR5VExXTTJV?=
 =?utf-8?B?QmxrbmYwUXdITmRuTUlDU1hRRTRKcnlPN0ROQXh5cmhDaDEwVnRqQXl1d3Fp?=
 =?utf-8?B?UmxIdmd3N1kwSzNzcFYreE1SUHBRTXFqemk0d2RYZVlreHU5RVhrakFkZzlG?=
 =?utf-8?B?TThHSVpZczJ6VDZ5cXpXNW9DaG1jVlpKdnVodjF5Y2lYNHNoczZGc01oV0tW?=
 =?utf-8?B?aU8wY093UWVab2R5Y0hnOGI5d1hJcHVFRDNiNHkvbC94bnFUbkhxU2Q5bXM4?=
 =?utf-8?B?QU1FdGtncXNmK1M0VzdWT3loS0duYWNQcGU4MmdtYTYreXgrWmI0QkdGelJm?=
 =?utf-8?B?NHAzMmw2N1Aybzd5Vkkrd3hnK2taemJXeU9sN0FsUmlIRHI4SUlscktVc1BQ?=
 =?utf-8?B?OUtobjIxSTRyZFVlVnVwUlFSVjh4NnJyc2o3Sk9adGFkR3gxY1JTK1Z6RXZ1?=
 =?utf-8?B?UU1CcElVVFlocTl6UktFWW9YSjBtWVB1Q1NDTVU0ZGozNzI1RjZZYlBGeTNt?=
 =?utf-8?B?Rm5VNjIxOXJVYisvWkZlOW1rNldVTnJzd3BvcFFWWGxGVjNIaC9OUmhBaTlQ?=
 =?utf-8?B?R3V4RDZWMVJuVWZ2K1ZpVmtpVEhjYUl5eGZlM016MWFTMDlxZkRyeFBRaDVI?=
 =?utf-8?B?T0dQNmlOTlg2bnhla2VBRk9sUWswZkZmVTcrMDdMM3B6Mit1WGJPbFVUaEZY?=
 =?utf-8?B?bzV3ZHNoYk4xVXFabk1lWUVwYVhJY0cwQkRQNkpSK05Bazh0cG15SEVWd3Fk?=
 =?utf-8?B?bXNMa002dkRERi9mdXdkNU1zMnFjRGZSUHRKUlVrSUFnNmhwUTk4YnhWY1No?=
 =?utf-8?B?bm01OXlFRS9uSmFBV0tlUWx0WkpWTG1XL3NKWkw1Y3FCRzRhQVFuTi9hY2xI?=
 =?utf-8?B?T29MZzZmSlhlNDVUbVhOUzZXSGRGK1lneXJCc0Y4enVpSkVHQ240ZFpQczdQ?=
 =?utf-8?B?LzZoZ0F1Q2VyUHQrbjl3MVBlWmkyclRBeU9TTGZhdGVzRlNUNWVxL1o5NzNZ?=
 =?utf-8?B?QzJWYXJiYll1bnVyZFRTZmtwc1dhT1pKTUgwZ1JLa1RZTlFwMjRjTktEbWIz?=
 =?utf-8?B?TmFrZzM3eFpCeDhSc3pHbFFXbDRaT2h2enN0VkJHd2wxTXdDVFU1NG52a0tT?=
 =?utf-8?B?WWhKay9pZ0JCZEtQMnAvSGQvb3JWV01DS3g4WE9PeEU1MVdOSXAwU3hBajBG?=
 =?utf-8?B?R3hVZmpJeDBEYjU4MmdsUU9Nbjh0aEp4bmVXaW84ZlQ1SGRqakFGT05VWGZy?=
 =?utf-8?B?eFcvUHJ3MXVCbkRFdXdiZ1NhcFJ6VEJZMkp1QXNsUEU2VXJoemJ0Wk1pRUtm?=
 =?utf-8?B?WmZERXdzS0NpUEZpVy91b3ZLWEtTSlBoS2crZnZLNnBVRXpwblpjbzBTeEU4?=
 =?utf-8?B?MklpVStHMjNoUm1kZThqaUJ1T3IzTGZGaUtxTERJOWs1Yk9tODZ0b243MWxK?=
 =?utf-8?B?NGg2T2x4bXdCSzE0QVMxVjREcVhYTTBnQ08xRVZXajF5akw1Q2M0eUUyRGd4?=
 =?utf-8?B?ZTMrTUhDNE1UajZQM29wZHVUMDRuUTc4bDVDeFlRMkFXSG5QekxWdnBkYnY1?=
 =?utf-8?B?NUlyOXY2OUtEV09vbFduSCtiTVpWZlQ5dEVpMi9MY2Y5Z1lWSTM0WFJCTm5p?=
 =?utf-8?Q?KWReF+YmrCLLfVxixJe/JUll0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e7034e-385e-4e67-ff93-08de30dcf421
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 13:24:28.3062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJ3n8RpuMrYJpLK2bizHnzvagaoylKdGqb0Kwnef+WibO1HTVGh7Gdmlz35TVll6Z6WVBiZ+ODbHqCIPa4Al+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5802
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

W dniu 28.11.2025 o 16:58, Patchwork pisze:
> *Patch Details*
> *Series:*	tests/intel/xe_eudebug_online: add pagefault-one-of-many test
> *URL:*	https://patchwork.freedesktop.org/series/158209/ <https:// 
> patchwork.freedesktop.org/series/158209/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14132/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14132/ 
> index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_8645_FULL -> XEIGTPW_14132_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_14132_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_14132_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 3)
> 
> Missing (1): shard-adlp
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_14132_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14132/shard-bmg-7/igt@kms_colorop@plane-xr24-
>         xr24-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf.html> +5 other
>         tests skip
>   *
> 
>     igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14132/shard-bmg-1/igt@kms_hdr@bpc-switch-
>         suspend@pipe-a-hdmi-a-3.html>
>   *
> 
>     {igt@xe_eudebug_online@pagefault-one-of-many} (NEW):
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14132/shard-dg2-466/
>         igt@xe_eudebug_online@pagefault-one-of-many.html> +5 other tests
>         skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14132/shard-lnl-7/
>         igt@xe_eudebug_online@pagefault-one-of-many.html> +5 other tests
>         skip
> 
> 

kms failures are unrelated.

pagefault-one-of-many SKIP is expected - as eudebug feature is not yet 
merged with mainline kernel.

Regards
Andrzej

...
> 
>     Build changes
> 
>   * IGT: IGT_8645 -> IGTPW_14132
> 
> IGTPW_14132: 14132
> IGT_8645: 8645
> xe-4166-e1c1b3e03e356d1e20432dcb0d38ad44d5e92670: 
> e1c1b3e03e356d1e20432dcb0d38ad44d5e92670
> 

