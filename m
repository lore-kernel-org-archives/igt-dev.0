Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E0D10E35D
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 11:47:07 +0000 (UTC)
Date: Mon, 13 Nov 2023 11:46:45 +0000
To: juhapekka.heikkila@gmail.com
From: Simon Ser <contact@emersion.fr>
Message-ID: <RBv73V9tBY5v9RoBCCo0x8DrwaKptu65pORGT5K-wBmHBSfM0IXu4ZhW9fzNY5iGhSXZZCOZ0_uq9dYhMmBlxhC6C134AhoOrcGR8IsMF-Q=@emersion.fr>
In-Reply-To: <f4924d25-142d-458d-bdbd-ee4b799e5308@gmail.com>
References: <20231113094353.1232575-1-bhanuprakash.modem@intel.com>
 <8HEEyr-hZOCEfFX_B7QVCqB5hDIu6JDdaZPl1vyqw6Ep-AMyApTLBdgROVNAKPiKb6fXfAr-Yqz-HcQ4evk3knZ-lGv5F9xjpILCCztDf4c=@emersion.fr>
 <11ff717a-06d2-49fd-b73d-0a372f1c80c8@gmail.com>
 <-X2kuWRq8oIQ1Lco4I-MR9aiuCxru-OYWgvZpjoaH-Vhou2l_0l7ojH97Xet1fRob4VpnlImB3BpP-lC0rTo80o4-xAYiK2hbo1_YgyD2ew=@emersion.fr>
 <7e113968-b406-4753-a407-a7fc8ee3e908@gmail.com>
 <i8_3cM1wQXQV0rRJ1PxYHAe03idImtlCfV5UXOCcGrCxTt0ta1pjY0SuhPZvLTIyXqtLco3NawRlMKPy5ANYBwChb6oXvdQ2xcAKLF6QPdo=@emersion.fr>
 <f4924d25-142d-458d-bdbd-ee4b799e5308@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [i-g-t] Revert "syncobj_timeline: don't expect EINVAL
 for WAIT_UNSUBMITTED, | WAIT_AVAILABLE"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Apologies. Jani highlights that the bugfix does update the testlist
(dynamically generated), and I completely missed that. The CI failure
makes a lot more sense now.
