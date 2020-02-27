Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46266EC67
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2020 09:01:56 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Thu, 27 Feb 2020 14:11:49 +0530
Message-Id: <20200227084149.588-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC i-g-t] LPSP igt test on TGL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

+-------------------------------------------------------------------------------+
|                                                                               |
|                                                                               |
|                                                                               |
|   +--------------------+        +-------------+         +------------+        |
|   |                    |        |             |         |            |        |
|   |    PIPE A          |        | DP/HDMI     |         |   PORT_A   |        |
|   |                    +--------+ TRANSCODER  +---------+            |        |
|   |                    |        |             |         |            |        |
|   +--------------------+        +------------->         +------------>        |
|                                 |             |         |            |        |
|                                 |             |         |   PORT_B   |        |
|                                 |             |         |            |        |
|                                 |             |         |            |        |
|                                 +------------->         +------------>        |
|                                 |             |         |            |        |
|                                 | DSI         |         |   PORT_C   |        |
|                                 | TRANSCODER  |         |            |        |
|                                 +------------->         +------------+        |
|                                 |             |                               |
|                                 |             |                               |
|                                 |             |                               |
|                                 |             |                               |
|                                 |             |                               |
|                                 |             |                               |
|                                 |             |                               |
|                                 +-------------+                               |
|                                                                               |
|                   LPSP on Tigerlake                                           |
|                                                                               |
+-------------------------------------------------------------------------------+

Above block diagram depicts lpsp on TGL, while earlier development of lpsp igt test
it has been assumed that every non-edp panel is not a lpsp panel but it is not true
on TGL, any HDMI/DP panel connected on pipe A and connected to PORT_{A,B,C} is lpsp
panel, and DSI panel is also lpsp panel.

Currently i915_pm_lpsp igt has been categorized in edp-native and non-edp subtest.
non-edp subtest require the fix to validate the lpsp panels.
My solution approach to check the port on which DP/HDMI connector is currently 
connected.
if (port <= PORT_C)
    lpsp_should_be_enabled.
else
    lpsp_should_be_disabled.
 
Currently there are two igt i915_pm_lpsp, i915_pm_rpm require to know the port
of DP/HDMI connector, so we need a igt library function for that.

I am looking to parse the i915_display_info to get the port information, but at 
same time it seems a fragile solution to me as any change in i915_display_info
will break the test, but i don't have any other idea to get the port information.

Please provide your opinion and feedback for the above solution approach.

Thanks,
Anshuman Gupta.
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
