Return-path: <SRS0=aXFB=TA=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B3A10E956
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Feb 2022 10:52:20 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id z16so4676126pfh.3
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Feb 2022 02:52:20 -0800 (PST)
From: "K. Eugene Carlson" <kvngncrlsn@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Feb 2022 19:49:22 +0900
Message-Id: <20220217104923.23135-1-kvngncrlsn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] tools/intel_gpu_top: Restore terminal attributes on quit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: kvngncrlsn@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Save initial terminal attributes when in interactive mode, and reset
when the program quits or receives SIGINT. Prevents bad text entry
in some password prompts (e.g., su, passwd).
