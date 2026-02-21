Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1D4C5DF70
	for <igt-dev@archiver.kernel.org>; Sat, 21 Feb 2026 03:21:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5CF10E866;
	Sat, 21 Feb 2026 03:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2QEhuNm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF57D10E10E
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Feb 2026 03:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771644068; x=1803180068;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jEW1XqrjMB23aLT6JCokD1AKXcZ1jKvZBnUR6AZKYAw=;
 b=g2QEhuNmEyJSvsH+lbRtHhV2wbb7q5UnJFPoIl5RGmzDADgwx8ZmY1Us
 sk4AzdgYqyCG16lFfX/SNduBVXZuOt+HDIpEmKhwWxAs0WuI76hoawg2d
 G/OVmufaGjyh04zbx/p3frctbHe0YQDik7mCZnAPZ9j+VPosNi8CXzBB9
 gPzUQSE2KBxLA4HZzpS3dbJwYYybRusuhoYXYU9QHm0Gwu+iwpkWiajht
 803n0RSms/D27ZLuWdSNN5QoOSEx3xpw3KCp9WO6MMBHmk2Vupye8PA2D
 ufNxUYFSWnlheocvb0eDoEknHbDNRgcXiB2aBkCfd3m5q3sNWyRscJ18A Q==;
X-CSE-ConnectionGUID: RiHFdqLZReeZhC55iZ8org==
X-CSE-MsgGUID: U55tV9n0SX+MdBKMo5qQvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84187216"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="84187216"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:21:08 -0800
X-CSE-ConnectionGUID: 77lCKi/qRJmyrIb/FObz3Q==
X-CSE-MsgGUID: kGWcZPslTEqHdagtLf6mJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214256433"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:21:08 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 16/23] tests/kms_tiled_display: Use igt_crtc_t
 instead of enum pipe
Date: Sat, 21 Feb 2026 05:19:55 +0200
Message-ID: <20260221032003.30936-17-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Convert kms_tiled_display from 'enum pipe' to 'igt_crtc_t'.

The data.pipe member gets directly replaced with data.crtc.

 #include "scripts/iterators.cocci"

@find_data@
typedef igt_crtc_t;
typedef igt_display_t;
identifier PIPE;
type T;
@@
T {
  ...
- enum pipe PIPE;
+ igt_crtc_t *crtc;
  ...
};

@depends on find_data@
identifier find_data.PIPE;
identifier DISPLAY;
find_data.T S;
find_data.T *P;
expression _PIPE;
@@
igt_display_t *DISPLAY = ...;
<...
(
- S.PIPE = _PIPE;
+ S.crtc = igt_crtc_for_pipe(display, _PIPE);
|
- P->PIPE = _PIPE;
+ P->crtc = igt_crtc_for_pipe(display, _PIPE);
)
...>

@depends on find_data@
identifier find_data.PIPE;
identifier DISPLAY;
find_data.T S;
find_data.T *P;
expression E;
@@
igt_display_t *DISPLAY = ...;
<...
(
- S.PIPE = E
+ S.crtc = igt_crtc_for_pipe(DISPLAY, E)
|
- P->PIPE = E
+ P->crtc = igt_crtc_for_pipe(DISPLAY, E)
)
...>

@depends on find_data@
identifier find_data.PIPE;
find_data.T S;
find_data.T *P;
expression E;
@@
(
- igt_crtc_for_pipe(..., S.PIPE)
+ S.crtc
|
- igt_crtc_for_pipe(..., P->PIPE)
+ P->crtc
|
- kmstest_pipe_name(S.PIPE)
+ igt_crtc_name(S.crtc)
|
- kmstest_pipe_name(P->PIPE)
+ igt_crtc_name(P->crtc)
)

@depends on find_data@
find_data.T S;
find_data.T *P;
@@
(
- S.crtc = S.crtc;
|
- P->crtc = P->crtc;
)

@depends on find_data@
identifier find_data.PIPE;
find_data.T S;
find_data.T *P;
@@
(
- S.PIPE
+ S.crtc->pipe
|
- P->PIPE
+ P->crtc->pipe
)

@depends on find_data@
find_data.T S;
find_data.T *P;
binary operator OP = { ==, != };
@@
(
- S.crtc->pipe OP PIPE_NONE
+ S.crtc OP NULL
|
- P->crtc->pipe OP PIPE_NONE
+ P->crtc OP NULL
)

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
typedef igt_display_t;
identifier DISPLAY;
@@
- igt_display_t *DISPLAY = ...;
... when != DISPLAY

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_tiled_display.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index f587704eebe1..374ea0bf6a85 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -65,7 +65,7 @@ IGT_TEST_DESCRIPTION("Test for genlocked CRTCs with tiled displays");
 typedef struct {
 	igt_output_t *output;
 	igt_tile_info_t tile;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	drmModeConnectorPtr connector;
 	bool got_page_flip;
 } data_connector_t;
@@ -213,7 +213,6 @@ static int mode_linetime_us(const drmModeModeInfo *mode)
 
 static void setup_mode(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	int count = 0, prev = 0, i = 0;
 	bool pipe_in_use = false, found = false;
 	igt_crtc_t *crtc;
@@ -238,7 +237,7 @@ static void setup_mode(data_t *data)
 
 			if (count > 0) {
 				for (prev = count - 1; prev >= 0; prev--) {
-					if (crtc->pipe == conns[prev].pipe) {
+					if (crtc->pipe == conns[prev].crtc->pipe) {
 						pipe_in_use = true;
 						break;
 					}
@@ -248,15 +247,15 @@ static void setup_mode(data_t *data)
 			}
 
 			if (igt_pipe_connector_valid(crtc->pipe, output)) {
-				conns[count].pipe = crtc->pipe;
+				conns[count].crtc = crtc;
 				conns[count].output = output;
 
 				igt_output_set_crtc(conns[count].output,
-						    igt_crtc_for_pipe(display, conns[count].pipe));
+						    conns[count].crtc);
 				break;
 			}
 		}
-		igt_require(conns[count].pipe != PIPE_NONE);
+		igt_require(conns[count].crtc != NULL);
 
 		for (i = 0; i < conns[count].connector->count_modes; i++) {
 			mode = &conns[count].connector->modes[i];
@@ -326,11 +325,10 @@ static void setup_framebuffer(data_t *data)
 
 static data_connector_t *conn_for_crtc(data_t *data, unsigned int crtc_id)
 {
-	igt_display_t *display = &data->display;
 	for (int i = 0; i < data->num_h_tiles; i++) {
 		data_connector_t *conn = &data->conns[i];
 
-		if (igt_crtc_for_pipe(display, conn->pipe)->crtc_id == crtc_id)
+		if (conn->crtc->crtc_id == crtc_id)
 			return conn;
 	}
 
-- 
2.52.0

