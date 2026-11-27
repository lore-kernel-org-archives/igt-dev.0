Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C5C606A32C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 04:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M/4Dc4Hk;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=UTBvtqVO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F92410E1D9;
	Fri, 27 Nov 2026 04:54:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4027B10E289
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 04:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795755193; x=1827291193;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QmRSSFGW/M4BmvHP+AGl/AE1CMgWbE3/VnXosf1Nohk=;
 b=M/4Dc4HkRSV1AEhzYgIEdCnXOcxp/1Rp90QRvyEXDIUSlnaEgyMRniOJ
 Br//IdSCOJJmAvBXQbS7y5FbTnPJ3lihPuaL/3rpawZHUurqg2InUfGVA
 6x4iRy3A7N+u9M4MQbGAKjyGLzk/NBrl8OnpOreBjPCBHsOl6dCV+gosN
 Kk5d6zLXy8AL23hwT0wn1x+xe19TX0+hpQqHdJXAXFUqMQ5zPdRECM9Og
 FYqk7kJGRX2EFncaJO+TLl5YO1VM04AIp9kYPRw0WQ8Y9khUg4O2JzPAz
 3ker5AMEY0Ohw6XxFjjUI8ZHYRWyY/SXhD2sCl8hbihA7PyVA+6dnfXC3 w==;
