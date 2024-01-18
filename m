Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D503C47422
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 23:37:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AFD10E91C;
	Thu, 18 Jan 2024 23:37:50 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44A510E91C
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 23:37:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bztJQtLjASrq4ELsCwtiW7DzuSXiFXDOhFVnVsxbuUj50L8N/a14vJ4wAbXrz01pVXA63Bn8dOhTnjoMFqH69F+ecwh+oZWNJ1aUnrSfIR0HrvSpODhjKCiAfkykQUDcWFscdf0XklT4N05M04Kjx1MA4XmoDlzMJi8h5aoLbrc3joKpXtR/2+IXYkNq8f+Z82te6HrUY75POgDOY0udCc2kr5VR0PHtm2KoJ1y9sMHdhUW7qymKgcNTDkSAk1dcrqaoSs4hadO8b7w4TCecDhp55DZYqfdPDKRh8Si9A6N7w1ymWU/b/ey+fCQ2YqbyC7HWgGfWakXGYM2ndSmG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqqYG6k+9NVM2K/b6FA1NtDOVOmjZci76+j5VLdxuPo=;
 b=NT83T1FXyryj5fMjbqlPv8HkiVJLYBejWklkHUV/SX4/oTHyGyYRkJKzBpVClIpiAYbE9jSfGoA3QZX5VgdPQs6FjMfCmDD/J3XOAPRN64CXlmNZEy0vS+bYuYtvIjREQdBaYcTUrp8VlBZYF+Jim2zUlk9UygOjMy8We06dh+v7wgY8UELzchFTPpxttyLOcbDKYzQ5Rm49Lie/kvUPenVEs2SRaMmwjKHbMTIR5x3MzkB3omEWW7PHCj7JaYaMD22bxmr1MGYuMdvWk6HpWwZ+vXvHvXLVRX98Ru1R2ErFDPBTIrbqe9RCn5ipXri5TFRvQpd8TolS7O4ykx1noA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqqYG6k+9NVM2K/b6FA1NtDOVOmjZci76+j5VLdxuPo=;
 b=Z6laoXezyLYRBi77Q5vXOsHl0gOeiWr4T74ry0WCkb0dmes9NpYnb936p+TIIiWmy4wKQwd6QkOxlUdvFfRuzPk8cLVb0HcfN/DXAmDiLf8XPNobm6aQTQypaF0jeCu+S6wI0CnGtQrQgL3CpeCXMfHnMeAtQ5Qlk2JRR32GdsFEa5tYqlFD6Ikt+/mw7zjDt+u1qB/HHP/GA485cRHJUcwAYjxVNVmx/W2AGirmUkt0STwwPMax6wE5bykrL1M02H6XueEFWgbVhd1kCK4JrtfewYTxsDjZhPdsFaMYDgryn9Phx4SHTafym6AdtGxiw+lnGpFmdBIqfynZ5XPdRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5122.namprd12.prod.outlook.com (2603:10b6:610:bd::12)
 by PH8PR12MB7255.namprd12.prod.outlook.com (2603:10b6:510:224::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 23:37:31 +0000
Received: from CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::7aa1:70ee:5030:b0df]) by CH0PR12MB5122.namprd12.prod.outlook.com
 ([fe80::7aa1:70ee:5030:b0df%7]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 23:37:31 +0000
Message-ID: <e2500b3e-7ba4-45a9-ba67-4b6a24ecc25f@nvidia.com>
Date: Thu, 18 Jan 2024 15:37:23 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
From: Erik Kurzinger <ekurzinger@nvidia.com>
Subject: [PATCH i-g-t v2] tests/syncobj_timeline: test delayed submission
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To CH0PR12MB5122.namprd12.prod.outlook.com
 (2603:10b6:610:bd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5122:EE_|PH8PR12MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: 00e01b1c-cbfd-4562-283a-08dc187e704d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aKGycA6vqVNlmQb4Sim/V8HguQekPQMTDDXg5Jyfxk34EMcI1+3c0wmf9hrf1aQBSb/uq/e8cUSTEeG2JxSJ0woioaBhFn5IK/yAjLcITHzml/wIcONw30EvkAshI066HkycZMSayakXo88w72aqhlFq1u3iUR/6ynsVXD0RvGX/27255JBSGvGdsJ1wP2Fhqpxak1amL8u4odQ+wGhUxfeE5nmYMCy9PFSF4OIt8pfYgW9oye9Y6O9OEt9xz6DeCf3t5T19muOj6eFr/LnrRhcfJaGQTuvqOi0JRgbBc4iLbFsLN0J231x2StpX05ZT39rG5dkyLEfl+0j9sB5fzfbUT4URbnwi4Sal7Exsz1Z6HT1IGzEbhsUdZywIxSu8/nHylizLZLejDPD4HNzC7almYNyWM+Uf9zmL9wfdMN1WQvKgMOUWFFG3P77zpOLK3Vr4RwSZkoW0B+HkivI77bAgwJ6sqTNGWTE9QrMmaVu+6+EDlF1dsw8xSXxMk8XB9Xl5DAEwPob5sgoNCu2Z4XQGQPjwTTUWdaM5wLnH+aU6oi8DkTTky050qL8rp2PPD7vE0dr+Q7S/2aHkwscIONyLZcryjCReWUWkR5LVrZYbP5INhVrV8qroIIY4dD9ayQIWT3cMqZOtvgFVAQmsbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5122.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(39860400002)(136003)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(31686004)(2906002)(66476007)(26005)(6512007)(66556008)(8936002)(4326008)(8676002)(6506007)(316002)(6486002)(6666004)(66946007)(6916009)(5660300002)(2616005)(478600001)(38100700002)(83380400001)(86362001)(31696002)(36756003)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWNsT2k3VnNnaFFCYUlwci9Ickp5MHpNckYyOTc2eEJqdGs5LzZqTGYrY1VS?=
 =?utf-8?B?bERnYms0emdYbHN2Ky91bi9kTys2MGxBZWYvb1ByRmp5bFl6K2U4Ykg3RkEz?=
 =?utf-8?B?V0YrT0RxUExhb3Bqa3hNNXQyY3lNQktYYnJabEtEN1hJVUxSdHhsWjBIalF3?=
 =?utf-8?B?RnlFdkJXWElNUzhYenNUbEpnNzArSWtRazhsanA0ekFuWGNnSHEvUXNrV2dq?=
 =?utf-8?B?ZCtjUWFXWVBJQ2hsazhlVFF6Tmx0bzJQczlMUG5FMHA5LzEwNkxZb0FXTEJ4?=
 =?utf-8?B?R0lTT2NubkxibG0wdXZabHl2SmMrVDNWOFlmYU5OUHJ1Z0RoMVhHNFZqRVRq?=
 =?utf-8?B?YjZ5R2lVR0Vxd3BkRk5nSEdLb3ZGejViWDdBbEJRVzkyS0ZOQlcwZjg0VW8y?=
 =?utf-8?B?Y2Y4Zi8vallVdDRwdVhrWjZNNUNESGNaM3ZzNHdPV3hIZmV3a0hhaHk2Tnpa?=
 =?utf-8?B?Z25nYzRLcmhkektUam00UTRzQ2ZTWmI2Ukh4Z0N5c2R3VzE3Y25qWERtc1E5?=
 =?utf-8?B?QXhCS2lwZ3JFaUE0WkdwVFRTME41YjEwVVVtcEdqVWJDckNPLzlCbFNGMm00?=
 =?utf-8?B?MjhwVFlGQnA2MVh6V09qcmJTcjF5ajBQSHQvWHc0U1krTzVEYWJQeEhPRVl1?=
 =?utf-8?B?M1lJdnNJK1o2VXdzMVRIL285Wis2VFIrMUx3NWZKTSsxNkpCMHlLaXZ6b0VZ?=
 =?utf-8?B?L2VVa2QrK1RieEhxSzQzK25iR1NXS3ZKdC8vR3hmTGkwblB3dVh4NXB3UFVM?=
 =?utf-8?B?NEZOVVhUWTMzaFVJa3JlUk1TbUt1RlBGRW11OWlWOGNYdW9idFRQMHRwWG5w?=
 =?utf-8?B?eVc3WG1UVVp1SXpjbURjVkFMTG9XNW0wS2N3SHVVOHhXTElid3U5ZUQ5aW5u?=
 =?utf-8?B?Y2lzNWx3NUR4NnVyeVlTKzlGb3hNTGFZQTFkTStrQVBOSTVRbzVjTmJkNVFh?=
 =?utf-8?B?cExVbUhhMzZuNW5yektkR0E5OWVWbWNWMmRnRHFmOUJKRS9wbFBCWWZHVmxq?=
 =?utf-8?B?T1RINXhoRWFuUDBMcWN1eGloeXJyYkZrdmliZWUwTWdaZG9GVG01NVcwbTY5?=
 =?utf-8?B?YnZZd0hEMjNTY3ZxTEJFT29vMndsa2owcGhkNitVUjRvRnVYdDdBLzNYN0Jz?=
 =?utf-8?B?WlRGZjVQMnhmNG13eUNFRm5XTmswajJoZWdldTcvMFB3U3FGemJlVXA5Qnhi?=
 =?utf-8?B?bXMwbHBIVkl0blFqVndCVnd1TnRNR09RRXZaMVNNL2pSR1RtcWVkMitaLzFt?=
 =?utf-8?B?MmJTQk5VSGFycVFmVWk2R1o0MmFmemFZWWp2RGxIVlRqNTNPR3lmVTF5a0JK?=
 =?utf-8?B?USsyMnQ5UGZmYzkyNDlDWjBqeVZlQzcrTEpJWTlJTkxUUjYrZ1FyUTNJNG05?=
 =?utf-8?B?cTVtWCs1YmtBTlVCMUhoeUs4TTUwandpbnkrWFdOK2VxdFhna2h1YmVMOXFl?=
 =?utf-8?B?Z3pTQW55UTJPWlVCVGZQSTZtM0dhOEI1YTJFU1NNbGoxM0t1TXZuZzZKemFx?=
 =?utf-8?B?bVdwSCtlL2doU0g5NmVSTXpJL2diemFaWTk4M1pqQTVjM1hmQnFhdzVqZktH?=
 =?utf-8?B?ekhYd1ZySzRtWXM3ODJqUkdjb0tGNlZIS2xOOU5IYUszSWo3MU9vVHlwYUt6?=
 =?utf-8?B?WVZjdUw2OWhYRllDaFFjVGFvai9iMkFtWnZyY0ZmU1NFR3RnY05MbVFVcHZK?=
 =?utf-8?B?M1l1WUplYmJpdk5XWHRCY1RSaEtyMDV6R0oxUGRTL1FVVk5rbE9vMjFwKzNp?=
 =?utf-8?B?MU81TjRHTXQvSGlDOVU3aTFQbzlPUUJPWGhBYVJaSUIzU1ZRMlRMdDBhSFo2?=
 =?utf-8?B?OTRMdkk1VW96L0VxelVLcHhicjJvbVgrMFJFRm8vZElUQVpoRUNkampCZkY3?=
 =?utf-8?B?UHVmWDBwUjYzV2FnTFF2Y1FGcnZ6Uk1IdEVoNXNJdWJveGhjVXVwVm5rZzg0?=
 =?utf-8?B?N1NVaWQ5cVNlaFdLazVnczhRVmtPdzdSVkRtNHRiZHl1bXFpdFJWa0p4NXIw?=
 =?utf-8?B?NDZnN1JtaG9EZkI3a3NhSXZ5WnV5bkloeko3R3NJbndWRkdMRHRCTVhwb3Zx?=
 =?utf-8?B?c1VtSFVqeDAwUTlHbzU4cDROeGQrTnNWbzArYitrY0IybVR6RlBqRDdGU21l?=
 =?utf-8?B?TkFaMHI5SmtEYW1NKzMzdXpGWkRhSHJpa0FUT3JFRGhNT2Z6YlAxTk5IajQ3?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e01b1c-cbfd-4562-283a-08dc187e704d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5122.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 23:37:30.9827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5crlXXg9eJ/lLohGAlbkTlBbLlllSYhbm6iIaTdHLcWxXQwKvG66k9hxrmIDFBuaLcwbL15IlXQWfUON2mUJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7255
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

The syncobj_timeline test suite includes cases where
drmSyncobjTimelineWait is called with the WAIT_FOR_SUBMIT flag before
the timeline point has been submitted. Then, after a short delay, the
timeline point does get submitted and signaled and the test verifies
that the drmSyncobjTimelineWait call is unblocked as expected.

Alas, while this was working correctly with the WAIT_FOR_SUBMIT flag, if
the WAIT_AVAILABLE flag is used instead the wait will *always* block for
the full timeout duration even if the timeline point is submitted
earlier due to a bug in the kernel. The return value would still
indicate that the wait completed successfully, though. That is, it
wouldn't return -ETIME.

To ensure test coverage for such a scenario, this change adds delayed
submission test cases which use the WAIT_AVAILABLE flag. These will be
similar to the WAIT_FOR_SUBMIT cases mentioned above except that, after
the delay, the timeline point will only submitted, not signaled.

Furthermore, it adds an assertion that the drmSyncobjTimelineWait call
returned *before* the timeout expired, which it always should since the
timeout is a full 100ms longer than the delay.

v1 -> v2: added documentation for new test cases

Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
---
 tests/syncobj_timeline.c | 46 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index ea8341a30..25ccd6889 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -394,6 +394,9 @@
  * SUBTEST: wait-all-for-submit-delayed-submit
  * Description: Verifies wait behavior on a timeline syncobj with a delayed signal from a different thread
  *
+ * SUBTEST: wait-all-available-delayed-submit
+ * Description: Verifies wait behavior on a timeline syncobj with a delayed submit from a different thread
+ *
  * SUBTEST: wait-all-for-submit-snapshot
  * Description: Verifies waiting on a list of timeline syncobjs with different thread for wait/signal
  *
@@ -425,6 +428,9 @@
  * SUBTEST: wait-for-submit-delayed-submit
  * Description: Verifies wait behavior on a timeline syncobj with a delayed signal from a different thread
  *
+ * SUBTEST: wait-available-delayed-submit
+ * Description: Verifies wait behavior on a timeline syncobj with a delayed submit from a different thread
+ *
  * SUBTEST: wait-for-submit-snapshot
  * Description: Verifies waiting on a list of timeline syncobjs with different thread for wait/signal
  */
@@ -490,6 +496,13 @@ syncobj_trigger(int fd, uint32_t handle, uint64_t point)
 	close(timeline);
 }
 
+static void
+syncobj_submit(int fd, uint32_t handle, uint64_t point)
+{
+	int timeline = syncobj_attach_sw_sync(fd, handle, point);
+	close(timeline);
+}
+
 static timer_t
 set_timer(void (*cb)(union sigval), void *ptr, int i, uint64_t nsec)
 {
@@ -534,8 +547,17 @@ syncobj_trigger_free_pair_func(union sigval sigval)
 	free(pair);
 }
 
+static void
+syncobj_submit_free_pair_func(union sigval sigval)
+{
+	struct fd_handle_pair *pair = sigval.sival_ptr;
+	syncobj_submit(pair->fd, pair->handle, pair->point);
+	free(pair);
+}
+
 static timer_t
-syncobj_trigger_delayed(int fd, uint32_t syncobj, uint64_t point, uint64_t nsec)
+syncobj_delayed_operation(int fd, uint32_t syncobj, uint64_t point, uint64_t nsec,
+			  void (*operation)(union sigval))
 {
 	struct fd_handle_pair *pair = malloc(sizeof(*pair));
 
@@ -543,7 +565,7 @@ syncobj_trigger_delayed(int fd, uint32_t syncobj, uint64_t point, uint64_t nsec)
 	pair->handle = syncobj;
 	pair->point = point;
 
-	return set_timer(syncobj_trigger_free_pair_func, pair, 0, nsec);
+	return set_timer(operation, pair, 0, nsec);
 }
 
 static const char *test_wait_bad_flags_desc =
@@ -942,18 +964,26 @@ test_wait_delayed_signal(int fd, uint32_t test_flags)
 	uint64_t point = 1;
 	int timeline = -1;
 	timer_t timer;
+	uint64_t start_time;
 
 	if (test_flags & WAIT_FOR_SUBMIT) {
-		timer = syncobj_trigger_delayed(fd, syncobj, point, SHORT_TIME_NSEC);
+		timer = syncobj_delayed_operation(fd, syncobj, point, SHORT_TIME_NSEC,
+						  syncobj_trigger_free_pair_func);
+	} else if (test_flags & WAIT_AVAILABLE) {
+		timer = syncobj_delayed_operation(fd, syncobj, point, SHORT_TIME_NSEC,
+						  syncobj_submit_free_pair_func);
 	} else {
 		timeline = syncobj_attach_sw_sync(fd, syncobj, point);
 		timer = set_timer(timeline_inc_func, NULL,
 				  timeline, SHORT_TIME_NSEC);
 	}
 
+	start_time = gettime_ns();
 	igt_assert(syncobj_timeline_wait(fd, &syncobj, &point, 1,
-				gettime_ns() + SHORT_TIME_NSEC * 2,
+				start_time + SHORT_TIME_NSEC * 2,
 				flags, NULL));
+	/* ensure we were unblocked before the timeout expired */
+	igt_assert(gettime_ns() - start_time < SHORT_TIME_NSEC * 2);
 
 	timer_delete(timer);
 
@@ -1809,6 +1839,10 @@ igt_main
 	igt_subtest("wait-for-submit-delayed-submit")
 		test_wait_delayed_signal(fd, WAIT_FOR_SUBMIT);
 
+	igt_describe(test_wait_delayed_signal_desc);
+	igt_subtest("wait-available-delayed-submit")
+		test_wait_delayed_signal(fd, WAIT_AVAILABLE);
+
 	igt_describe(test_wait_delayed_signal_desc);
 	igt_subtest("wait-all-delayed-signal")
 		test_wait_delayed_signal(fd, WAIT_ALL);
@@ -1817,6 +1851,10 @@ igt_main
 	igt_subtest("wait-all-for-submit-delayed-submit")
 		test_wait_delayed_signal(fd, WAIT_ALL | WAIT_FOR_SUBMIT);
 
+	igt_describe(test_wait_delayed_signal_desc);
+	igt_subtest("wait-all-available-delayed-submit")
+		test_wait_delayed_signal(fd, WAIT_ALL | WAIT_AVAILABLE);
+
 	igt_describe(test_reset_unsignaled_desc);
 	igt_subtest("reset-unsignaled")
 		test_reset_unsignaled(fd);
-- 
2.43.0


