Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387CA11B84F
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jul 2022 23:20:47 +0000 (UTC)
From: Rohith Iyer <quic_rohiiyer@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 28 Jul 2022 16:20:30 -0700
Message-ID: <20220728232033.589-1-quic_rohiiyer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v4 0/3] kms_writeback enhancements
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add support for testing built-in or custom modes for kms_writeback,
support for dumping output buffer to png file, and standardize mode 
string formats with igt_parse_mode_string helper.

This patch series was originally a standalone patch, based on review
comments, is being resent as this series.

Link to original patch: https://patchwork.freedesktop.org/patch/490780/?series=105522&rev=6

Changes in this series:
 - Changed name of "standard" modes to "built-in".
 - Added new environmental variable, $FRAME_PNG_FILE_NAME for specifying filename.
 - Created igt_parse_mode_string to standardize mode string format.
 - Called igt_parse_mode_string instead of sscanf.

Changes made in V4:
 - Added header for writeback mode list
 - Corrected commit text and documentation
 - Changed *mode_string to a const char from char
 - Changed built-in mode short option from -s to -b for clarity

Rohith Iyer (3):
  lib/igt_kms: Add helper to parse mode string
  tests/testdisplay: Use igt_parse_mode_string for command line
    arguments
  tests/kms_writeback: Enhance kms_writeback for custom modes

 lib/igt_kms.c         |  26 +++++++
 lib/igt_kms.h         |   1 +
 tests/kms_writeback.c | 175 ++++++++++++++++++++++++++++++++++++------
 tests/testdisplay.c   |   8 +-
 4 files changed, 181 insertions(+), 29 deletions(-)

-- 
2.31.0
