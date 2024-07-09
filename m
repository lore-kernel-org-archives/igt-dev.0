Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A66C3DA41
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1798B10E5C5;
	Tue,  9 Jul 2024 15:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CfA7mOE0";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E2C10E5AE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:34:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AEB120018;
 Tue,  9 Jul 2024 15:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ez7F8+5uRxZDbRxExu0c416eKC4ILbOtRS3JP9TVoiI=;
 b=CfA7mOE0pJY9I6aLL2hwirYDFBxlNSQUPqO4Eu9g1OUHAx5f0HU5dcBoqcnAIoClcJxk9S
 25kdmdMYSEewjFAX3a6YtUURGA+Q2En+QDRP12MiAlHOiYuSllmidLcJ+plWzMq5htwX5h
 c7TUepuU9tysXp1UYFNKMlcAzV90Hh32qG+pWyX+vF6C4F60acsIF6ScnT1vR8V1o9AHH6
 4X193cLBQOuuQMa3j39lahV5Q+zpZIH8Kco/XE3Ur2Ms6HT2nKEvjGc70mGtkrCUaRw5sI
 5S8mgNPErvr3bu+P0dgYSwnHNOqjcFgtaElnJOFZRdtEDDsz3pD0RatS3ieN0w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:26 +0200
Subject: [PATCH i-g-t v2 10/39] lib/monitor_edids: Add new EDID for HDMI 4k
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-10-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=W7JkUSvNMr++kfa+yw5Cacgt13n5GUbPs146+Z6dXo0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViXjw/XJhz6/8TmpeIgPxWlbsq4iaexx480N
 wlKi1cN77WJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YlwAKCRAgrS7GWxAs
 4vVCD/9uf3HBLQJnZU/eMDCucORdLWGosaACt+zQqVCsoZSt/6Dq42PmkxOkSrfWUt36TRGDGak
 TDGvSm57rlijRaPR3PSKGZjIJwxiaXg2AP8Ww2LQX/OVv0Dyv4y5krM+J3p1KcGr6dIR6DORApp
 aG2afKOtqTfhS2ouAx7ZPdqyhFgaelN43uuYkZELrfiQTCAN7ubG0wheG7RXExmf7ivuQscqwjG
 Z7+PW1ELNok7vesgCsVmeNveGqy8a/S6oMU3ddum2uOrPJREp1WnRBWp/3OSU3umuGNiMS8T/hm
 yvsmzDLm2AMFPNWkKKsMpeW9bwr6+iCNN16AXz1CguezuHeJtFY9cT4ue2ZXeyfAjNwttPIjb9F
 j3LipPglKjWrCp5as/37j4n6cpY8Wc5jINsdlA0KNeS27LJCyM+Pv46EQOk2oUhbuqDyFvQx4aI
 0fVoW72VjJQuvY0Uv7uWgsobIy4xSVL5KzC1l46HsD0crs4eXh/MFkhL1MFmvRH1UFL+OemQEOg
 yNTU+MJFn/6/kGzPQNSQCn849DJn5pqFuHmzALlJF/6Erc9g9O74NVUF/AUtBTI/ackRaObBGmz
 OB6u5z4GsllL8VTPaTurNQe32WYuMzmNzJkU/+Q7oeLNaCqrUbwXMmPlLtPkLhzy95EwhJyn8if
 C3K6x+by28AwN3Q==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

Add EDID for the HDMI screen LG HDR 4K.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/monitor_edids/hdmi_edids.h | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
index 8bcd1f31b458..cc6820d96231 100644
--- a/lib/monitor_edids/hdmi_edids.h
+++ b/lib/monitor_edids/hdmi_edids.h
@@ -49,7 +49,23 @@ monitor_edid HDMI_EDIDS_4K[] = {
 		  "5E00A0A0A0295030203500C48F210000"
 		  "1EEF5100A0F070198030203500C48F21"
 		  "00001E000000000000000000000000A8" },
-
+	{ .name = "4K_GSM_LG_HDR_4K_HDMI",
+	  .edid = "00ffffffffffff001e6d4f77c75f1500"
+		  "0521010380462878ea7ba1ae4f44a926"
+		  "0c5054210800d1c06140454001010101"
+		  "010101010101a0cb0046f0703e802010"
+		  "3500b9882100001a000000fd00283c1e"
+		  "873c000a202020202020000000fc004c"
+		  "472048445220344b0a202020000000ff"
+		  "003330354d414e4a43335a37350a01e4"
+		  "0203427223090707830100004d010304"
+		  "10121f202261605f5e5d6d030c001000"
+		  "b83c20006001020367d85dc401788003"
+		  "e30f0003e2006ae305c000e606050159"
+		  "5952a36600a0f0701f8030203500b988"
+		  "2100001a565e00a0a0a0295030203500"
+		  "b9882100001a023a801871382d40582c"
+		  "4500b9882100001a00000000000000af" },
 };
 
 monitor_edid HDMI_EDIDS_NON_4K[] = {

-- 
2.44.2