X-CSE-ConnectionGUID: pJY4sZrUQNyHqKkwszN3Vg==
X-CSE-MsgGUID: cRcigx4qSTGYzcusQDP/Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4751032"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4751032"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 20:53:13 -0800
X-CSE-ConnectionGUID: hoOcpuuES8OkGpThv8xGHw==
X-CSE-MsgGUID: 4R2kFbtxQMmIIGHLrFVm+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12342223"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 20:53:13 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 20:53:12 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 20:53:12 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 20:53:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6Wlv2Jve70olEZGf5w8Z6NrrOMQ81HjE8x888/pT7vzZ+w3Ot+4NHnHt5Ru8FeS5m2g6qMhRptGCsXmYCk9qBvuWGkVcGi3jISgBiPg4y1pvSTPfwh9Of98EYaRb4Rs6Iyh/TVWM44+RQVX9eRLDASfZipmEyU14On7NL7RTbReTI4BKjWZ8qs5fpyiv0cbSbaLwcWJBKF9SRIWD/q2CNDgO68FYznFAbAJcaasqMBQ3M6+th2m51zLAf3YJYdKqV6weaDqo3jjSLmxBTyM2PEHwNn54rC/De1OhHlYBX6L7LnwO3BzrDMYyEcxxWYfXJuGOZNu3XVIHVmNerQ7DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3maNxHCo8t6enA0BlMMTFxy1rHdTW1wSvY/EPa9LxaI=;
 b=oj63dzPXoyo7oD89We5W1BKeWp1Xo+HMXc1W0j1CvNPVes1lCEyVErFGjsjSZS3StOyu9E6klDCipt8MXGiYaPR7TAxfOI8g58UX7VMnSklHpVDmsWHi8kAPcuKuundXdVlEpF9EklRblQJE9DNfLT2JP5XM/lG0ZzOLGpgAOuG/1gh8F1cL8rRQQsTPuUl652K/tOQYvaISvrDHP6ZBT8XJyGkV6674k9GC6g7MR1nSDTesDED6cFnFLcmSAWZ3TCKPp84APEy0j9MhUexUbL6VYRgSwcIYh1KPhqMEU8rwhv4+26nnR5Lm65615wYOatNigFAzE5c0u2gguuJ5ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3maNxHCo8t6enA0BlMMTFxy1rHdTW1wSvY/EPa9LxaI=;
 b=UTBvtqVOUrAkZjoCGb/m2J1Dj591ZihxIw5vCllpHD+X07T9xxFBWZMmZYt1wCy4inTdlNLmmlEdF1TC7SzOyWgcBtIa1NXkuxi7+8lWmTrCMx8GGscuSYox99+apNaDwUuY20qsP7ZBXpUSy2GMptJtF0Uqwrw9WRT5wnqZzjw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB569431.namprd11.prod.outlook.com
 (2603:10b6:806:53f::5) by CH3PR11MB7275.namprd11.prod.outlook.com
 (2603:10b6:610:14c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 04:53:09 +0000
Received: from SA3PR11MB569431.namprd11.prod.outlook.com
 ([fe80::36f0:fe31:ac43:ae77]) by SA3PR11MB569431.namprd11.prod.outlook.com
 ([fe80::36f0:fe31:ac43:ae77%2]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 04:53:08 +0000
Message-ID: <ea9c42ff-0bde-4258-8095-9f32760ce33f@intel.com>
Date: Fri, 27 Nov 2026 10:23:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/intel_compute: Enable TG preemption for
 Xe3p_XPC 35.11
To: Himanshu Girotra <himanshu.girotra@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <ramadevi.gandi@intel.com>, <zbigniew.kempczynski@intel.com>
References: <20261127044504.4119774-1-himanshu.girotra@intel.com>
 <20261127044504.4119774-2-himanshu.girotra@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20261127044504.4119774-2-himanshu.girotra@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0238.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::19) To SA3PR11MB569431.namprd11.prod.outlook.com
 (2603:10b6:806:53f::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB569431:EE_|CH3PR11MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 9067c986-7052-42b3-1f76-08df4c4254be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|4143699003|22082099003|18002099003|11063799006|10067099003|56012099006|261102123227099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 6ZJywL8Szv7zPzQW1VJAeu+32oMnCvU93Ge8mcY8fAMypxf72uoU7YfsFm3DxBARhXU5ND+CjbNlhr1Fy2J/ESfWx+AbPZFokORmdAnP3sforz8BzzgvpkUa4IGbgDG12wiVi0IXZ9qW2BXFlTU4xy2aIOdoxTrzWppLMPv8FG3ji7AsZVFsNLjXA5z93JpWwZNHG7YHb7r29/1Wm8vXrykvFAft4gl+SeRIoS8lWT73nHpd2j9STcgj7oUEiN4MXxtAjmpeJ2dCsRCsXbhFjvk6wUINAxnR+Oe+3FMQALq4kU7pWFSMQ5H+zOdstzPi4pzdDExJTGgYnOsZ5PiSaJr60hOSjWZrJU7cdUHYf0erVXkP4x3adiwiIa+fhy+3AwEnu1SANp5nahY6o5qo3wtTA0XwcTnQKz3QYzWY6yg9p2r2xDHY0iE2egpMIYzO2PHxcIlbGHiKFXWeZhgHbQ03hTdLj04TFPj7nZNFYnsIKwEQ0bFxEoy/Ks5efqja9gIWLLjYK4tjYVzRCjHp0L3w18yqAb0JKI+ck/jmhHhVbUA63czaTo6PC2U0peeuwAVADIo+T5DkfXqVM0gyl8sEqlAXDahLkRdNV2ZP7210FkJ8nrBPoBrDRJh4l1usoU2M46yjdTcgdSkyxbN7EuksJ9jqs55dYgFFNWQ2r24=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB569431.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(4143699003)(22082099003)(18002099003)(11063799006)(10067099003)(56012099006)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmNPNHFqYUEvR3RUQm1NWGRqY3RMUy9jc3dqY2ZldVhORzRtYnl4ZXlLQnZO?=
 =?utf-8?B?dnh0SEpqUFl1WFlKWWFGRTVoWjduYWtJNXM4SjVBekZhYnp0T3gyL24wSDk0?=
 =?utf-8?B?Zm9RdXozT1ZPZi91OXdCdmpGVTMybWt4MStIb0dPV2dMNjdPdXE5VVIrcVB6?=
 =?utf-8?B?Qk1IQmhDSlZZZkJudHVZdVRpNkgyTXZHWm42Nk5weDRvV1VSUWxvbURGWUxN?=
 =?utf-8?B?RmRiR0lGM0Y4c3VXem1ZeDYzbEtpazZjY0hpWGcwSXY0azNrOURwTHFoMGdN?=
 =?utf-8?B?RVg3Nk9KMElVUUlwNzFxOHNrTnJZVG1qOHR4aEtQb3VZWFJjdjdJSTlOZDZv?=
 =?utf-8?B?dXZmUXUxWkhMMkNSbGZRV3YxaU90Wnl0T2o2S00rZFdSUElLWFJzUjcrZERr?=
 =?utf-8?B?Tzl4clBxWEFDOHlvdXBQZW5CbWU0eCs0US9LaytkdEdtNHNNbVZET2JCZi82?=
 =?utf-8?B?dTdBOTF3dDNiY2NZZ1hpZEYwTGRHNEVZcTloTUdVcXN5WEZvWWlObGFpYlM5?=
 =?utf-8?B?MW9CNDEybHM4TjR6c3E1TGYyMFIrbFlhY01ONDVXdXpodm5yNWc5NFpkc2NB?=
 =?utf-8?B?KzA4RUxhZUhmODBzc28xdVdMeE9IbjczZCtmSkgzSlNkRkhmY1p4bWx2YWFR?=
 =?utf-8?B?ZlZPdnd4ajZIdUJNV3ZvcER5OHRUNVRia2FSSGxVUEI2eWNpai9CY0FtSDhZ?=
 =?utf-8?B?VDRaYVU0bFBGT1pGeEkrRTJQcTBqdmt3RE85b1BKSzZIU0JpMWNRcW52cFB3?=
 =?utf-8?B?c3Awd3JCRkYzOTRpMmZjUjYreER2eUZKeEFjeEE4QVRPVzd2RVNjUGlWV2h5?=
 =?utf-8?B?UlFGL3pqREhSQmdVbi8yR1VjYzRIRXdzcGFHVTYzMG9qT2o3QmZ0WWU4aXdh?=
 =?utf-8?B?bTdweDM4akpNZ243bVJrRzBlNjJNMittZWdEOEVVc2I3WG1SN2ZuYVY3VUVT?=
 =?utf-8?B?cWtvenJ5U3pUamhmT2xmV3JJMzlFS2RlOXplSmxqSFhsVGJNYmNNaGtIYUJR?=
 =?utf-8?B?UGRvVTFPWTkyc25yYW5iS1pMS1FJc0JUTnNkNUtiMUpNTUN6NjZCeEg0eSti?=
 =?utf-8?B?dm9KcS9Fd0VkaW9VSGJ6SlFZejlja05CRzhyaXBqWG9lOVNzd1NKT3BTTmF0?=
 =?utf-8?B?YWQxbVlubFEzc3FlREhPaDBQUGlsZkZqT091dWFSelFxK1VkYm5JckFYdUVU?=
 =?utf-8?B?U0krOWJoUzJRelJrVVhEbzlUUTB3VGtjTjhTcVpXclhtU2x6a2VPZnMyMlQy?=
 =?utf-8?B?SUVZQ3puOUpJWXJ2NUFwQXIxQ0poNVdHKzFKY1FaVXFNR0IxT1R2M3l0MWh3?=
 =?utf-8?B?Q2FuQlRheDk0RlNnWGlZWml6cE1TbjJBVDI3WHE4S0hZQUUrZ1BRM0FIRjBt?=
 =?utf-8?B?OG9uWWt6ODdCUEpTWThsL3poaUs1aUFGUDhkQ0N6c0M2YjJsM3o2RXY5bGRm?=
 =?utf-8?B?aWxjMVdpanRWai9CT3k0N09GVmJyRTQ5RllRRFhJUzFtV3dtWmlheEpiWElF?=
 =?utf-8?B?ZWx2ZkxmQStRM1hKZVZuRnB2S3NLaWpVcEtvV2liWGpFakdMNDZpY0N6WGpE?=
 =?utf-8?B?NEV0cmZEa3R3UzdqOFFYbnRiTllKamx0SlliSDIwb2NBbHB3eVRrcU83T1h2?=
 =?utf-8?B?eW1zN0x5UWJIeDhZNmFid3pJUlQxTW9XWGdFd2dockFMTHczNVArNitIWVd6?=
 =?utf-8?B?MlBtOTlCNWxaRnlPeVN4ckhtNTU5a3NkbkprM3pmd0NpRlhJdVYrbmZxZlAr?=
 =?utf-8?B?SzRjQnlsWXFSamRCS0s0M0t4MUNoblFiclVpc0poejRvY2kyTHJZcWNmRUR5?=
 =?utf-8?B?YzdCZEdWdXcwNDRkajZwckZ1cmU2Qm9jekZGQUZUc2NvNjRaSmpFaktZUmtD?=
 =?utf-8?B?bmFCNExLLzNSUThPSmdBSDNtUU5Sb05XWU9vRm5sSkFMUWlHZDhNMFp1RHZw?=
 =?utf-8?B?QStsWE1wNDVqcjh1ZVpuTU00SUhBSXNTZENoRXltNVU4V09BbHpWenJ1RE84?=
 =?utf-8?B?cGJ6VkNpS0tZYWRHMWdnRXlxMkxCSHBjczVPWVVVcnhwNlU3YTJWVFR0ZE5Z?=
 =?utf-8?B?c1c4a2ZvSFhWbXhMeGxIcGRrdjdrRmR3NWNXY1RvUnNZK1NtbUMwM3NDTkR5?=
 =?utf-8?B?ZVQrdjdJT0VMYmhCQ05STjZmQ3pkeFZXK1FTb2dSZjFxZmxBWGxYRDBha0FE?=
 =?utf-8?B?MlBhaUNkTnQrRzhPT0hZSnl0VlY4RXBHQ3FLeXlDWi9hRjJYU29jOXkzOGNx?=
 =?utf-8?B?cDRyZ3BleXVUd0dIaERvT2ZxZnQzQ2JLMlZzM2dvd3gwQzJ4S0lQb2VnaEpS?=
 =?utf-8?B?MEk5M21CLytjVUErQXhqbGc0cVNUZ1lLbWNuZ00xZWtUbnFxdzZKQT09?=
X-Exchange-RoutingPolicyChecked: jIumtW+Xrp6H53au59mkV6djH71zA9Nf3gDn66h2BLEW6WlxLmlGSHHt+5UUoCmdFMUb+5d416d7KFnInZggxlS0GYybXbHDyQp8/YX3jUWsaoBmyHrTB3fYAeEXHHwhmGnbK12C0jeo4UTcjcSb/xDl8AjsQ5uCl8y0K7mEwLDwleeIPI3IFRQf23RQ3xyoUY2pOyZ09Zn+nDf8/Lip849qpf0JWIv4w8oI1SHW+0vA1Clo861r6B1B6Cj5IN4Jbm7q2ieW9FuyvlNl5MyiWDzldVYl/4NLZTspzkE3b6Tl7mVE36RKCnuO/zDY6iHTXj6IkX/7TyGEJQqBvLgYOA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9067c986-7052-42b3-1f76-08df4c4254be
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB569431.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 04:53:08.3932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBBJmJsgXIKlmmyRYEoDmUrN6uzIg4vKullQ+a2Z0pkd0Z++F6VlQryxuyxIUY+YPrc4mE1I4RFIm1mrWetmgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7275
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/27/2026 10:15 AM, Himanshu Girotra wrote:
> Graphics version 35.11 (CrescentIsland) advertises only WMTP in the
> compute preempt table. Thread group preemption is supported on this IP,
> which uses the same xe3p preemption path (COMPUTE_WALKER2) as 35.10, so
> enable PREEMPT_TGP as well.
>
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>   lib/intel_compute.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index ecf4e3bf0..12362742c 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -2881,7 +2881,7 @@ static const struct {
>   		.ip_ver = IP_VER(35, 11),
>   		.compute_exec = xe3p_compute_preempt_exec,
>   		.compat = COMPAT_DRIVER_XE,
> -		.preempt_type = PREEMPT_WMTP,
> +		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
>   	},
>   };
>   

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

