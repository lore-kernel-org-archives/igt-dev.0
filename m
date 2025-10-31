Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FEACCF9F8
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 18:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41C010EC02;
	Fri, 31 Oct 2025 18:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PWXGlX2p";
	dkim-atps=neutral
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149C410EC02
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 18:12:46 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-77f5d497692so3331899b3a.1
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 11:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761934365; x=1762539165; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L/pKxuiKOxJrG8m0YQAea/iaJF3xd0Y5ElaIN3Bghvw=;
 b=PWXGlX2pZfTg3+HHw7By0NWLDhojPq8tJiJGIZvvSwzPT3CTcBJpRadMV14PGF92QK
 NleYlZqFPb9suBlFeCp5zmhXOUcY5BHJ9/2t7CMe/6DQYDthPI/ZJONjAFqWWhIG5WyE
 ZQNTPJ6tt9ApcGse7rDEWBbx92rRbuJm9WERcxjpsGx902gd8D+oraOFl0po1nJgTEuj
 sff+U0RuYFPK1RBAfR26mKk0BVeyrpcmeY6na/ECeXob7CNnebkfAbpWxPPYk466pMV1
 VPXYIfuiBDnflUVrrs8RiE6pcPkgxj3jQD7h/NS3N3tYpTKzGaAcvzTUZ4m2unGsa1Kh
 BEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761934365; x=1762539165;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L/pKxuiKOxJrG8m0YQAea/iaJF3xd0Y5ElaIN3Bghvw=;
 b=BJquFKyj8Ch6YqOjGc/C9fhpyRI3Zfa33ZzjL32Q4MIM/kOhzcjhhlYBCZCatd09Mx
 +tSDX8pkmNsqm903fX+JcW+1UXz75q0p32irUHcVdGUojwof91i5gP3Wq6OuI71f/lN5
 zAP+YN3/A8Eb3je6WbX15Y55agbr0urv1sYGcefK86G2OIRwQBwzjoJX23TXVippNgj8
 JAHfr2snc5mTtAZ19C/87k6OqmTJKFjyLUDfwtOQH8di2lmoyI2MAkXqTqJW+06zQzK9
 Yl/kQzP0G8uewBCNTFuz40h9/Q800/Yddz/8l0y73hj6vm6tPbdKkGlR+JKwusY7LQ4D
 K3yA==
X-Gm-Message-State: AOJu0YztZNyXLajG9DN1iOw/rNWmYGhEHMCWHjrjAgcPakqikUmzVFPW
 Lomjz6cexzhiUFUzEPorAofrGnPy0dNYIR7xELcnB82gWe4NsBu79xpr1UTUhjwE
X-Gm-Gg: ASbGncsjnpDpmyCFRPqymOMBW1vH+LLCK8JQ22VRJ+eKAKG1JGscDUoxqGOzFtkBOzb
 ixMxRL0kC3JCPROIxCSD+RiJWN+6KYmBrH/tWn53TCmNxyrxz/DOc2fd6bx3q3b8b/NSzKYwJj7
 jXPibGUhQQw86Hci0C2h0R9LI5/zblnZPr7+zlo9gLz4J5UKebjBMOsri/2G5i4wDIjKJi3HAgI
 49SPuG/bZS21wdB03dmQGtXF+RJCQKHTTQQpYGLo5WRckWNPpkp9yEeFbAg9ffTW0T1QBTdaN8u
 ltEQ2JrcW2/+J6PJYfVBdzJbpeUc2ptr8ERGiC008qII87utbptl893QgXn9HJNmSm0whe/a17h
 ExrTQYt4YRRkWFoI+m2RZgJd7wqO30Cu+4R15LpLPSnL6tfx+YYJ+YfVyqK+F3UJqkYo9ee9xpd
 qX7WoojoCBV1LsK7G1
X-Google-Smtp-Source: AGHT+IFDaCSIfOHNvC/ps7wQAQd1kSsbMZglpPwGynh2JdXSqWR+CAKrRAyKdYYlUhQGG/f2CGu97A==
X-Received: by 2002:a05:6a00:12e3:b0:7a2:8853:28f6 with SMTP id
 d2e1a72fcca58-7a778fd9926mr5177388b3a.22.1761934365295; 
 Fri, 31 Oct 2025 11:12:45 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a7db0a07cfsm2825413b3a.39.2025.10.31.11.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 11:12:45 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/1] Switch to use kernel standard fault injection in
 i915
Date: Fri, 31 Oct 2025 20:12:11 +0200
Message-ID: <20251031181216.172174-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Here added fault-injection subtest to test kernel standard
fault injection mechanism in i915. 

Much of the meat'n'bones of the test are cut'n'paste from
xe_fault_injection test mostly written by Francois Dugast,
will need to see what parts can be shared with tests and
moved to libigt.

/Juha-Pekka

Juha-Pekka Heikkila (1):
  tests/intel/i915_module_load: Add kernel default faul injection tests

 tests/intel/i915_module_load.c | 282 +++++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

-- 
2.43.0

