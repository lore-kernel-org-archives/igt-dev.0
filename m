Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3DA10E32C
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Jan 2023 12:06:54 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 31 Jan 2023 14:06:40 +0200
Message-Id: <20230131120646.27434-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/6] tests/kms_async_flips: Test format
 modifiers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Fix up some issues in kms_async_flips, and remove most of
the hardcoded modifier stuff. Instead we can simply iterate
through all the modifiers reported by the plane.

Cc: Arun R Murthy <arun.r.murthy@intel.com>

Ville Syrjälä (6):
  tests/kms_async_flips: Add missing igt_put_cairo_ctx()
  tests/kms_async_flips: Render the bars full height
  tests/kms_async_flips: Ger rid of i915 specific fb creation
  tests/kms_async_flips: Run the test only once per pipe
  tests/kms_async_flips: Split test_init()
  tests/kms_async_flips: Test all modifiers

 tests/kms_async_flips.c | 118 +++++++++++++++++++++++++---------------
 1 file changed, 75 insertions(+), 43 deletions(-)

-- 
2.39.1
